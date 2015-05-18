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
    public void commit(){
    	em.getTransaction().commit();
    }
    public void begin(){
    	em.getTransaction().begin();
    }
    public void updateFirstName(long id,String fn){
    	
    	//Update Employee set empFirstName = 'hello first maner' where Id = 1
    	TypedQuery query = em.createQuery(
                "UPDATE Employee SET empFirstName = '"+fn+"' WHERE Id = "+id+"", Employee.class);
           query.executeUpdate();
    }
    public void updateLastName(long id, String ln){
    	TypedQuery query = em.createQuery(
                "UPDATE Employee SET empLastName = '"+ln+"' WHERE Id = "+id+"", Employee.class);
           query.executeUpdate();
    }
    public void updateAge(long id, int age){
    	TypedQuery query = em.createQuery(
                "UPDATE Employee SET age = "+age+" WHERE Id = "+id+"", Employee.class);
           query.executeUpdate();
    }
    public void updatePosition(long id, String position){
    	TypedQuery query = em.createQuery(
                "UPDATE Employee SET position = '"+position+"' WHERE Id = "+id+"", Employee.class);
           query.executeUpdate();
    }
           
//        TypedQuery query2 = em.createQuery(
//                 "UPDATE Employee SET empLastName = '"+ln+"' WHERE Id = '"+id+"'; ", Employee.class);
//              query2.executeUpdate();
           
           
           
//              , empLastName = '"+ln+"', age = "+age+","
//+ "position = '"+position+"'
//        TypedQuery query3 = em.createQuery(
//                 "UPDATE Employee SET age = '"+age+"' WHERE Id = '"+id+"';", Employee.class);
//              query3.executeUpdate();
//              
//        TypedQuery query4 = em.createQuery(
//               "UPDATE Employee SET position = '"+position+"' WHERE Id = '"+id+"'; ", Employee.class);
//              query4.executeUpdate(); 
    
    
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
    public Employee findEmployeeById(long id){
    	Employee e = em.find(Employee.class, id);
    	return e;
    }
 
    // Retrieves all the employee:
    public List<Employee> getEmployees() {
        TypedQuery<Employee> query = em.createQuery(
            "SELECT g FROM Employee g ORDER BY g.Id", Employee.class);
        return query.getResultList();
    }
    
    
}