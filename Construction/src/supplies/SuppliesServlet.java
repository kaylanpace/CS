package supplies;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "SuppliesServlet", urlPatterns={"/supplies"})
public class SuppliesServlet extends HttpServlet{
private static final long serialVersionUID = 1L;
// Injected DAO EJB:
@EJB SuppliesDao suppliesDao;

@Override
public void doGet(
HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

// Display the list of supplies:
request.setAttribute("supplies", suppliesDao.getAllSupplies());
request.getRequestDispatcher("/supplies.jsp").forward(request, response);
return;
}

@Override
protected void doPost(
HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

// Handle new supplies:



String action = request.getParameter("submit");

if (action.equalsIgnoreCase("add")){
	String supplyName = request.getParameter("supplyName");
	Double quantity = Double.parseDouble(request.getParameter("quantity"));
	String description = request.getParameter("description");
	String pocName = request.getParameter("pocName");
	String pocPhone = request.getParameter("pocPhone");
	String pocEmail = request.getParameter("pocEmail");
	String expirationDatestr = request.getParameter("expirationDate");
	Date expirationDate = null;
	try {
	expirationDate = new SimpleDateFormat("MM-dd-yyyy").parse(expirationDatestr);
	}
	catch (ParseException e) {
	e.printStackTrace();
	}

	//String vendorPOC = request.getParameter("vendorPOC");

	String checkCyclestr = request.getParameter("checkCycle");
	Date checkcycle = null;
	try {
	checkcycle = new SimpleDateFormat("MM-dd-yyyy").parse(checkCyclestr);
	}
	catch (ParseException e) {
	e.printStackTrace();
	}
	suppliesDao.persist(new Supplies(supplyName, quantity, description, expirationDate, checkcycle , pocName,pocPhone,pocEmail));
}
else if (action.equalsIgnoreCase("updateRow")){
	long supplyId = Long.parseLong(request.getParameter("supplyId"));
	String supplyName = request.getParameter("supplyName");
	Double quantity = Double.parseDouble(request.getParameter("supplyQty"));
	String description = request.getParameter("supplyDescription");
	String pocName = request.getParameter("supplyPoc");
	suppliesDao.updateFields(supplyId, supplyName,quantity,description,pocName);
}
else if (action.equalsIgnoreCase("deleteRow")){
	long supplyId = Long.parseLong(request.getParameter("supplyId"));
	suppliesDao.removeSupply(supplyId);
}		
		



doGet(request, response);
}
}
