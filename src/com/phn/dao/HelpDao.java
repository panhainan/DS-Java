/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.bean.Helps;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface HelpDao {
	public List<Helps> getAll();

	/**
	 * @param index
	 * @return
	 */
	public Helps find(int index);

	/**
	 * @param thelp
	 */
	public void add(Helps thelp);

	/**
	 * @param thelp
	 */
	public void update(Helps thelp);

}
