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
 
   
    // Stores a new employee:
    public void persist(Employee employee) {
    	//em.getTransaction().begin();
    	  em.persist(employee);
    	  //em.getTransaction().commit();
    }
  
  /*  public Employee setEmployeeWorkOrder(int empId, int workorderId) {
        Employee emp = em.find(Employee.class, empId);
        WorkOrder work = em.find(WorkOrder.class, workorderId );
        work.assignEmployees(emp);
        emp.setWorkOrder(work);
        return emp;
      }*/
    public Employee getEmployeeById(long id){
    	Employee e = em.find(Employee.class, id);
    	return e;
    }
    public void removeEmployee(long id){
    	Employee e = em.find(Employee.class, id);
    	em.remove(e);
    }
 
    // Retrieves all the employee:
    public List<Employee> getEmployees() {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT g FROM Employee g ORDER BY g.Id", Employee.class);
        return query.getResultList();
    }
    
    
}