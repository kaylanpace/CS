package workorder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceContext;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import employee.Employee;
 
@Stateless
public class WorkOrderDao {
	
	//EntityManagerFactory emf = Persistence.createEntityManagerFactory("constructionPal.odb");
    //EntityManager em = emf.createEntityManager();
     //Injected database connection:
    @PersistenceContext private EntityManager em;
 
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
	public void updateWorkOrderFields(Long woId, String description,
			String priorityLevel, String status, Date expectedFinish,
			Date finishDate) {
		 WorkOrder w = em.find(WorkOrder.class, woId);		
		 w.setDescription(description);
		 w.setExpectedFinish(expectedFinish);
		 w.setFinishDate(finishDate);
		 w.setPriorityLevel(priorityLevel);
		 w.setStatus(status);
		 em.persist(w);
		 
		 
	}
	
    
}
