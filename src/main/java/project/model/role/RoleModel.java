package project.model.role;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role_table")
public class RoleModel implements Serializable{
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 40)
	private String rname;
	@Column(length = 40)
	private String rdese;
	
	
	public RoleModel() {
		super();
	}
	
	
	public RoleModel(int id, String rname, String rdese) {
		super();
		this.id = id;
		this.rname = rname;
		this.rdese = rdese;
	}


	public RoleModel(String rname, String rdese) {
		super();
		this.rname = rname;
		this.rdese = rdese;
	}
	public int getId() {
		return id;
	}
	public String getRname() {
		return rname;
	}
	public String getRdese() {
		return rdese;
	}
	
	
}