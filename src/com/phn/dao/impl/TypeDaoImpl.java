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

import com.phn.bean.Types;
import com.phn.dao.TypeDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class TypeDaoImpl implements TypeDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(Types type) {
		Session session = sessionFactory.getCurrentSession();
		session.save(type);
		return true;
	}

	@Override
	public boolean delete(int index) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Types type) {
		Session session = sessionFactory.getCurrentSession();
		session.update(type);
		return true;
	}

	@Override
	public Types find(int index) {
		Session session = this.sessionFactory.getCurrentSession();
		Types ttype = (Types) session.get(Types.class, index);
		return ttype;
	}

	@Override
	public List<Types> getByCate(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Types ty where ty.typesCategory.id = ? order by ty.id";
		List<Types> listType = null;
		try {
			Query q = session.createQuery(hql);
			q.setInteger(0, id);
			listType = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listType;
	}

	@Override
	public List<Types> new_getByCate(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Types ty where ty.typesCategory.id = ? order by ty.id";
		List<Types> listType = null;
		try {
			Query q = session.createQuery(hql);
			q.setInteger(0, id);
			listType = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listType;
	}

	@Override
	public List<Types> manageByCate(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Types ty where ty.typesCategory.id = ? order by ty.id";
		List<Types> listType = null;
		try {
			Query q = session.createQuery(hql);
			q.setInteger(0, id);
			listType = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listType;
	}
}
