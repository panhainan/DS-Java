/**
 * 
 */
package com.phn.action;

import java.util.List;

import com.phn.bean.Pages;
import com.phn.bean.Topics;
import com.phn.bean.Types;
import com.phn.service.TypeService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class TypeAction {
	private Types type;
	private Pages pageBean;
	private int nowPage = 1;
	private List<Topics> listTopic;
	private TypeService typeService;

	public String goType() throws Exception {
		this.type = this.typeService.find(type.getId());
		if(type==null){
			return "error";
		}
		this.pageBean = this.typeService.getAllForPages(10, nowPage,
				type.getId());
		this.listTopic = this.pageBean.getListTopics();
		return "type_go_ok";
	}

	public String ManageAdd() throws Exception {
		this.typeService.add(type);
		return "type_manageAdd_ok";
	}

	public String ManageUpdate() throws Exception {
		this.typeService.update(type);
		return "type_manageUpdate_ok";
	}

	public Types getType() {
		return type;
	}

	public void setType(Types type) {
		this.type = type;
	}

	public Pages getPageBean() {
		return pageBean;
	}

	public void setPageBean(Pages pageBean) {
		this.pageBean = pageBean;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public List<Topics> getListTopic() {
		return listTopic;
	}

	public void setListTopic(List<Topics> listTopic) {
		this.listTopic = listTopic;
	}

	public TypeService getTypeService() {
		return typeService;
	}

	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}

}
