package com.poly.dao;

import java.util.List;

import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.utils.Xjpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UserDAOImpl implements UserDAO{
	
	EntityManager em = Xjpa.getEntityManager();
	
	@Override
	public List<User> findAll() {
		String jpql = "select o from User o";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		return query.getResultList();
	}

	@Override
	public User findById(String id) {
		String jpql = "select o from User o where o.id=:id or o.username=:id";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	@Override
	public void create(User user) {
		em.getTransaction().begin();
		try {
			em.persist(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		em.getTransaction().begin();
		try {
			em.merge(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		User user = em.find(User.class, id);
		em.getTransaction().begin();
		try {
			em.remove(user);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}
	
}
