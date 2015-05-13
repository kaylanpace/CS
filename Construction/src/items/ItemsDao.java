package items;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;


@Stateless
public class ItemsDao {

   // Injected database connection:
   @PersistenceContext private EntityManager em;
 
    // Stores a new Supplies:
    public void persist(Items items) {
    		em.persist(items);
    }
  

    // Retrieves all the supplies:
    public List<Items> getAllItems() {
        TypedQuery<Items> query = em.createQuery(
            "SELECT i FROM Items i ORDER BY i.Id", Items.class);
        return query.getResultList();
    }
    
    
}