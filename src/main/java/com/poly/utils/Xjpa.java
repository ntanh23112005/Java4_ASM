package com.poly.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class Xjpa {
	private static EntityManagerFactory factory; 
	 static { 
	  factory = Persistence.createEntityManagerFactory("Lab3_Java4"); 
	 } 
	 public static EntityManager getEntityManager(){ 
	  return factory.createEntityManager(); 
	 }
}
