package com.poly.entity;

import java.sql.Date;

import jakarta.persistence.Entity;
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
@Table(name="Shares", uniqueConstraints = {@UniqueConstraint(columnNames = {"user_id","video_id"})})
public class Share {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name="UserId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="VideoId")
	private Video video;
	
	private String emails;
	
	@Temporal(TemporalType.DATE)
	private Date shareDate;

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

	public String getEmails() {
		return emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}

	public Date getShareDate() {
		return shareDate;
	}

	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}

	public Share(Long id, User user, Video video, String emails, Date shareDate) {
		super();
		this.id = id;
		this.user = user;
		this.video = video;
		this.emails = emails;
		this.shareDate = shareDate;
	}

	public Share() {
		super();
	}
	
	
	
	
}
