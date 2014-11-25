/**
 * 
 */
package com.phn.service;

import java.util.List;

import com.phn.bean.Helps;
import com.phn.bean.Pages;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface HelpService {
	public List<Helps> getAll();

	/**
	 * @param pageSize
	 * @param nowPage
	 * @return
	 */
	public Pages ManageAllForPages(int pageSize, int nowPage);

	/**
	 * @param index
	 * @return
	 */
	public Helps find(int index);

	/**
	 * @param thelp
	 */
	public void ManageAdd(Helps thelp);

	/**
	 * @param thelp
	 */
	public void ManageUpdate(Helps thelp);
}
