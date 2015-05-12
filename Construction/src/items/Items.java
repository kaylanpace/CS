package items;

import java.io.Serializable;

import javax.persistence.*;

import supplies.Supplies;
import workorder.WorkOrder;


@Entity
@Table(name="Items")
public class Items implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="itemsId")
    Long Id;
    
    @Column(name="itemName")
    private String itemName;
    
    @Column(name="assignedQty")
    private int assignedQty;
    
    @Column(name="remainingQty", nullable=true)
    private int remainingQty;
    
    @ManyToOne(fetch=FetchType.LAZY, optional=true)
    @JoinColumn(name="supplyId", nullable=true)
    private Supplies supplies;
    
    @ManyToOne(fetch=FetchType.LAZY, optional=true)
    @JoinColumn(name="workorderID", nullable=true)
    private WorkOrder workers;
  	
  	 // Constructors:
    public Items() {
    	
    }
       
    public Items(String itemName, int assignedQty, int remainingQty) {
       this.itemName = itemName;
       this.assignedQty = assignedQty;
       this.remainingQty = remainingQty;
 
    }
    //Accessor Methods
	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}
	
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public double getAssignedQty() {
		return assignedQty;
	}

	public void setAssignedQty(int assignedQty) {
		this.assignedQty = assignedQty;
	}

	public double getRemainingQty() {
		return remainingQty;
	}

	public void setRemainingQty(int remainingQty) {
		this.remainingQty = remainingQty;
	}

	// String Representation:
    @Override
    public String toString() {
        return  itemName + "" + assignedQty + " " + remainingQty;
    }
    
    
}
