package workorder;

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
    
 // Retrieves all the employees:
    public List<Employee> getEmployees() {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT e FROM Employee e ORDER BY e.Id", Employee.class);
        return query.getResultList();
    }
    
}
