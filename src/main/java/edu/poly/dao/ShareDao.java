package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.poly.entity.Share;
import edu.poly.entity.ShareReport;
import edu.poly.utils.JpaUtils;

public class ShareDao {
	
	public List<ShareReport> reportShareByVideo(String videoId) {
		String jpql = "select new edu.poly.entity.ShareReport(s.user.username, s.user.email, s.emails, s.sharedDate) from Share s where s.video.videoId = :videoId";


		EntityManager em = JpaUtils.getEntityManager();
		List<ShareReport> list = null;
		try {
			TypedQuery<ShareReport> query = em.createQuery(jpql, ShareReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}
	
	 public void insert(Share entity) {
	        EntityManager em = JpaUtils.getEntityManager();
	        EntityTransaction trans = em.getTransaction();

	        try {
	            trans.begin();
	            em.persist(entity);
	            trans.commit();
	        } catch (Exception e) {
	            if (trans != null && trans.isActive()) {
	                trans.rollback();
	            }
	            e.printStackTrace();
	            throw e;
	        } finally {
	            if (em != null && em.isOpen()) {
	                em.close();
	            }
	        }
	    }

}