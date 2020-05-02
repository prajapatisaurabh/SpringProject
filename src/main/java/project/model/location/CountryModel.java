package project.model.location;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Country_Table")
public class CountryModel {
	@Id
	@GeneratedValue
	private int id;
	@Column(length = 40)
	private String cname;
	@Column(length = 40)
	private String code;
	public int getId() {
		return id;
	}
	public String getCname() {
		return cname;
	}
	public String getCode() {
		return code;
	}
	public CountryModel(String cname, String code) {
		super();
		this.cname = cname;
		this.code = code;
	}
	
	
	public CountryModel(int id, String cname, String code) {
		super();
		this.id = id;
		this.cname = cname;
		this.code = code;
	}
	public CountryModel() {
		super();
	}
	public CountryModel(int id) {
		super();
		this.id = id;
	}
	
	
	
	
}
