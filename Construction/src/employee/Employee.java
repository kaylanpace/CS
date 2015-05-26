package employee;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Calendar;

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
    
    private Date dob;
   
    //@Column(name="userName")
    private String userName;

	//@Column(name="password")
    private String password;
    
    private Boolean isAdmin;
    
 
   




	private long assignedTo;


	private boolean inWork = false;
   
////    @Column(name="assignedTo")
//    private ArrayList<Long> assignedTo;
//    
//    public void addWorker(long id){
//    	assignedTo.add(id);
//    }
//	public void clearAssignedTo(){
//		assignedTo.clear();
//	}
//	public ArrayList<Long> getWorkers(){
//		return assignedTo;
//	}

	//Provides a list of all workorder Ids
	/*We will use this key to select a workorder for the employee
	from the detailed employee GUI.*/
    @ManyToOne(optional=true)
    @JoinColumn(name="workorderId", nullable=true)
    private WorkOrder workers;
    
    
   
	// Constructors:
    public Employee() {
    	
    }
    
  
 
    public Employee(String empFirstName, String empLastName,  String position, Date dob, boolean isAdmin, String userName, String password) {
       
        this.empFirstName = empFirstName;
        this.empLastName = empLastName;
        this.position = position;
        this.dob = dob;
        this.age = getAge(this.dob);
        this.isAdmin = isAdmin;
        this.userName = userName;
        this.password = password;
        
    }
    
    // Takes the employee's date of birth and calculates age
    public int getAge(Date empDob)
    {
    	Calendar dob = Calendar.getInstance();
    	dob.setTime(empDob);
    	Calendar today = Calendar.getInstance();
    	int age = today.get(Calendar.YEAR) - dob.get(Calendar.YEAR);
    	if (today.get(Calendar.DAY_OF_YEAR) <= dob.get(Calendar.DAY_OF_YEAR))
    	age--;
    	return age;
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
	
    public boolean getInWork() {
			return inWork;
		}



	public void setInWork(boolean inWork) {
			this.inWork = inWork;
		}

	 public long getAssignedTo() {
			return assignedTo;
		}



	public void setAssignedTo(long assignedTo) {
			this.assignedTo = assignedTo;
		}
	

	// String Representation:
    @Override
    public String toString() {
        return  empFirstName + " " + empLastName
        		+ " " + position + " " + age + " "  + 
        		" " + userName + " " + password;
    }
}