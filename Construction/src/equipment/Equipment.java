package equipment;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import buiding.Building;


@Entity
@Table(name="Equipment")
public class Equipment implements Serializable {
	private static final long serialVersionUID = 1L;
	 
    // Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="equipId")
    Long Id;
    
    @Column(name="equipNmae")
    private String equipName;
    
    @Column(name="equipId")
    private String equipType;
    
    @Column(name="description")
    private String description;
    
    @Temporal(TemporalType.DATE)
    private Date checkCycle;

    @ManyToOne(fetch=FetchType.LAZY, optional=true)
    @JoinColumn(name="buildingId", nullable=true)
    private Building buildings;
    // Constructors:
    public Equipment() {
    	
    }
    
  
 
    public Equipment(String equipName, String equipType,  String description, Date checkCycle) {
       this.equipName = equipName;
       this.equipType = equipType;
       this.description = description;
       this.checkCycle = checkCycle;
       
        
    }
    
    //Access Methods

	public Long getId() {
		return Id;
	}



	public void setId(Long id) {
		Id = id;
	}



	public String getEquipName() {
		return equipName;
	}



	public void setEquipName(String equipName) {
		this.equipName = equipName;
	}



	public String getEquipType() {
		return equipType;
	}



	public void setEquipType(String equipType) {
		this.equipType = equipType;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}

	
	public Date getCheckCycle() {
		return checkCycle;
	}


	public void setCheckCycle(Date checkCycle) {
		this.checkCycle = checkCycle;
	}

	
	// String Representation:
    @Override
    public String toString() {
        return  equipName + " " + equipType 
        		+ " " + description  + " " + checkCycle;
    }

}
