package buiding;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import poc.POC;

//import workorder.WorkOrder;



@Entity
@Table(name="Building")
public class Building implements Serializable {
	private static final long serialVersionUID = 1L;
	 
    // Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="buildingId")
    Long Id;
    
    @Column(name="buildingName")
	private String buildingName;
    
	@Temporal(TemporalType.DATE)
	@Column(name="checkCycle")
	private Date checkCycle;
	
	@Column(name="street")
	private String street;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="country")
	private String country;

	@Column(name="zip")
	private int zip;

	//POC one to one FK
	@OneToOne(optional=true)
    @JoinColumn(name="pocId", unique=false, nullable=true, updatable=true)
    public POC pocId;

    // Constructors:
    public Building() {
    	
    }
    
  
 
    public Building(String buildingName, Date checkCycle, String street, String city, String state, int zip) {
       
        this.buildingName = buildingName;
        this.checkCycle = checkCycle;
        this.street = street;
        this.city = city;
        this.state = state;
        this.zip = zip;
        
        
        
    }
    
    //Accessor Methods
    public Long getId() {
		return Id;
	}



	public void setId(Long id) {
		Id = id;
	}



	public String getBuildingName() {
		return buildingName;
	}



	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}



	public Date getCheckCycle() {
		return checkCycle;
	}



	public void setCheckCycle(java.sql.Date checkCycle) {
		this.checkCycle = checkCycle;
	}



	public String getStreet() {
		return street;
	}



	public void setStreet(String street) {
		this.street = street;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public int getZip() {
		return zip;
	}



	public void setZip(int zip) {
		this.zip = zip;
	}

	// String Representation:
    @Override
    public String toString() {
        return  buildingName + " " + checkCycle
        		 + " " + street + " " + city + " " + state + " " + zip;
    }

}
