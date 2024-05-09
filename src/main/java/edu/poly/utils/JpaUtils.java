package edu.poly.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	private static EntityManagerFactory fatory;

//	static public EntityManager getEntityManager() {
//		if (fatory == null || !fatory.isOpen()) {
//			fatory = Persistence.createEntityManagerFactory("Assignment_JAVA");
//		}
//		return fatory.createEntityManager();
//	}
	public static EntityManager getEntityManager() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("Assignment_JAVA");
		
		return emf.createEntityManager();
	}
	static public void shutdown() {
		if (fatory != null && fatory.isOpen()) {
			fatory.close();
		}
		fatory = null;
	}

}
