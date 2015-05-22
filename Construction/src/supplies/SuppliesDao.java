package supplies;
import java.util.ArrayList;
import java.util.List;

import supplies.*;
import workorder.WorkOrder;

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
                "SELECT FROM Supplies WHERE supplyName = '"+sName+"'", Supplies.class);
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


	public void updateFields(long supplyId, String supplyName, Double quantity, String description, String pocName) {
		Supplies s = em.find(Supplies.class, supplyId);
		s.setPocName(pocName);
		s.setQuantity(quantity);
		s.setDescription(description);
		s.setSupplyName(supplyName);
	}


	public List<Supplies> getSuppliesAssigned(Long workorderId) {
		WorkOrder w = em.find(WorkOrder.class, workorderId);
		List<Supplies> sList = new ArrayList<Supplies>();
//		for (int i = 1; i < w.getSupplies().size();i++){
//		Supplies s = em.find(Supplies.class, w.getSupplies().get(i));
//		sList.add(s);
//		}
		
		return sList;
	}


	public void updateAssignedTo(Long sid, Long woId) {
		Supplies s = em.find(Supplies.class, sid);
		WorkOrder w = em.find(WorkOrder.class, woId);
		s.addWOtoAssignedTo(w.getWorkorderId());
	}


	public void updateaddWOtoAssignedTo(Long workorderId, long sid) {
		Supplies s = em.find(Supplies.class, sid);
		WorkOrder w = em.find(WorkOrder.class,workorderId);
		s.addWOtoAssignedTo(w.getWorkorderId());
		
	}
	
	
	
    
    
}