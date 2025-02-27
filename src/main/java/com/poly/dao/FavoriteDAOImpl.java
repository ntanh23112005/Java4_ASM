package com.poly.dao;

import java.util.List;

import com.poly.entity.Favorite;
import com.poly.utils.Xjpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class FavoriteDAOImpl implements FavoriteDAO {
EntityManager em = Xjpa.getEntityManager();

	@Override
	public List<Favorite> findAll() {
		String jpql ="select o from Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class); 
		return (List<Favorite>)query.getResultList();
	}

	@Override
	public List<Favorite> findByVideo(String id) {
		String jpql = "select o from Favorite o where o.video.id=:id";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("id", id);
		return (List<Favorite>)query.getResultList();
	}


	@Override
	public List<Favorite> findByUser(String id) {
		String jpql = "select o from Favorite o where o.user.id=:id";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("id", id);
		return (List<Favorite>)query.getResultList();
	}
}
