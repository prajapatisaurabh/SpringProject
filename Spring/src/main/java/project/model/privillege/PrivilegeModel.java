package project.model.privillege;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Privilege_Table")
public class PrivilegeModel implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 40)
	private String pname;
	@Column(length = 40)
	private String pcode;
	
	public PrivilegeModel(){
	}

	public PrivilegeModel(String pname, String pcode) {
		super();
		this.pname = pname;
		this.pcode = pcode;
	}
	
	

	public PrivilegeModel(int id, String pname, String pcode) {
		super();
		this.id = id;
		this.pname = pname;
		this.pcode = pcode;
	}

	public PrivilegeModel(int id) {
		super();
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public String getPname() {
		return pname;
	}

	public String getPcode() {
		return pcode;
	}
	
}
