package log;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import workorder.WorkOrder;
import employee.Employee;


@Entity
@Table(name="EmployeeLog")
public class EmployeeLog implements Serializable{
	private static final long serialVersionUID = 1L;
	private Employee employee;
	private WorkOrder workorder;
	
	 @Id @GeneratedValue 
	 @Column(name="logID")
	 Long logId;

	 //Unidirectional relationship between Employee and EmployeeLog
	 //join column will be empId
	 @ManyToOne(fetch=FetchType.LAZY, optional=true)
	 @JoinColumn(name="empId", nullable=true)
	 public Employee getEmployee(){return employee;}
	 
	 @ManyToOne(fetch=FetchType.LAZY, optional=true)
	 @JoinColumn(name="workorderId", nullable=true)
	 public WorkOrder getWorkorder(){return workorder;}

	 @Column(name="startTime")
	 private Date startTime;
	 
	 @Column(name="endTime")
	 private Date endTime;
	 
	 @Column(name="hours")
	 private double hours;
	 
	// Constructors:
	    public EmployeeLog() {
	    	
	    }
	    
	  
	 
	    public EmployeeLog(Date startTime, Date endTime, double hours) {
	       this.startTime = startTime;
	       this.endTime = endTime;
	       this.hours = hours;
	        
	    }
	 
	 //Accessor Methods
	 public Long getLogId() {
			return logId;
		}

		public void setLogId(Long logId) {
			this.logId = logId;
		}

		public Date getStartTime() {
			return startTime;
		}

		public void setStartTime(Date startTime) {
			this.startTime = startTime;
		}

		public Date getEndTime() {
			return endTime;
		}

		public void setEndTime(Date endTime) {
			this.endTime = endTime;
		}

		public double getHours() {
			return hours;
		}

		public void setHours(double hours) {
			this.hours = hours;
		}
		
		// String Representation:
	    @Override
	    public String toString() {
	        return  startTime + " " + endTime
	        		 + " " + hours;
	    }
}
