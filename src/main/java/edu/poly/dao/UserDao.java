package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.poly.entity.User;
import edu.poly.entity.Video;
import edu.poly.utils.JpaUtils;

public class UserDao {
	private EntityManager em = JpaUtils.getEntityManager();

	public User create(User entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}

	public void update(User entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	public User delete(String id) {
		User entity = this.findById(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}

	public User findById(String id) {
		User entity = em.find(User.class, id);
		return entity;
	}

	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		List<User> list = query.getResultList();
		return list;
	}

//	public List<Video> findUserByFavoriteVideo(String videoId) {
////		String jpql = "SELECT DISTINCT f.username FROM Favorite f WHERE f.video.videoId = :vid";
//		String jpql = "SELECT DISTINCT f.user.username FROM Favorite f WHERE f.video.videoId = :vid";
//		EntityManager em = JpaUtils.getEntityManager();
//		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
//		query.setParameter("vid", videoId);
//		return query.getResultList();
//	}
	public List<Video> findUserByFavoriteVideo(String username) {
	    String sql = "SELECT v.* " +
	                 "FROM Favorites f " +
	                 "JOIN Videos v ON f.VideoId = v.VideoId " +
	                 "JOIN Users u ON f.Username = u.Username " +
	                 "WHERE u.Username = ?";

	    EntityManager em = JpaUtils.getEntityManager();
	    Query query = em.createNativeQuery(sql, Video.class);
	    query.setParameter(1, username);
	    return query.getResultList();
	}

//	public List<String> findUserByFavoriteVideo(String videoId) {
//        String jpql = "SELECT DISTINCT f.user.username FROM Favorite f WHERE f.video.videoId = :vid";
//        TypedQuery<String> query = em.createQuery(jpql, String.class);
//        query.setParameter("vid", videoId);
//        return query.getResultList();
//    }
}
