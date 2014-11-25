/**
 * 
 */
package com.phn.dao;

import com.phn.bean.News;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface NewDao {
	public boolean add(News tnew);

	public boolean update(News tnew);

	/**
	 * @param id
	 * @return
	 */
	public News find(int id);

	/**
	 * @param tnew
	 */
	public void delete(News tnew);
}
