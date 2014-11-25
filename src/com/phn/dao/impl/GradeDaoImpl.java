/**
 * 
 */
package com.phn.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.phn.bean.Grades;
import com.phn.dao.GradeDao;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class GradeDaoImpl implements GradeDao{
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public Grades find(int id) {
		Session session = sessionFactory.getCurrentSession();
		Grades grade = (Grades) session.get(Grades.class, id);
		return grade;
	}

}
