package com.poly.dao;

import java.sql.Date;
import java.util.List;

import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.utils.Xjpa;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class DemoInClass {
EntityManager em = Xjpa.getEntityManager();

public List<User> findEmail(String email){
	String jpql ="select o from User o where o.email like :email";
	TypedQuery<User> query = em.createQuery(jpql, User.class);
	query.setParameter("email","%"+ email);
	return (List<User>)query.getResultList();
}

public List<User> getYear(){
	String jpql = "select u from User u join u.favorites f where f.likeDate between :start and :end";
	TypedQuery<User> query = em.createQuery(jpql, User.class);
	Date start = Date.valueOf("2024-01-01");
	Date end = Date.valueOf("2024-12-31");
	query.setParameter("start", start);
	query.setParameter("end", end);
	return (List<User>)query.getResultList();
}

public List<Video> getByName(String title){
	String jpql ="select o from Video o where o.title like :title";
	TypedQuery<Video> query = em.createQuery(jpql, Video.class);
	query.setParameter("title","%"+ title + "%");
	return (List<Video>)query.getResultList();
}

public List<Video> getByLike(){
	String jpql ="select o from Video o join o.favorites f group by o having count(f) >=1 ";
	TypedQuery<Video> query = em.createQuery(jpql, Video.class);
	return (List<Video>)query.getResultList();
}

public List<Object[]> getLikesIn2024() {
    String jpql = "SELECT v, COUNT(f) " +
                  "FROM Video v JOIN v.favorites f " +
                  "WHERE f.likeDate BETWEEN :start AND :end " +
                  "GROUP BY v";
    
    TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
    query.setParameter("start", Date.valueOf("2024-01-01"));
    query.setParameter("end", Date.valueOf("2024-12-31"));
    
    return query.getResultList();
}
public static void main(String[] args) {
	DemoInClass dao = new DemoInClass();
//	List<User> list = dao.findEmail("@gmail.com");
//	List<User> list = dao.getYear();
//	List<Video> list = dao.getByName("Java");
	List<Video> list = dao.getByLike();
	list.forEach(u ->{
		System.out.println(u.getId());
	});
}
}
