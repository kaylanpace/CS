//package workorder;
//
//import java.io.IOException;
//import java.sql.Date;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//import javax.ejb.EJB;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import employee.*;
///**
// * Servlet implementation class WorkOrderAdminServlet
// */
//@WebServlet(name = "WorkOrderAdminServlet", urlPatterns={ "/admin-viewWorkOrders"})
//public class WorkOrderAdminServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	// Injected DAO EJB:
//    @EJB WorkOrderDao workorderDao;
//    @EJB employee.EmployeeDao employeeDao;
// 
//	Long workorderId = (long)0;
//	WorkOrder selectedWorkOrder = null;
//       
//
//    @Override
//    public void doGet(
//        HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    	
//    	//List<WorkOrder> list = workorderDao.getWorkOrders();
//    	//request.setAttribute("inWorkEmployees", workorderDao.getWorkersAssignedtoWorkOrderByWorkOrderId(workorderId));
//    	
//    	request.setAttribute("workorders", workorderDao.getWorkOrders());
//    	request.setAttribute("employees", employeeDao.getEmployees());
//    	
//    	//get employees not assigned to anything that are worker-position
//    	//request.setAttribute("availableWorkers", workorderDao.getAvailableWorkers());
//     
//    	if(selectedWorkOrder!=null){
//    		request.setAttribute("workOrderSelected", selectedWorkOrder);
//    	}	
//       
//    
//        request.getRequestDispatcher("/admin-viewWorkOrders.jsp").forward(request, response);
//        
//        
//        
//        return;
//    }
//    
//   
//    
//    @Override
//    protected void doPost(
//        HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    		//.openTransaction();
//    	String action = request.getParameter("submit");
//       // Handle a new work order:
//    	
//        String description = request.getParameter("description");
//        String priorityLevel = request.getParameter("priorityLevel");
//        String status = request.getParameter("status");
//        
////        if (action.equalsIgnoreCase("addWorker")){
////        	System.out.print("select was pushed");
////        	
////        	try {
////        		this.workorderId = Long.parseLong(request.getParameter("id"));
////        	} catch (NumberFormatException e) {}
////        	//System.out.print("id = " + this.workorderId);
////        	selectedWorkOrder = workorderDao.findById(workorderId);
////        	//eList = workorderDao.getWorkersAssignedtoWorkOrderByWorkOrderId(workorderId);
////        }
////        else if (action.equalsIgnoreCase("assignWorker")){
////        	Long eid = Long.parseLong(request.getParameter("eid"));
////        	System.out.print("assign a worker. their id is "+eid);
////        	if (!selectedWorkOrder.getWorkers().contains(eid)){
////        		selectedWorkOrder.addWorker(eid);
////        	}
////        	
////        }
////        else if (action.equalsIgnoreCase("removeWorker")){
////        	Long eid = Long.parseLong(request.getParameter("eid"));
////        	System.out.print("remove a worker. their id is "+eid);
////        	if (selectedWorkOrder.getWorkers().contains(eid)){
////        		//selectedWorkOrder.removeWorker(eid);
////        	}
////        	
////        }
//
//        
//        doGet(request, response);
//    }
//}
