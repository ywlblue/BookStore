package com.bookstore.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "users")
@NamedQueries({
	@NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u ORDER BY u.fullname"),
	@NamedQuery(name = "Users.countAll", query = "SELECT COUNT(*) FROM Users u"),
	@NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
	@NamedQuery(name = "Users.checkLogin", query = "SELECT u FROM Users u WHERE u.email = :email AND u.password = :password")
})
public class Users {
	private Integer id; // primary key
	private String fullname;
	private String email;
	private String password;

	
	
	public Users() {
		super();
	}

	// for new user creation
	public Users(String email, String fullname, String password) {
		this.fullname = fullname;
		this.email = email;
		this.password = password;
	}
	
	// for update
	public Users(Integer id, String email, String fullname, String password) {
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
	}

	@Column(name = "user_id")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "full_name")
	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
