/**
 * 
 */
package com.phn.action;

import java.util.Date;
import java.util.List;

import com.phn.bean.Helps;
import com.phn.bean.Pages;
import com.phn.service.HelpService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class HelpAction {

	private Helps thelp;
	private List<Helps> listHelp;
	private HelpService helpService;
	private Pages pageBean;
	private int helpId = 1;
	private int helpSize;
	private int nowPage = 0;

	public String getAll() throws Exception {
		this.listHelp = this.helpService.getAll();
		this.thelp = this.helpService.find(helpId);
		if(thelp==null){
			return "error";
		}
		this.helpSize = this.listHelp.size();
		return "help_getAll_ok";
	}

	public String getIndexHelp() throws Exception {
		this.listHelp = this.helpService.getAll();
		this.thelp = this.helpService.find(helpId);
		if(thelp==null){
			return "error";
		}
		return "help_getIndex_ok";
	}

	public String ManageAll() throws Exception {
		this.pageBean = this.helpService.ManageAllForPages(10, nowPage);
		this.listHelp = pageBean.getListHelp();
		return "help_mangeAll_ok";
	}
	public String ManageGoUpdate() throws Exception {
		this.thelp = this.helpService.find(this.thelp.getId());
		if(thelp==null){
			return "error";
		}
		return "help_manageGoUpdate_ok";
	}
	
	public String ManageAdd() throws Exception{
		Date ttime = new Date();
		this.thelp.setNewtime(ttime);
		this.helpService.ManageAdd(thelp);
		return "help_ManageAdd_ok";
	}

	public String ManageUpdate() throws Exception {
		Date ttime = new Date();
		this.thelp.setNewtime(ttime);
		this.helpService.ManageUpdate(thelp);
		return "help_manageUpdate_ok";
	}
	public Helps getThelp() {
		return thelp;
	}

	public void setThelp(Helps thelp) {
		this.thelp = thelp;
	}

	public List<Helps> getListHelp() {
		return listHelp;
	}

	public void setListHelp(List<Helps> listHelp) {
		this.listHelp = listHelp;
	}

	public HelpService getHelpService() {
		return helpService;
	}

	public void setHelpService(HelpService helpService) {
		this.helpService = helpService;
	}

	public int getHelpId() {
		return helpId;
	}

	public void setHelpId(int helpId) {
		this.helpId = helpId;
	}

	public int getHelpSize() {
		return helpSize;
	}

	public void setHelpSize(int helpSize) {
		this.helpSize = helpSize;
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

}
