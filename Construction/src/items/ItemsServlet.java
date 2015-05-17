package items;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supplies.*;
import supplies.Supplies;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ItemsServlet", urlPatterns={"/items"})
public class ItemsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	// Injected DAO EJB:
    @EJB ItemsDao itemsDao;
    @EJB SuppliesDao SuppliesDao;
  //variables for a supply selection
  		public String description = "";
  		public String supplyName ="";
  		public String supplyId = "";
    
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of supplies:
    	request.setAttribute("supplies", SuppliesDao.getAllSupplies());
    	request.setAttribute("sList", SuppliesDao.getSupplyId());
    	request.setAttribute("sName", SuppliesDao.getSupplyName());
       request.setAttribute("items", itemsDao.getAllItems());
       
       request.setAttribute("description", this.description);
       request.setAttribute("supplyName", this.supplyName);
       
        request.getRequestDispatcher("/items.jsp").forward(request, response);
        return;
    }
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Handle new supplies:
    	long selected = 0;
		String itemName = request.getParameter("itemName");
		int assignedQty = Integer.parseInt(request.getParameter("assignedQty"));
		int remainingQty = Integer.parseInt(request.getParameter("remainingQty"));
		String action = request.getParameter("submit");
		int x=0;
		
		
		
		//variables for a supply selection
		String description = "";
		String supplyName ="";
//		Long gridDelete = (long)0;
//		gridDelete = Long.parseLong(request.getParameter("gridItemId"));
		try {
			selected = Long.parseLong(request.getParameter("combobox"));
			
		    
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		if(action.equalsIgnoreCase("deleteRow")){
			x=1;
			try {
				
				//if(gridDelete>0)
					//itemsDao.removeItem(1);
					
			} catch (NumberFormatException e) {}
			
		}
		
		else if (action.equalsIgnoreCase("delete")){
			if(selected >0)
				SuppliesDao.removeSupply(selected);
			selected=0;
			x=2;
		}
		else if (action.equalsIgnoreCase("select")){
			if(selected >0)
				
			this.description = SuppliesDao.getSingleSupply(selected).getDescription();
			this.supplyName = SuppliesDao.getSingleSupply(selected).getSupplyName();
			this.supplyId = SuppliesDao.getSingleSupply(selected).getId().toString();
			selected=0;
			x=4;
		}
		else if (action.equalsIgnoreCase("add")){
        	itemsDao.persist(new Items(itemName, assignedQty, remainingQty));
        	x=3;
        }
        
		 System.out.print("value of x is "+x);
		 x=0;
        
        doGet(request, response);
    }
}

