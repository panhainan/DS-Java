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

import com.phn.bean.Helps;
import com.phn.dao.HelpDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class HelpDaoImpl implements HelpDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Helps> getAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql="from Helps hel order by hel.id asc";
		List<Helps> listHelp = null;
		try {
			Query q = session.createQuery(hql);
			listHelp = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listHelp;
	}

	@Override
	public Helps find(int index) {
		Session session = sessionFactory.getCurrentSession();
		Helps thelp = (Helps) session.get(Helps.class, index);
		return thelp;
	}

	@Override
	public void add(Helps thelp) {
		Session session = sessionFactory.getCurrentSession();
		session.save(thelp);
	}
	@Override
	public void update(Helps thelp) {
		Session session = sessionFactory.getCurrentSession();
		session.update(thelp);
	}

}
