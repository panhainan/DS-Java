/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.bean.Types;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface TypeDao {
	public boolean add(Types type);
	public boolean delete(int index);
	public boolean update(Types type);
	public Types find(int index);
	/**
	 * @param id
	 * @return
	 */
	public List<Types> getByCate(int id);
	public List<Types> new_getByCate(int id);
	/**
	 * @param id
	 * @return
	 */
	public List<Types> manageByCate(int id);
}
