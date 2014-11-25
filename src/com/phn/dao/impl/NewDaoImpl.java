/**
 * 
 */
package com.phn.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.phn.bean.News;
import com.phn.dao.NewDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class NewDaoImpl implements NewDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(News tnew) {
		Session session = sessionFactory.getCurrentSession();
		session.save(tnew);
		return true;
	}

	@Override
	public boolean update(News tnew) {
		Session session = sessionFactory.getCurrentSession();
		session.update(tnew);
		return true;
	}
	@Override
	public News find(int id) {
		Session session = sessionFactory.getCurrentSession();
		News tnew = (News) session.get(News.class,id);
		return tnew;
	}

	@Override
	public void delete(News tnew) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(tnew);
	}

}
