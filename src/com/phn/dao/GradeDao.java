/**
 * 
 */
package com.phn.dao;

import com.phn.bean.Grades;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface GradeDao {

	/**
	 * @param id
	 * @return
	 */
	public Grades find(int id);

}
