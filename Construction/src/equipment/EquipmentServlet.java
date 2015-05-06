package equipment;

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

@WebServlet(name = "EquipmentServlet", urlPatterns={"/equipment"})
public class EquipmentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	// Injected DAO EJB:
    @EJB EquipmentDao EquipmentDao;
 
    @Override
    public void doGet(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        // Display the list of equipment:
       request.setAttribute("equipments", EquipmentDao.getAllEquipment());
        request.getRequestDispatcher("/equipment.jsp").forward(request, response);
        return;
    }
    
    @Override
    protected void doPost(
        HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        // Handle a new equipment:
    	EquipmentDao.openTransaction();
		
        String equipName = request.getParameter("equipName");
        String equipType = request.getParameter("equipType");
        String description = request.getParameter("description");		
		String checkCyclestr = request.getParameter("checkCycle");
		
        Date checkcycle = null;
        try {
        checkcycle = new SimpleDateFormat("MM/dd/yyyy").parse(checkCyclestr);
        }
        catch (ParseException e) {
        e.printStackTrace();
        }
		
        if (equipName != null){
        	EquipmentDao.persist(new Equipment(equipName, equipType, description, checkcycle));
        	EquipmentDao.commitTransaction();
        }
       
        
        doGet(request, response);
    }
}
