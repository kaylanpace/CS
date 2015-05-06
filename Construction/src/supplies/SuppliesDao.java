package supplies;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

//import supplies.Supplies;

@Stateless
public class SuppliesDao {
	
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
    // Stores a new Supplies:
    public void persist(Supplies supplies) {
    		em.persist(supplies);
    }
  

    // Retrieves all the supplies:
    public List<Supplies> getAllSupplies() {
        TypedQuery<Supplies> query = em.createQuery(
            "SELECT s FROM Supplies s ORDER BY s.Id", Supplies.class);
        return query.getResultList();
    }
    
    
}