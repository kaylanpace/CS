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
    
    
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of supplies:
    	request.setAttribute("supplies", SuppliesDao.getAllSupplies());
    	request.setAttribute("sList", SuppliesDao.getSupplyId());
    	request.setAttribute("", SuppliesDao.getSupplyName());
       request.setAttribute("items", itemsDao.getAllItems());
      
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
		
		
		try {
			selected = Long.parseLong(request.getParameter("sName"));
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		if (action.equalsIgnoreCase("delete")){
			if(selected >0)
				SuppliesDao.removeSupply(selected);
		}
		
		 if (action.equalsIgnoreCase("add")){
        	itemsDao.persist(new Items(itemName, assignedQty, remainingQty));
        }
        
         
        
        doGet(request, response);
    }
}

