/**
 * 
 */
package com.phn.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.phn.bean.Comments;
import com.phn.dao.CommentDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT)
public class CommentDaoImpl implements CommentDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean add(Comments comment) {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(comment);
		return true;
	}

	@Override
	public void update(Comments comment) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(comment);
	}

	@Override
	public Comments find(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Comments comment = (Comments) session.get(Comments.class, id);
		return comment;
	}

	@Override
	public void delete(Comments comment) {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(comment);
	}

}
