/**
 * 
 */
package com.phn.service;


import com.phn.bean.Pages;
import com.phn.bean.Types;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */

public interface TypeService {
	public Pages getAllForPages(int pageSize, int nowPage, int typeId);

	/**
	 * @param id
	 * @return
	 */
	public Types find(int id);

	/**
	 * @param type
	 */
	public void add(Types type);

	/**
	 * @param type
	 */
	public void update(Types type);
	
}
