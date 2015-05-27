package supplies;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import poc.POC;
import uom.UOM;
import workorder.WorkOrder;


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

@Column(name="expirationDate")
@Temporal(TemporalType.DATE)
private Date expirationDate;

@Column(name="checkCycle")
@Temporal(TemporalType.DATE)
private Date checkCycle;

@Column(name="assignedTo")
private long assignedTo;

@Column(name="inventoryLevel")
private int inventoryLevel;

@Column(name="pocName")
private String pocName;

@Column(name="pocPhone")
private String pocPhone;

@Column(name="pocEmail")
private String pocEmail; 



@OneToOne(optional=true)
@JoinColumn(name="pocId", unique=false, nullable=true, updatable=true)
private POC pocId;

//UOM one to one FK
@OneToOne(optional=true)
@JoinColumn(name="uomId", unique=false, nullable=true, updatable=true)
private UOM uomId;

// Constructors:
public Supplies() {

}



public Supplies(String supplyName, double quantity, String description, Date expirationDate, Date checkCycle) {
this.supplyName = supplyName;
this.quantity = quantity;
this.description = description;
this.expirationDate = expirationDate;

this.checkCycle = checkCycle;


}
public Supplies(String supplyName, double quantity, String description, Date expirationDate, Date checkCycle, String pocName,String pocPhone,String pocEmail) {
this.supplyName = supplyName;
this.quantity = quantity;
this.description = description;
this.expirationDate = expirationDate;

this.checkCycle = checkCycle;
this.pocName = pocName;
this.pocEmail = pocEmail;
this.pocPhone = pocPhone;


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


public String getPocName() {
return pocName;
}



public void setPocName(String pocName) {
this.pocName = pocName;
}



public String getPocPhone() {
return pocPhone;
}



public void setPocPhone(String pocPhone) {
this.pocPhone = pocPhone;
}



public String getPocEmail() {
return pocEmail;
}



public void setPocEmail(String pocEmail) {
this.pocEmail = pocEmail;
}



public long getAssignedTo() {
	return assignedTo;
}



public void setAssignedTo(long assignedTo) {
	this.assignedTo = assignedTo;
}



public int getInventoryLevel() {
	return inventoryLevel;
}



public void setInventoryLevel(int inventoryLevel) {
	this.inventoryLevel = inventoryLevel;
}

// String Representation:
@Override
public String toString() {
return supplyName + " " + quantity
+ " " + description + " " + expirationDate + " " + checkCycle;
}
}
