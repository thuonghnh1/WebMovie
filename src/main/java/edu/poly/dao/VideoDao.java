package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.entity.Video;
import edu.poly.utils.JpaUtils;

public class VideoDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public Video create(Video entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	
	public Video update(Video entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}
	
	public Video delete(String id) {
		Video entity = this.findById(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}
	
	public Video findById(String videoId) {
		Video entity = em.find(Video.class, videoId);
		return entity;
	}
//	public Video findById(String videoId) {
//	    try {
//	    	if (videoId == null || videoId.isEmpty()) {
//	            throw new IllegalArgumentException("Invalid videoId provided");
//	        }
//	        em.getTransaction().begin();
//	        Video entity = em.find(Video.class, videoId);
//	        em.getTransaction().commit();
//	        return entity;
//	    } catch (Exception e) {
//	        em.getTransaction().rollback();
//	        throw new RuntimeException("Error finding Video by ID: " + e.getMessage());
//	    }
//	}

	public List<Video> findAll(){
		String jpql = "SELECT v FROM Video v";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}
	
	public Long Count() {
		String jpql = "SELECT count(v) FROM Video v";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		long result = query.getSingleResult();
		return result;
	}
	public List<Video> fillToFavo(String id) {
	    TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
	    query.setParameter("uid", id);
	    List<Video> list = query.getResultList();
	    return list;
	}
}
