package project.model.Login;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Login_Master")
public class LoginMasterModel {
	@Id
	@GeneratedValue
	private int lid;
	@Column(length =40, unique = true)
	private String username;
	@Column(length =40)
	private String password;
	@Column(length = 40)
	private String role_name;
	@Column(length =40)
	private String image;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public LoginMasterModel(String username, String password, String role_name, String image) {
		super();
		this.username = username;
		this.password = password;
		this.role_name = role_name;
		this.image = image;
	}
	public LoginMasterModel(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public LoginMasterModel() {
		super();
	}
	
	
	
	
}
