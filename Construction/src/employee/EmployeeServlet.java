package employee;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workorder.WorkOrderDao;
 
@WebServlet(name="EmployeeServlet", urlPatterns={"/employee", "/viewAllEmployees"})
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
 
        // Display the list of employees:
        request.setAttribute("employees", employeeDao.getEmployees());
        request.setAttribute("workorders", workorderDao.getWorkOrders());
       
        
        request.getRequestDispatcher("/viewAllEmployees.jsp").forward(request, response);
       
        request.getRequestDispatcher("/employee.jsp").forward(request, response);
        
    }
 
    @Override
    protected void doPost(
    		
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	//gets button "value" from the buttons named "submit"
    	String action = request.getParameter("submit");
        
    	
        
    	// Handle a new employee:
        if (action.equalsIgnoreCase("Add"))
        {
        	String firstName = request.getParameter("empFirstName");
            String lastName = request.getParameter("empLastName");
            
            String position = request.getParameter("position");
            int age = Integer.parseInt(request.getParameter("age"));
            boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            
            employeeDao.persist(new Employee(firstName, lastName, position, age, isAdmin, userName, password));
           
            System.out.print("add was pushed");
        }
      //handle update of employee
        else if (action.equalsIgnoreCase("deleteRow")){
        	Long employeeId = Long.parseLong(request.getParameter("employeeId"));
            String updatefirstName = request.getParameter("employeeFirstName");
            String updatelastName = request.getParameter("employeeLastName");
            String updateposition = request.getParameter("employeePosition");
            int updateage = Integer.parseInt(request.getParameter("employeeAge"));
            
            try {
				employeeDao.removeEmployee(employeeId);
			} catch (Exception e) {}
        	System.out.print("delete row was pushed, id = "+employeeId);
        }
        else if(action.equalsIgnoreCase("updateRow")){
        	
        }
 
        // Display the list of employees:
        doGet(request, response);
    }
}