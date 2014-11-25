/**
 * 
 */
package com.phn.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phn.bean.Topics;
import com.phn.dao.PageDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class PageDaoImpl implements PageDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public int getAllRowCount(String hql) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		// session.close();
		return q.list().size();
	}

	@Override
	public List query_Objects_ForPages(String hql, int offset, int length) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		List list = q.list();
		// session.close();
		return list;
	}

}
