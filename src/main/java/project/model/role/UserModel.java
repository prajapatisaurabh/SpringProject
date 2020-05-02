package project.model.role;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "User_table")
public class UserModel implements Serializable {
	@Id
	@GeneratedValue
	private int uid;
	@Column(length = 40 ,unique = true)
	private String uname;
	@Column(length = 40)
	private String email;
	@Column(length = 40)
	private String filename;
	public UserModel(String uname, String email, String filename) {
		super();
		this.uname = uname;
		this.email = email;
		this.filename = filename;
	}
	
	
	public UserModel(int uid, String uname, String email, String filename) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.email = email;
		this.filename = filename;
	}


	public UserModel(int uid, String uname, String email) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.email = email;
	}


	public UserModel(String uname, String email) {
		super();
		this.uname = uname;
		this.email = email;
	}
	public UserModel() {
		super();
	}
	public int getUid() {
		return uid;
	}
	public String getUname() {
		return uname;
	}
	public String getEmail() {
		return email;
	}
	public String getFilename() {
		return filename;
	}
	
	
	
}
