package com.poly.dao;

import java.util.List;

import com.poly.entity.User;

public interface UserDAO {
	public List<User> findAll();
	public User findById(String id);
	public void create(User user);
	public void update(User user);
	public void delete(String id);
}
