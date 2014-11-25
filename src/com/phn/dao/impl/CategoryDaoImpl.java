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

import com.phn.bean.Categorys;
import com.phn.dao.CategoryDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class CategoryDaoImpl implements CategoryDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(Categorys cate) {
		Session session = sessionFactory.getCurrentSession();
		session.save(cate);
		return true;
	}

	@Override
	public boolean delete(int index) {
		return false;
	}

	@Override
	public boolean update(Categorys cate) {
		Session session = sessionFactory.getCurrentSession();
		session.update(cate);
		return true;
	}

	@Override
	public List<Categorys> getAll() {
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Categorys as cate order by cate.id";
		List<Categorys> listCate = null;
		try {
			Query q = session.createQuery(hql);
			listCate = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return listCate;
	}

	@Override
	public Categorys find(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Categorys category = (Categorys) session.get(Categorys.class, id);
		return category;
	}

}
