package items;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import supplies.*;

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
  		public long supplyId = 0;
  		
        public long currentIdSelected=0;
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of supplies:
    	request.setAttribute("supplies", SuppliesDao.getAllSupplies());
    	request.setAttribute("sList", SuppliesDao.getSupplyId());
    	request.setAttribute("sName", SuppliesDao.getSupplyName());
       request.setAttribute("items", itemsDao.getAllItems());
       //set selected supply attributes
       request.setAttribute("description", this.description);
       request.setAttribute("supplyName", this.supplyName);
       request.setAttribute("supplyId", this.supplyId);
       
        request.getRequestDispatcher("/items.jsp").forward(request, response);
        return;
    }
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Handle new supplies:
    	String selected = "";
		String itemName = request.getParameter("itemName");
		int assignedQty = Integer.parseInt(request.getParameter("assignedQty"));
		int remainingQty = Integer.parseInt(request.getParameter("remainingQty"));
		String action = request.getParameter("submit");
		int x=0;
		
		
		
		//variables for a supply selection
		
//		Long gridDelete = (long)0;
//		gridDelete = Long.parseLong(request.getParameter("gridItemId"));
		try {
			selected = request.getParameter("combobox");
			
		    
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
			if(selected !="")
				SuppliesDao.removeSupply(SuppliesDao.getSupplyByName(selected).getId());
			selected="";
			x=2;
		}
		else if (action.equalsIgnoreCase("select")){
			if(selected !=""){
				
			try {
				this.description = SuppliesDao.getSingleSupply(SuppliesDao.getSupplyByName(selected).getId()).getDescription();
				this.supplyName = SuppliesDao.getSingleSupply(SuppliesDao.getSupplyByName(selected).getId()).getSupplyName();
				this.supplyId = SuppliesDao.getSingleSupply(SuppliesDao.getSupplyByName(selected).getId()).getId();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			selected="";
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

