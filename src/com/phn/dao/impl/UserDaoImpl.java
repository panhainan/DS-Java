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
import com.phn.bean.Users;
import com.phn.dao.UserDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class UserDaoImpl implements UserDao {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(user);
		return true;

	}

	@Override
	public boolean delete(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(user);
		return true;
	}

	@Override
	public Users find(int index) {
		Session session = this.sessionFactory.getCurrentSession();
		Users user = (Users) session.get(Users.class, index);
		return user;
	}

	@Override
	public boolean update(Users user) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(user);
		return true;
	}

	@Override
	public Users findByNP(Users user) {
		String hql = "from Users u where u.username  = ? and u.password = ?";
		Session session = this.sessionFactory.getCurrentSession();
		List<Users> listUser = null;
		Users us = null;
		try {
			Query q = session.createQuery(hql);
			q.setString(0, user.getUsername());
			q.setString(1, user.getPassword());
			listUser = q.list();
			if (listUser.size() > 0) {
				us = listUser.get(0);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return us;
	}

	@Override
	public boolean findByName(String userName) {
		String hql = "from Users u where u.username  = ?";
		Session session = this.sessionFactory.getCurrentSession();
		List<Users> listUser = null;
		try {
			Query q = session.createQuery(hql);
			q.setString(0, userName);
			listUser = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		if (listUser.size() > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public boolean findByNic(String userNic) {
		String hql = "from Users u where u.nickname  = ?";
		Session session = this.sessionFactory.getCurrentSession();
		List<Users> listUser = null;
		try {
			Query q = session.createQuery(hql);
			q.setString(0, userNic);
			listUser = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		if (listUser.size() > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public List<Topics> getToipcs(int id) {
		System.out.println("通知：here id user dao impl");
		Session session = this.sessionFactory.getCurrentSession();
		String hql = "from Topics as topic  where topic.topicsUser.id =" + id
				+ " order by topic.id desc";
		List<Topics> listTopic = null;
		try {
			Query q = session.createQuery(hql);
			listTopic = q.list();
		} catch (HibernateException e) {
			System.out.println("获取失败，here is user dao impl");
			e.printStackTrace();
		} finally {
			// session.close();
		}
		System.out.println("通知：user dao impl over");
		return listTopic;
	}
}
