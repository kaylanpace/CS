package workorder;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "WorkOrderServlet", urlPatterns={"/workorder"})

public class WorkOrderServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	// Injected DAO EJB:
    @EJB WorkOrderDao workorderDao;
    //@EJB employee.EmployeeDao employeeDao;
 
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of workorders:
       request.setAttribute("workorders", workorderDao.getWorkOrders());
        request.getRequestDispatcher("/workorder.jsp").forward(request, response);
        //request.getRequestDispatcher("/admin-viewWorkOrder.jsp").forward(request, response);
        return;
    }
    
   
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		//workorderDao.openTransaction();
    	
       // Handle a new work order:
    	
        String description = request.getParameter("description");
        String priorityLevel = request.getParameter("priorityLevel");
        String status = request.getParameter("status");
        
        
        if (description != null){
        	workorderDao.persist(new WorkOrder(description, priorityLevel, status));
        	//workorderDao.commitTransaction();
        }
       
        
        doGet(request, response);
    }
}
