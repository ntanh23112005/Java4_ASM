package com.poly.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
@Entity
@Table (name ="Users")
public class User {
	@Id
	private String id;
	private String password;
	private String username;
	
	@Column(unique = true)
	private String email;
	private Boolean admin;
	private String hinh;
	@OneToMany(mappedBy = "user")
	private List<Favorite> favorites;

	@OneToMany(mappedBy = "user")
	private List<Share> shares;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getAdmin() {
		return admin;
	}

	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public List<Favorite> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}

	public List<Share> getShares() {
		return shares;
	}

	public void setShares(List<Share> shares) {
		this.shares = shares;
	}

	public User(String id, String password, String username, String email, Boolean admin, String hinh,
			List<Favorite> favorites, List<Share> shares) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
		this.email = email;
		this.admin = admin;
		this.hinh = hinh;
		this.favorites = favorites;
		this.shares = shares;
	}

	public User() {
		super();
	}

	
	
	
	
}
