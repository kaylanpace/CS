package poc;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="POC")
public class POC implements Serializable {

	private static final long serialVersionUID = 1L;

	// Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="pocId")
    Long pocId;
    
    @Column(name="firstName")
    private String firstName;
    
    @Column(name="lastName")
    private String lastName;
    
    @Column(name="phone") 
    private String phone; 
    
    @Column(name="email")
    private String email;
    
    @Column(name="vendor")
    private boolean vendor;
    
 // Constructors:
    public POC() {
    	
    }
    
 
    public POC(String firstName, String lastName, String phone, String email, boolean vendor) {
    	
    	this.firstName = firstName;
    	this.lastName = lastName;
    	this.phone = phone;
    	this.email = email;
    	this.vendor = vendor;
    	
    }


	public Long getPocId() {
		return pocId;
	}


	public void setPocId(Long pocId) {
		this.pocId = pocId;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public boolean isVendor() {
		return vendor;
	}


	public void setVendor(boolean vendor) {
		this.vendor = vendor;
	}
    
	// String Representation:
    @Override
    public String toString() {
        return  firstName + " " + lastName
        		+ " " + phone + " " + email+ " " + vendor;
    }
    
}