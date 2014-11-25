/**
 * 
 */
package com.phn.dao;

import java.util.List;

import org.hibernate.Query;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface PageDao {
	public int getAllRowCount(String hql);
	public List query_Objects_ForPages(String hql, int offset, int length);
}
