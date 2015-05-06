package employee;

import java.util.List;



import javax.ejb.Stateless;
import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

//import workorder.WorkOrder;


@Stateless
public class EmployeeDao {
	
	//EntityManagerFactory emf = Persistence.createEntityManagerFactory("constructionPal.odb");
    //EntityManager em = emf.createEntityManager();
    // Injected database connection:
   @PersistenceContext private EntityManager em;
 
    public void openTransaction(){
    	em.getTransaction().begin();
    }
     public void commitTransaction(){
    	 em.getTransaction().commit();
    	// em.close();
     }
    // Stores a new employee:
    public void persist(Employee employee) {
    		em.persist(employee);
    }
  
  /*  public Employee setEmployeeWorkOrder(int empId, int workorderId) {
        Employee emp = em.find(Employee.class, empId);
        WorkOrder work = em.find(WorkOrder.class, workorderId );
        work.assignEmployees(emp);
        emp.setWorkOrder(work);
        return emp;
      }*/

 
    // Retrieves all the employee:
    public List<Employee> getEmployees() {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT g FROM Employee g ORDER BY g.Id", Employee.class);
        return query.getResultList();
    }
    
    
}