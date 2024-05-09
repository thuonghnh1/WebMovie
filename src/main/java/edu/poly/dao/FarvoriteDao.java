package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.entity.Favorite;
import edu.poly.entity.FavoriteReport;
import edu.poly.entity.FavoriteUserReport;
import edu.poly.entity.Video;
import edu.poly.utils.JpaUtils;

public class FarvoriteDao {
	private EntityManager em = JpaUtils.getEntityManager();
	public Favorite create(Favorite entity) {
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
	
	public Favorite update(Favorite entity) {
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
	
	public Favorite delete(Integer integer) {
		Favorite entity = this.findById(integer);
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
	
	public Favorite findById(Integer id) {
		Favorite entity = em.find(Favorite.class, id);
		return entity;
	}
	
	public List<Favorite> findAll(){
		String jpql = "SELECT f FROM Favorite f";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		List<Favorite> list = query.getResultList();
		return list;
	}
	public Integer selectId(String idP, String idND) {
		String jpql = "select o.favoriteId from Favorite o where o.video.videoId like :up and o.user.username like :und";
		TypedQuery<Integer> query = em.createQuery(jpql, Integer.class);
		query.setParameter("up", idP);
		query.setParameter("und", idND);
		int result = query.getSingleResult();
		return result;
	}
	public List<FavoriteReport> reportFavoritesByVideo() {
		String jpql = "select new edu.poly.entity.FavoriteReport(f.video.title, count(f),max(f.likedDate), min(f.likedDate)) from Favorite f group by f.video.title";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteReport> list = null;
		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}
	public List<FavoriteUserReport> reportFavoriteUsersByVideo(String videoId) {
		String jpql = "select new edu.poly.entity.FavoriteUserReport(f.user.username, f.user.fullname, f.user.email,f.likedDate)"
				+ "from Favorite f where f.video.videoId = :videoId";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteUserReport> list = null;
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}
//	public List<Video> fillToFavo(String id){
////		String jpql = "select * from Video inner join Favorite on Video.videoId = Favorite.videoId where username like :uid";
////		String jpql= "SELECT o.video FROM Favorite o WHERE o.videoId.username=:uid";
//		EntityManager em = JpaUtils.getEntityManager();
//		TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
////		Query query = em.createNativeQuery(jpql, Video.class);
//		query.setParameter("uid", id);
//		List<Video> list = query.getResultList();
//		return list;
//	}
//	public List<String> fillToFavo(String id) {
//	    TypedQuery<String> query = em.createNamedQuery("Video.findByUser", String.class);
//	    query.setParameter("uid", id);
//	    List<String> list = query.getResultList();
//	    return list;
//	}
//	public List<Video> fillToFavo(String id) {
//	    TypedQuery<Video> query = em.createNamedQuery("Video.findByUser", Video.class);
//	    query.setParameter("uid", id);
//	    List<Video> list = query.getResultList();
//	    return list;
//	}

}
