package employee;

import java.io.Serializable;
import javax.persistence.*;
import workorder.WorkOrder;

//employee class

@Entity
@Table(name="Employee")
public class Employee implements Serializable {
	private static final long serialVersionUID = 1L;
	 
    // Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="empId")
    Long Id;
    
    @Column(name="empFirstName")
    private String empFirstName;
    
    @Column(name="empLastName")
    private String empLastName;
    
    
    @Column(name="position")
    private String position;
   
    @Column(name="age")
    private int age;
    
    //@Column(name="isAdmin")
    private boolean isAdmin;
    
    //@Column(name="userName")
    private String userName;

	//@Column(name="password")
    private String password;
	
    
	//Provides a list of all workorder Ids
	/*We will use this key to select a workorder for the employee
	from the detailed employee GUI.*/
    @ManyToOne(optional=true)
    @JoinColumn(name="workorderId", nullable=true)
    private WorkOrder workers;
    
    
   
	// Constructors:
    public Employee() {
    	
    }
    
  
 
    public Employee(String empFirstName, String empLastName,  String position, int age, boolean isAdmin, String userName, String password) {
       
        this.empFirstName = empFirstName;
        this.empLastName = empLastName;
        this.position = position;
        this.age = age;
        this.isAdmin = isAdmin;
        this.userName = userName;
        this.password = password;
        
    }
    
    //Access Methods
	public Long getEmpId() {
		return Id;
	}



	public void setEmpId(Long empId) {
		this.Id = empId;
	}
	


	public String getEmpFirstName() {
		return empFirstName;
	}



	public void setEmpFirstName(String empFirstName) {
		this.empFirstName = empFirstName;
	}



	public String getEmpLastName() {
		return empLastName;
	}



	public void setEmpLastName(String empLastName) {
		this.empLastName = empLastName;
	}



	



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public boolean isAdmin() {
		return isAdmin;
	}



	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}
	
	public WorkOrder getWorkorderId() {
		return workers;
	}


	public void setWorkorderId(WorkOrder workorderId) {
		this.workers = workorderId;
	}

	// String Representation:
    @Override
    public String toString() {
        return  empFirstName + " " + empLastName
        		+ " " + position + " " + age + " " + isAdmin + 
        		" " + userName + " " + password;
    }
}
