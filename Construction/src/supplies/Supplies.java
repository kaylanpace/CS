package supplies;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import poc.POC;
import uom.UOM;


@Entity
@Table(name="Supplies")
public class Supplies implements Serializable {
	private static final long serialVersionUID = 1L;

	// Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="supplyId")
    Long Id;
    
    @Column(name="supplyName")
    private String supplyName;
    
    @Column(name="quantity")
    private double quantity;
    
    @Column(name="description")
    private String description;
    
    @Temporal(TemporalType.DATE)
    private Date expirationDate;
    
    @Column
    private String vendorPOC;
    
    @Temporal(TemporalType.DATE)
    private Date checkCycle;
    
    @OneToOne(optional=true)
    @JoinColumn(name="pocId", unique=false, nullable=true, updatable=true)
    public POC pocId;
    
  //UOM one to one FK
  	@OneToOne(optional=true)
    @JoinColumn(name="uomId", unique=false, nullable=true, updatable=true)
    public UOM uomId;
    
    // Constructors:
    public Supplies() {
    	
    }
    
  
 
    public Supplies(String supplyName, double quantity, String description, Date expirationDate, String vendorPOC, Date checkCycle) {
       this.supplyName = supplyName;
       this.quantity = quantity;
       this.description = description;
       this.expirationDate = expirationDate;
       this.vendorPOC = vendorPOC;
       this.checkCycle = checkCycle;
       
        
    }
    
    //Access Methods
	public Long getId() {
		return Id;
	}



	public void setId(Long id) {
		Id = id;
	}



	public String getSupplyName() {
		return supplyName;
	}



	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}



	public double getQuantity() {
		return quantity;
	}



	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Date getExpirationDate() {
		return expirationDate;
	}



	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}



	public String getVendorPOC() {
		return vendorPOC;
	}



	public void setVendorPOC(String vendorPOC) {
		this.vendorPOC = vendorPOC;
	}



	public Date getCheckCycle() {
		return checkCycle;
	}



	public void setCheckCycle(Date checkCycle) {
		this.checkCycle = checkCycle;
	}

	public POC getPocId() {
		return pocId;
	}



	public void setPocId(POC pocId) {
		this.pocId = pocId;
	}

	
	// String Representation:
    @Override
    public String toString() {
        return  supplyName + " " + quantity
        		+ " " + description + " " + expirationDate + " " + vendorPOC + " " + checkCycle;
    }
}
