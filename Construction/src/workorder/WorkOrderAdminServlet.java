package workorder;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WorkOrderAdminServlet
 */
@WebServlet(name = "WorkOrderAdminServlet", urlPatterns={ "/admin-viewWorkOrders"})
public class WorkOrderAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WorkOrderAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
 // Injected DAO EJB:
    @EJB WorkOrderDao workorderDao;
    @EJB employee.EmployeeDao employeeDao;
 
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	List<WorkOrder> list = workorderDao.getWorkOrders();
        // Display the list of workorders:
       request.setAttribute("workorders", list);
       request.setAttribute("employees", employeeDao.getEmployees());
        request.getRequestDispatcher("/admin-viewWorkOrders.jsp").forward(request, response);
        
        return;
    }
    
   
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    		//.openTransaction();
    	
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
