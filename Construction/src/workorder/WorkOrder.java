package workorder;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.*;
import poc.POC;
import employee.Employee;

@Entity
@Table(name="WorkOrder")
public class WorkOrder implements Serializable {
private static final long serialVersionUID = 1L;

// Persistent Fields:
@Id @GeneratedValue
@Column(name="workorderId")
Long Id;

@Column(name="description")
private String description;

@Column(name="priorityLevel")
private String priorityLevel;

@Column(name="status")
private String status;

@OneToMany(mappedBy="workers")
private List<Employee> workers;

@OneToOne(optional=true)
@JoinColumn(name="pocId", unique=false, nullable=true, updatable=true)
private POC pocId;

@Column(name="startDate")
@Temporal(TemporalType.DATE)
private Date startDate;

@Column(name="expectedFinish")
@Temporal(TemporalType.DATE)
private Date expectedFinish;

@Column(name="finishDate")
@Temporal(TemporalType.DATE)
private Date finishDate;

public String getLaborSummary() {
return laborSummary;
}

public void setLaborSummary(String laborSummary) {
this.laborSummary = laborSummary;
}

@Column(name="laborSummary")
private String laborSummary;

@Column(name="comments")
private String comments;


// Constructors:
public WorkOrder() {
}

public WorkOrder(String description, String priorityLevel, String status) {
//this.workorderId = workorderId;
this.description = description;
this.priorityLevel = priorityLevel;
this.status = status;
}
public WorkOrder(String description, String priorityLevel, String status, String comments, Date expectedFinish) {
//this.workorderId = workorderId;
this.description = description;
this.priorityLevel = priorityLevel;
this.status = status;
this.comments = comments;
this.expectedFinish = expectedFinish;
}
//Acessor Methods
public Long getWorkorderId() {
return Id;
}

public void setWorkorderId(Long Id) {
this.Id = Id;
}

public String getDescription() {
return description;
}

public void setDescription(String description) {
this.description = description;
}

public String getPriorityLevel() {
return priorityLevel;
}

public void setPriorityLevel(String priorityLevel) {
this.priorityLevel = priorityLevel;
}

public String getStatus() {
return status;
}

public void setStatus(String status) {
this.status = status;
}

public static long getSerialversionuid() {
return serialVersionUID;
}

public List<Employee> getWorkers() {
return workers;
}

public void setWorkers(List<Employee> workers) {
this.workers = workers;
}

public POC getPocId() {
return pocId;
}

public void setPocId(POC pocId) {
this.pocId = pocId;
}

public Date getStartDate() {
return startDate;
}

public void setStartDate(Date startDate) {
this.startDate = startDate;
}

public Date getExpectedFinish() {
return expectedFinish;
}

public void setExpectedFinish(Date expectedFinish) {
this.expectedFinish = expectedFinish;
}

public Date getFinishDate() {
return finishDate;
}

public void setFinishDate(Date finishDate) {
this.finishDate = finishDate;
}

public String getComments() {
return comments;
}

public void setComments(String comments) {
this.comments = comments;
}

@Override
public String toString() {
return description + " " + priorityLevel + " " + status;
}
}
