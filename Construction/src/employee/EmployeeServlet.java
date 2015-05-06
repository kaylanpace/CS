package employee;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import workorder.WorkOrderDao;
 
@WebServlet(name="EmployeeServlet", urlPatterns={"/employee"})
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
        request.getRequestDispatcher("/employee.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(
    		
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	//employeeDao.openTransaction();
        // Handle a new employee:
        String firstName = request.getParameter("empFirstName");
        String lastName = request.getParameter("empLastName");
        int ssn = Integer.parseInt(request.getParameter("ssn"));
        String position = request.getParameter("position");
        int age = Integer.parseInt(request.getParameter("age"));
        boolean isAdmin = Boolean.parseBoolean(request.getParameter("isAdmin"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        
      
        if (firstName != null)
        
        {
            employeeDao.persist(new Employee(firstName, lastName, ssn, position, age, isAdmin, userName, password));
           // employeeDao.commitTransaction();
        }
 
        // Display the list of employees:
        doGet(request, response);
    }
}