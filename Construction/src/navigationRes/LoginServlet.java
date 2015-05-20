package navigationRes;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workorder.WorkOrderDao;
import employee.Employee;
import employee.EmployeeDao;

/**
 * Servlet implementation class NavigationServlet
 */
@WebServlet(name="LoginServlet" , urlPatterns={"/login"})
public class LoginServlet extends HttpServlet {
	public class EmployeeServlet extends HttpServlet {
		  private static final long serialVersionUID = 1L;
		 
		    // Injected DAO EJB:
		    @EJB EmployeeDao employeeDao;
		    @EJB WorkOrderDao workorderDao;
		    
		   // @EJB workorder.WorkOrderDao workorderDao;
		 
		    @Override
		    protected void doGet(
		        HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {
		 
		   /*     // Display the list of employees:
		        request.setAttribute("employees", employeeDao.getEmployees());
		        request.setAttribute("workorders", workorderDao.getWorkOrders());*/
		    	request.getRequestDispatcher("/login.jsp").forward(request, response);
		        request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);
		        
		    }
		 
		    @Override
		    protected void doPost(
		    		
		        HttpServletRequest request, HttpServletResponse response)
		            throws ServletException, IOException {
		    
		
		    	String action = request.getParameter("submit");
		    	System.out.print("the servlet dopost ran, ");
		    	if(action.equalsIgnoreCase("login")){
		        	System.out.print("login was pushed, ");
		        	String username = request.getParameter("username");
		        	String password = request.getParameter("password");
		        	
		        	//successful admin login redirect
		        	// response.sendRedirect("admin-dashboard.jsp"); 
		        }
		        // Display the list of employees:
		        doGet(request, response);
		    }
	}
}