/**
 * 
 */
package com.phn.dao;

import java.util.List;

import com.phn.bean.Categorys;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface CategoryDao {
	public boolean add(Categorys cate);
	public boolean delete(int index);
	public boolean update(Categorys cate);
	public List<Categorys> getAll();
	/**
	 * @param id
	 * @return
	 */
	public Categorys find(int id);
}
