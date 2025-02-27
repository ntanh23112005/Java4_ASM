package com.poly.dao;

import java.util.List;

import com.poly.entity.Video;

public interface VideoDAO {
	public List<Video> findAll();
	public Video findById(String id);
	public void create(Video video);
	public void update(Video video);
	public void delete(String id);
}
