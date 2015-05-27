package workorder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceContext;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import buiding.Building;
import employee.Employee;
import supplies.*;
 
@Stateless
public class WorkOrderDao {
	
	//EntityManagerFactory emf = Persistence.createEntityManagerFactory("constructionPal.odb");
    //EntityManager em = emf.createEntityManager();
     //Injected database connection:
    @PersistenceContext private EntityManager em;
    @EJB SuppliesDao suppliesDao;
    public void openTransaction(){
    	em.getTransaction().begin();
    }
     public void commitTransaction(){
    	 em.getTransaction().commit();
    	 //em.close();
     }
    // Stores a new workOrder:
    public void persist(WorkOrder wo) {
    		em.persist(wo);
    }
    //use next 2 methods for updating building
    public void updateBuildingAssigned(long woId, long bId){
    	WorkOrder w = em.find(WorkOrder.class, woId);
    	w.setBuildingAssignedTo(bId);
    	em.persist(w);
    }
    
    public Building getAssignedBuilding(long woId){
    	WorkOrder w = em.find(WorkOrder.class, woId);
    	Building b =  em.find(Building.class, w.getBuildingAssignedTo());
    	return b;
    }
    
 
    // Retrieves all the workOrder:
    public List<WorkOrder> getWorkOrders() {
        TypedQuery<WorkOrder> query = em.createQuery(
            "SELECT w FROM WorkOrder w ORDER BY w.Id", WorkOrder.class);
        return query.getResultList();
    }
    public WorkOrder findById(long id){
    	WorkOrder w = em.find(WorkOrder.class, id);
    	return w;
    }
    
    
 // Retrieves all the employees:
    public List<Employee> getEmployees() {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT e FROM Employee e ORDER BY e.Id", Employee.class);
        return query.getResultList();
    }
    public void removeWorkOrder(long id){
    	WorkOrder w = em.find(WorkOrder.class, id);
    	em.remove(w);
    }
	public void updateDescription(long id, String description) {
		TypedQuery query = em.createQuery(
                "UPDATE WorkOrder SET description = '"+description+"' WHERE Id = "+id+"", WorkOrder.class);
           query.executeUpdate();
		
	}
	public void updatePriorityLevel(long id, String priorityLevel) {
		TypedQuery query = em.createQuery(
                "UPDATE WorkOrder SET priorityLevel = '"+priorityLevel+"' WHERE Id = "+id+"", WorkOrder.class);
           query.executeUpdate();
		
	}
	public void updateStatus(long id, String status) {
		TypedQuery query = em.createQuery(
                "UPDATE WorkOrder SET status = '"+status+"' WHERE Id = "+id+"", WorkOrder.class);
           query.executeUpdate();
		
	}
	public void updateExpectedFinish(long id, Date expectedFinish) {
		TypedQuery query = em.createQuery(
                "UPDATE WorkOrder SET expectedFinish = "+expectedFinish+" WHERE Id = "+id+"", WorkOrder.class);
           query.executeUpdate();
		
	}
	public void updateFinishDate(long id, Date finishDate) {
		TypedQuery query = em.createQuery(
                "UPDATE WorkOrder SET finishDate = "+finishDate+" WHERE Id = "+id+"", WorkOrder.class);
          query.executeUpdate();
		
		
	}
	public void addWorker(long id,Employee e){
		WorkOrder w = em.find(WorkOrder.class, id);
		w.addWorker(e);
		em.persist(w);
	}
	public void updateWorkOrderFields(Long woId, String description,
			String priorityLevel, String status, Date expectedFinish,
			Date finishDate, String comments) {
		 WorkOrder w = em.find(WorkOrder.class, woId);		
		 w.setDescription(description);
		 w.setExpectedFinish(expectedFinish);
		 w.setFinishDate(finishDate);
		 w.setPriorityLevel(priorityLevel);
		 w.setStatus(status);
		 w.setComments(comments);
		 em.persist(w);
		 
		 
	}
	
	public List<Employee> getWorkersAssignedtoWorkOrderByWorkOrderId(long id){
		List<Employee> elist = em.find(WorkOrder.class, id).getWorkers();
    	return elist;
	}
	public List<Employee> getAssignedEmployees(long wid){
		TypedQuery query = em.createQuery(
                "Select From Employee Where assignedTo = "+wid, WorkOrder.class);
		return query.getResultList();
	}
	
	public List<Employee> getAvailableWorkers(){
		TypedQuery query = em.createQuery(
                "Select From Employee WHERE inWork = false ", Employee.class);
		return query.getResultList();
	}
	public void updateAddSupply(Long workorderId, Long sid) {
		WorkOrder w = em.find(WorkOrder.class, workorderId);
		if(!w.getSupplies().contains(sid)){
			w.addSupply(sid);
			em.persist(w);
		}
	}
	public List<Supplies> getSupplies(long woId){
		WorkOrder w = em.find(WorkOrder.class, woId);
		List<Long> list = w.getSupplies();
		List<Supplies> s = new ArrayList<Supplies>();
		for(int i =0;i<list.size();i++){
			
			s.add(suppliesDao.findById(list.get(0)));
		}
		return s;
		
	}
	public List<Supplies> convertLongToSupplyList(List<Long> list){
		List<Supplies> s = new ArrayList<Supplies>();
		for(int i =0;i<list.size();i++){
			
			s.add(suppliesDao.findById(list.get(0)));
		}
		return s;
		
	}
    
}
