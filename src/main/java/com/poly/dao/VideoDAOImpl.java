package com.poly.dao;

import java.util.List;

import com.poly.entity.Video;
import com.poly.utils.Xjpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class VideoDAOImpl implements VideoDAO {
EntityManager em = Xjpa.getEntityManager();

	@Override
	public List<Video> findAll() {
		String jpql = "select o from Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return (List<Video>)query.getResultList();
	}

	@Override
	public Video findById(String id) {
		String jpql ="select o from Video o where o.id=:id or o.title=:id";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("id", id);
		return (Video)query.getSingleResult();
	}

	@Override
	public void create(Video video) {
		em.getTransaction().begin();
		try {
			em.persist(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void update(Video video) {
		em.getTransaction().begin();
		try {
			em.merge(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		Video video = em.find(Video.class, id);
		em.getTransaction().begin();
		try {
			em.remove(video);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		VideoDAOImpl dao =  new VideoDAOImpl();
		System.out.println(dao.findAll());
	}
}
