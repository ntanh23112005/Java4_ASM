package com.poly.dao;

import java.util.List;

import com.poly.entity.Favorite;

public interface FavoriteDAO {
	public List<Favorite> findAll();
	public List<Favorite> findByVideo(String id);
	public List<Favorite> findByUser(String id);
}
