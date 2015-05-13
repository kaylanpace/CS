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
String expectedFinishstr = request.getParameter("expectedFinish");
String comments = request.getParameter("comments");
java.util.Date expectedFinish = null;
try {
expectedFinish = new SimpleDateFormat("MM-dd-yyyy").parse(expectedFinishstr);
}
catch (ParseException e) {
e.printStackTrace();
}


if (description != null){
workorderDao.persist(new WorkOrder(description, priorityLevel, status, comments, expectedFinish));
//workorderDao.commitTransaction();
}


doGet(request, response);
}
}
