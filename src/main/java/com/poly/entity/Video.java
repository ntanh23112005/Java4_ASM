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
@Table(name = "Videos")
public class Video {
	@Id
	private String id;
	
	private String title;
	
	private String poster;
	
	private String description;
	
	private boolean active;
	
	private int views;
	
	private String link;
	
	@OneToMany(mappedBy = "video")
    private List<Favorite> favorites;

	@OneToMany(mappedBy = "video")
	private List<Share> shares;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
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

	public Video(String id, String title, String poster, String description, boolean active, int views, String link,
			List<Favorite> favorites, List<Share> shares) {
		super();
		this.id = id;
		this.title = title;
		this.poster = poster;
		this.description = description;
		this.active = active;
		this.views = views;
		this.link = link;
		this.favorites = favorites;
		this.shares = shares;
	}

	public Video() {
		super();
	}

	

	
	
	
}
