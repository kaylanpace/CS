package workorder;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import employee.*;


@WebServlet(name = "WorkOrderServlet", urlPatterns={"/workorder"})

public class WorkOrderServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
// Injected DAO EJB:
@EJB EmployeeDao employeeDao;
@EJB WorkOrderDao workorderDao;

Long workorderId = (long)0;
WorkOrder selectedWorkOrder = null;


@Override
public void doGet(
HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

// Display the list of workorders:
request.setAttribute("workorders", workorderDao.getWorkOrders());
request.setAttribute("employees", employeeDao.getEmployees());
//based on global variable - set when workorder is selected on admin-viewWorkOrders.jsp
request.setAttribute("workOrderSelected", selectedWorkOrder);

request.getRequestDispatcher("/admin-viewWorkOrders.jsp").forward(request, response);
request.getRequestDispatcher("/viewAllWorkorders.jsp").forward(request, response);
request.getRequestDispatcher("/workorder.jsp").forward(request, response);



//if(!response.isCommitted())

//request.getRequestDispatcher("/admin-viewWorkOrder.jsp").forward(request, response);
return;
}



@Override
protected void doPost(
HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
//workorderDao.openTransaction();
	
	String action = request.getParameter("submit");
	
// Handle a new work order:



if (action.equalsIgnoreCase("add")){
	
	String description = request.getParameter("description");
	String priorityLevel = request.getParameter("priorityLevel");
	String status = request.getParameter("status");
	String expectedFinishstr = request.getParameter("expectedFinish");
	String comments = request.getParameter("comments");
	java.util.Date expectedFinish = null;
	try {
	expectedFinish = new SimpleDateFormat("MM-dd-yyyy").parse(expectedFinishstr);
	}
	catch (ParseException e) {
	e.printStackTrace();
	}
	
workorderDao.persist(new WorkOrder(description, priorityLevel, status, comments, expectedFinish));
//workorderDao.commitTransaction();
}
else if (action.equalsIgnoreCase("deleteRow")){

	Long woId = Long.parseLong(request.getParameter("woId"));
	String description = request.getParameter("woDescription");
	String priorityLevel = request.getParameter("woPriorityLevel");
	String status = request.getParameter("woStatus");
	String expectedFinishstr = request.getParameter("woExpectedFinish");
	String finishDate = request.getParameter("woFinishDate");
    try {
    	workorderDao.removeWorkOrder(woId);
	} catch (Exception e) {}
	System.out.print("delete row was pushed, id = "+woId);
}
else if (action.equalsIgnoreCase("updateRow")){
	System.out.print("updateRow button pushed");
	Long woId = Long.parseLong(request.getParameter("woId"));
	String description = request.getParameter("woDescription");
	String priorityLevel = request.getParameter("woPriorityLevel");
	String status = request.getParameter("woStatus");
	
	String expectedFinishstr = request.getParameter("woExpectedFinish");
	String finishDatestr = request.getParameter("woFinishDate");
	java.util.Date expectedFinish = null;
	try {
	expectedFinish = new SimpleDateFormat("MM-dd-yyyy").parse(expectedFinishstr);
	}
	catch (ParseException e) {
	e.printStackTrace();
	}
	java.util.Date finishDate = null;
	try {
	finishDate = new SimpleDateFormat("MM-dd-yyyy").parse(finishDatestr);
	}
	catch (ParseException e) {
	e.printStackTrace();
	}
	
	
	 try {
		 workorderDao.updateWorkOrderFields(woId,description,priorityLevel,status,expectedFinish,finishDate);
//		 workorderDao.updateDescription(woId,description);
//		 workorderDao.updatePriorityLevel(woId,priorityLevel);
//		 workorderDao.updateStatus(woId, status);
//		 workorderDao.updateExpectedFinish(woId, expectedFinish);
//		 workorderDao.updateFinishDate(woId, finishDate);
     	
		    System.out.print("made it past the update methods");
	    } catch (Exception e) {}
}
else if (action.equalsIgnoreCase("addWorker")){
	System.out.print("select was pushed");
	
	try {
		this.workorderId = Long.parseLong(request.getParameter("id"));
	} catch (NumberFormatException e) {}
	System.out.print("id = " + this.workorderId);
	selectedWorkOrder = workorderDao.findById(workorderId);
	
}
else if (action.equalsIgnoreCase("assignWorker")){
	Long eid = Long.parseLong(request.getParameter("eid"));
	System.out.print("assign a worker. their id is "+eid);
}


doGet(request, response);
}
}
