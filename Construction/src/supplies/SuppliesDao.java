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
 
    // Stores a new Supplies:
    public void persist(Supplies supplies) {
    		em.persist(supplies);
    }
  

    // Retrieves all the supplies:
    public List<Supplies[]> getAllSupplies() {
        TypedQuery<Supplies[]> query = em.createQuery(
            "SELECT s FROM Supplies s ORDER BY s.Id", Supplies[].class);
        return query.getResultList();
    }
    
    // Retrieves all the supplies Ids:
    public List<Supplies> getSupplyId() {
        TypedQuery<Supplies> query = em.createQuery(
            "SELECT si.Id FROM Supplies si ORDER BY si.Id", Supplies.class);
        return query.getResultList();
    }
 // Retrieves all the supplies Ids:
    public List<Supplies[]> getSupplyName() {
        TypedQuery<Supplies[]> query = em.createQuery(
            "SELECT sn.supplyName FROM Supplies sn ORDER BY sn.Id", Supplies[].class);
        return query.getResultList();
    }
    public Supplies getSupplyByName(String sName){
    	TypedQuery<Supplies> query = em.createQuery(
                "SELECT s FROM Supplies WHERE "+sName+"= 's.supplyName'", Supplies.class);
    	return query.getSingleResult();
    }
    public Supplies getSingleSupply(long id){
    	Supplies s = em.find(Supplies.class, id);
    	return s;
    }
    //delete by id
    public void removeSupply(long id){
    	Supplies s = em.find(Supplies.class, id);
    	em.remove(s);
    }
    
    
}