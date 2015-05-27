package workorder;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import supplies.Supplies;
import supplies.SuppliesDao;
import employee.*;
import buiding.*;


@WebServlet(name = "WorkOrderServlet", urlPatterns={"/workorder"})

public class WorkOrderServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
// Injected DAO EJB:
@EJB EmployeeDao employeeDao;
@EJB WorkOrderDao workorderDao;
@EJB SuppliesDao suppliesDao;
@EJB BuildingDao buildingDao;
List<Employee> inWorkEmployeeList = null;
List<Supplies> supplies = null;
List<Supplies> assignedSupplies = null;
Long workorderId = null;
WorkOrder selectedWorkOrder = null;
Employee selectedEmployee = null;
Building assignedBuilding = null;

@Override
public void doGet(
HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {


request.setAttribute("workorders", workorderDao.getWorkOrders());
request.setAttribute("employees", employeeDao.getEmployees());
request.setAttribute("supplies", suppliesDao.getAllSupplies());
request.setAttribute("buildings", buildingDao.getAllBuildings());

if (workorderId !=null){
	assignedBuilding = workorderDao.getAssignedBuilding(workorderId);
	request.setAttribute("buildingAssigned", assignedBuilding);
}
else
	request.setAttribute("buildingAssigned", assignedBuilding);


//based on global variable - set when workorder is selected on admin-viewWorkOrders.jsp
//get employees not assigned to anything that are worker-position
request.setAttribute("availableWorkers", workorderDao.getAvailableWorkers());
//get work-order to modify when user selects
try {
	request.setAttribute("workOrderSelected", selectedWorkOrder);
} catch (Exception e) {}

if(workorderId!=null){
	//get employees assiged to a work-order
	request.setAttribute("inWorkEmployees", workorderDao.getAssignedEmployees(workorderId));
	//get assigned supplies
//	assignedSupplies = workorderDao.getSupplies(workorderId);
//	request.setAttribute("assignedSupplies", assignedSupplies);
}



request.getRequestDispatcher("/workorder.jsp").forward(request, response);
//request.getRequestDispatcher("/admin-viewWorkOrders.jsp").forward(request, response);
//request.getRequestDispatcher("/workorder.jsp").forward(request, response);
//
//request.getRequestDispatcher("/viewAllWorkorders.jsp").forward(request, response);




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

//  Long woId = Long.parseLong(request.getParameter("woId"));
	String description = request.getParameter("woDescription");
	String priorityLevel = request.getParameter("woPriorityLevel");
	String status = request.getParameter("woStatus");
	String expectedFinishstr = request.getParameter("woExpectedFinish");
	String finishDate = request.getParameter("woFinishDate");
	if (workorderId!=null){
    try {
    	workorderDao.removeWorkOrder(workorderId);
	} catch (Exception e) {}
	}
	System.out.print("delete row was pushed, id = "+workorderId);
}
else if (action.equalsIgnoreCase("updateRow")){
	System.out.print("updateRow button pushed");
//	Long woId = Long.parseLong(request.getParameter("woId"));
	String description = request.getParameter("woDescription");
	String comments = request.getParameter("woComments");
	String priorityLevel = request.getParameter("woPriorityLevel");
	String status = request.getParameter("woStatus");
	String expectedFinishstr = request.getParameter("woExpectedFinish");
	String finishDatestr = request.getParameter("woFinishDate");
	
	
	java.util.Date expectedFinish = null;
	try {
	expectedFinish = new SimpleDateFormat("MM-dd-yyyy").parse(expectedFinishstr);
	}catch (ParseException e) {}
	
	java.util.Date finishDate = null;
	try {
	finishDate = new SimpleDateFormat("MM-dd-yyyy").parse(finishDatestr);
	}catch (ParseException e) {}
	
	if (workorderId!=null){
	 try {
		 workorderDao.updateWorkOrderFields(workorderId,description,priorityLevel,status,expectedFinish,finishDate,comments);     		   
	    } catch (Exception e) {}
	}
}
else if (action.equalsIgnoreCase("selectWorkOrder")){
	System.out.print("select was pushed, workorder id is = "+this.workorderId);
	
	try {
		this.workorderId = Long.parseLong(request.getParameter("id"));
	} catch (NumberFormatException e) {}
	System.out.print("select was pushed, workorder id is = "+this.workorderId);
	//System.out.print("id = " + this.workorderId);
	selectedWorkOrder = workorderDao.findById(workorderId);
	if(workorderId !=0){}
	//inWorkEmployeeList = workorderDao.getWorkersAssignedtoWorkOrderByWorkOrderId(workorderId);
}
//available workers not assigned to anything
else if (action.equalsIgnoreCase("assignWorker")){
	Long eid = Long.parseLong(request.getParameter("eid"));
	System.out.print("assign a worker. their id is "+eid);
	if(workorderId >0){
		try {
			employeeDao.updateInWork(eid, true);
			employeeDao.setAssignedTo(eid,workorderId);
			
			selectedEmployee = employeeDao.findEmployeeById(eid);
		} catch (Exception e) {}
	}
		
	
}

//list of assigned to this workorder
else if (action.equalsIgnoreCase("removeWorker")){
	Long eid = Long.parseLong(request.getParameter("eid"));
	System.out.print("remove a worker. their id is "+eid);
	
		try {
			employeeDao.updateInWork(eid, false);
			employeeDao.setAssignedTo(eid, (long)0);

		} catch (Exception e) {}
	
}

//delete the work-order 
else if(action.equalsIgnoreCase("delete")){
	System.out.print("delete button pushed");
}

//add supplies to a work-order
else if (action.equalsIgnoreCase("assignSupplies")){
	//var amount  - get the amount requested
	//suppliesDao.updateInventoryLevel();
	
	Long sid = Long.parseLong(request.getParameter("sid"));
	System.out.print("assignSupplies pushed: workorderId is"+ workorderId+", sid is "+sid);
	if (workorderId!=null){
//	suppliesDao.updateAssignedTo(sid,workorderId);
    workorderDao.updateAddSupply(workorderId,sid);
//	supplies = suppliesDao.getSuppliesAssigned(workorderId);
//	supplies = (List<Supplies>)workorderDao.getSupplies(workorderId);
	
	}
	
}
//remove supplies from a work-order
else if (action.equalsIgnoreCase("removeSupply")){
	Long sid = Long.parseLong(request.getParameter("sid"));
	suppliesDao.removeSupply(sid, workorderId);
}
else if (action.equalsIgnoreCase("assignBuilding")){
	long bId = Long.parseLong(request.getParameter("bid"));
	if (workorderId>0){
	workorderDao.updateBuildingAssigned(workorderId, bId);
	this.assignedBuilding = workorderDao.getAssignedBuilding(workorderId);
	}
	System.out.print("Building id is "+bId+"workorderId is "+workorderId);
}
else if (action.equalsIgnoreCase("unassignBuilding")){
	workorderDao.updateBuildingAssigned(workorderId, (long)0);
	this.assignedBuilding = null;
}


doGet(request, response);
}

}
