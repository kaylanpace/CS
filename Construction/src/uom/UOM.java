package uom;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@Table(name="UOM")
public class UOM implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// Persistent Fields:
    @Id @GeneratedValue 
    @Column(name="uomId")
    Long Id;
    
    @Column(name="uomName")
    private String uomName;
    
    @Column(name="description")
    private String description;
  	
  	 // Constructors:
    public UOM() {
    	
    }
       
    public UOM(String uomName, String description) {
       this.uomName = uomName;
       this.description = description;
 
    }

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getUomName() {
		return uomName;
	}

	public void setUomName(String uomName) {
		this.uomName = uomName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	// String Representation:
    @Override
    public String toString() {
        return  uomName + " " + description;
    }
    
    
}