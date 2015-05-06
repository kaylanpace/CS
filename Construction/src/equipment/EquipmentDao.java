package equipment;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

//import equipment.Equipment;

@Stateless
public class EquipmentDao {
	
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
    public void persist(Equipment equipment) {
    		em.persist(equipment);
    }
  

    // Retrieves all the employee:
    public List<Equipment> getAllEquipment() {
        TypedQuery<Equipment> query = em.createQuery(
            "SELECT e FROM Equipment e ORDER BY e.Id", Equipment.class);
        return query.getResultList();
    }
    
    
}