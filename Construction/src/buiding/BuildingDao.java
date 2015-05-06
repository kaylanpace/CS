package buiding;


import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

//import workorder.WorkOrder;


@Stateless
public class BuildingDao {
	
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
    // Stores a new building:
    public void persist(Building building) {
    		em.persist(building);
    }

    // Retrieves all the building:
    public List<Building> getAllBuildings() {
        TypedQuery<Building> query = em.createQuery(
            "SELECT g FROM Building g ORDER BY g.Id", Building.class);
        return query.getResultList();
    }
    
    
}