package edu.poly.entity;

import java.util.Date;

public class FavoriteUserReport {
	private String username, fullname, email;
	private Date likedDate;

	public FavoriteUserReport() {

	}

	public FavoriteUserReport(String username, String fullname, String email, Date likedDate) {
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.likedDate = likedDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

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

	public Date getLikeDate() {
		return likedDate;
	}

	public void setLikeDate(Date likedDate) {
		this.likedDate = likedDate;
	}
}
