/**
 * 
 */
package com.phn.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phn.bean.Topics;
import com.phn.bean.Types;

import com.phn.dao.TopicDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class TopicDaoImpl implements TopicDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(Topics topic) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(topic);
		return true;
	}

	@Override
	public void delete(Topics topic) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(topic);
	}

	@Override
	public Topics find(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Topics topic = (Topics) session.get(Topics.class, id);
		return topic;
	}

	@Override
	public List<Topics> getIndexHot(int index) {
		String hql = "from Topics topic where topic.countComment >=3 order by topic.countComment desc";
		Session session = this.sessionFactory.getCurrentSession();
		List<Topics> listTopic = null;
		try {
			Query q = session.createQuery(hql);
			q.setMaxResults(index);
			listTopic = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listTopic;
	}

	@Override
	public List<Topics> getIndexFresh(int index) {
		String hql = "from Topics topic order by topic.id desc";
		Session session = this.sessionFactory.getCurrentSession();
		List<Topics> listTopic = null;
		try {
			Query q = session.createQuery(hql);
			q.setMaxResults(index);
			listTopic = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listTopic;
	}

	@Override
	public List<Topics> getAll() {
		String hql = "from Topics topic order by topic.id desc";
		Session session = this.sessionFactory.getCurrentSession();
		List<Topics> listTopic = null;
		try {
			Query q = session.createQuery(hql);
			listTopic = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listTopic;
	}

	@Override
	public boolean update(Topics topic) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(topic);
		return true;
	}

	@Override
	public List<Topics> getByType(List<Types> listType) {
		String hql = "from Topics topic where topic.topicsType.id = ? order by topic.id desc";
		Session session = this.sessionFactory.getCurrentSession();
		List<Topics> listTopic = new ArrayList();
		try {
			for (int i = 0; i < listType.size(); i++) {
				Query q = session.createQuery(hql);
				q.setInteger(0, listType.get(i).getId());
				List<Topics> listTop = new ArrayList();
				listTop = q.list();
				listTopic.addAll(listTop);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listTopic;
	}

	@Override
	public List<Topics> getIndexNice(int index) {
		String hql = "from Topics topic where topic.niceTopic =1 order by topic.id desc";
		Session session = this.sessionFactory.getCurrentSession();
		List<Topics> listTopic = null;
		try {
			Query q = session.createQuery(hql);
			q.setMaxResults(index);
			listTopic = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listTopic;
	}

}
