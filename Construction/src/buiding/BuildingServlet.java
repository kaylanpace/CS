package buiding;

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

import workorder.*;
import employee.*;

@WebServlet(name = "BuildingServlet", urlPatterns={"/building"})
public class BuildingServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	// Injected DAO EJB:
    @EJB BuildingDao BuildingDao;
 
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of buildings:
       request.setAttribute("buildings", BuildingDao.getAllBuildings());
       
        request.getRequestDispatcher("/building.jsp").forward(request, response);
        return;
    }
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Handle a new building:
    	//BuildingDao.openTransaction();
    	/*
    	String buildingIdstr = request.getParameter("Id");
    	Long buildingId = Long.parseLong(buildingIdstr);
    	*/
        String buildingname = request.getParameter("buildingName");

        String checkCyclestr = request.getParameter("checkCycle");
        Date checkcycle = null;
        try {
        checkcycle = new SimpleDateFormat("MM/dd/yyyy").parse(checkCyclestr);
        }
        catch (ParseException e) {
        e.printStackTrace();
        }
      
        String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String pocName = request.getParameter("pocName");
		String pocPhone = request.getParameter("pocPhone");
		String pocEmail = request.getParameter("pocEmail");
		
		String action = request.getParameter("submit");
        if (action.equalsIgnoreCase("add")){
        	BuildingDao.persist(new Building(buildingname, checkcycle, street, city, state, zip, pocName, pocPhone, pocEmail));
        	//BuildingDao.commitTransaction();
        }
       
        doGet(request, response);
    }
}
