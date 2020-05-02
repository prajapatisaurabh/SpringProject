package project.model.privillege;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Pcomponent_Table")
public class PcomponentModel {
	@Id
	@GeneratedValue
	private int pid;
	@Column(length = 40)
	private String componentname;
	@Column(length = 40)
	private String componentlink;
	@OneToOne
	@JoinColumn(name = "id")
	private PrivilegeModel  pm;
	public PcomponentModel(String componentname, String componentlink, PrivilegeModel pm) {
		super();
		this.componentname = componentname;
		this.componentlink = componentlink;
		this.pm = pm;
	}
	
	
	public PcomponentModel(int pid, String componentname, String componentlink, PrivilegeModel pm) {
		super();
		this.pid = pid;
		this.componentname = componentname;
		this.componentlink = componentlink;
		this.pm = pm;
	}


	public PcomponentModel() {
		super();
	}
	public int getPid() {
		return pid;
	}
	public String getComponentname() {
		return componentname;
	}
	public String getComponentlink() {
		return componentlink;
	}
	public PrivilegeModel getPm() {
		return pm;
	}
	
	
	
}
