package com.poly.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.UniqueConstraint;


@Entity
@Table(name = "Favorites", uniqueConstraints = {@UniqueConstraint(columnNames = {"user_id","video_id"})})
public class Favorite {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserId")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name ="VideoId")
	private Video video;
	
	@Temporal(TemporalType.DATE)
	private Date likeDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public Favorite(Long id, User user, Video video, Date likeDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.likeDate = likeDate;
	}

	public Favorite() {
		super();
	}
	
	
	
	
}
