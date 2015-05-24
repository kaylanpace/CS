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

	 Employee selectedEmployee;
	 long employeeId;
    
   // @EJB workorder.WorkOrderDao workorderDao;
 
    @Override
    protected void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Display the list of employees:
        request.setAttribute("employees", employeeDao.getEmployees());
        request.setAttribute("workorders", workorderDao.getWorkOrders());
        

    
     //based on static variable - set when employee is selected 
     
     	request.setAttribute("employeeSelected", selectedEmployee);
     
     


//     if(employeeId!=null){
//     request.setAttribute("inWorkEmployees", workorderDao.getAssignedEmployees(workorderId));
//     request.setAttribute("assignedSupplies", supplies);
//     }
       
        
       // request.getRequestDispatcher("/viewAllEmployees.jsp").forward(request, response);
       
        request.getRequestDispatcher("/Employee1.jsp").forward(request, response);
        
    }
 
    @Override
    protected void doPost(
    		
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	//gets button "value" from the buttons named "submit"
    	String action = request.getParameter("submit");
    	
        
    	// Handle a new employee:
        if (action.equalsIgnoreCase("add"))
        {
        	String firstName = request.getParameter("empFirstName");
            String lastName = request.getParameter("empLastName");
            String position = request.getParameter("position");
            int age = Integer.parseInt(request.getParameter("age"));
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            
            employeeDao.persist(new Employee(firstName, lastName, position, age, userName, password));
           
            System.out.print("add was pushed");
        }
        else if(action.equalsIgnoreCase("selectEmployee")){
        	System.out.print("select was pushed, employee id is = ");
        	try {
        		long employeeId = Long.parseLong(request.getParameter("eid"));
        		this.employeeId = employeeId;
        	} catch (NumberFormatException e) {}
        	
        	//System.out.print("id = " + this.workorderId);
        	selectedEmployee = employeeDao.findEmployeeById(employeeId);
        }
      //handle update of employee
        else if (action.equalsIgnoreCase("deleteRow")){
//        	Long employeeId = Long.parseLong(request.getParameter("employeeId"));
//            String updatefirstName = request.getParameter("employeeFirstName");
//            String updatelastName = request.getParameter("employeeLastName");
//            String updateposition = request.getParameter("employeePosition");
//            int updateage = Integer.parseInt(request.getParameter("employeeAge"));
//            
            try {
				employeeDao.removeEmployee(employeeId);
			} catch (Exception e) {}
        	System.out.print("delete row was pushed, id = "+employeeId);
        }
        else if(action.equalsIgnoreCase("updateRow")){
        	String updateposition = request.getParameter("empPosition");
        	//Long employeeId = Long.parseLong(request.getParameter("empId"));
        	String updatefirstName = request.getParameter("empFirstName");
        	String updateLastName = request.getParameter("empLastName");
        	int updateAge = Integer.parseInt(request.getParameter("empAge"));
        	
            try {
            	employeeDao.updateAllFields(employeeId, updatefirstName,updateLastName,updateAge,updateposition);
//            	employeeDao.updateFirstName(employeeId,updatefirstName);
//            	employeeDao.updateLastName(employeeId,updateLastName);
//            	employeeDao.updateAge(employeeId, updateAge);
//            	employeeDao.updatePosition(employeeId, updateposition);
            	
			    System.out.print("made it past the update methods");
		    } catch (Exception e) {}
    	    System.out.print("update row was pushed, id = "+employeeId);
        }
         
        // Display the list of employees:
        doGet(request, response);
    }
}