package project.model.location;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "State_Table")
public class StateModel {
	@Id
	@GeneratedValue
	private int sid;
	@Column(length = 40)
	private String statename;
	@Column(length = 40)
	private String statelink;
	@OneToOne
	@JoinColumn(name = "id")
	private CountryModel cm;
	public StateModel(String statename, String statelink, CountryModel cm) {
		super();
		this.statename = statename;
		this.statelink = statelink;
		this.cm = cm;
	}
	public StateModel(int sid, String statename, String statelink, CountryModel cm) {
		super();
		this.sid = sid;
		this.statename = statename;
		this.statelink = statelink;
		this.cm = cm;
	}


	public StateModel() {
		super();
	}
	public int getSid() {
		return sid;
	}
	public String getStatename() {
		return statename;
	}
	public String getStatelink() {
		return statelink;
	}
	public CountryModel getCm() {
		return cm;
	}
	
	
}
