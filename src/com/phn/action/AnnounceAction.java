/**
 * 
 */
package com.phn.action;

import java.util.Date;
import java.util.List;

import com.phn.bean.Announces;
import com.phn.bean.Pages;
import com.phn.service.AnnounceService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class AnnounceAction {

	private Announces announce;
	private AnnounceService announceService;
	private List<Announces> listAnno;
	private Pages pageBean;
	private int annoId = 1;
	private int annoSize;
	private int nowPage = 0;

	public String getIndexAnno() throws Exception {
		this.listAnno = this.announceService.getIndexAnno(6);
		this.announce = this.announceService.find(annoId);
		if(announce==null){
			return "error";
		}
		return "anno_getIndex_ok";
	}

	public String getAll() throws Exception {
		this.listAnno = this.announceService.getAll();
		this.announce = this.announceService.find(annoId);
		if(announce==null){
			return "error";
		}
		this.annoSize = this.listAnno.size();
		return "anno_getAll_ok";
	}

	public String ManageAll() throws Exception {
		this.pageBean = this.announceService.ManageAllForPages(10, nowPage);
		this.listAnno = pageBean.getListAnno();
		return "anno_mangeAll_ok";
	}

	public String ManageGoUpdate() throws Exception {
		this.announce = this.announceService.find(this.announce.getId());
		if(announce==null){
			return "error";
		}
		return "anno_manageGoUpdate_ok";
	}
	
	public String ManageAdd() throws Exception{
		Date ttime = new Date();
		this.announce.setThetime(ttime);
		this.announceService.ManageAdd(announce);
		return "anno_ManageAdd_ok";
	}

	public String ManageUpdate() throws Exception {
		Date ttime = new Date();
		announce.setThetime(ttime);
		this.announceService.ManageUpdate(announce);	
		return "anno_manageUpdate_ok";
	}

	public AnnounceService getAnnounceService() {
		return announceService;
	}

	public void setAnnounceService(AnnounceService announceService) {
		this.announceService = announceService;
	}

	public List<Announces> getListAnno() {
		return listAnno;
	}

	public void setListAnno(List<Announces> listAnno) {
		this.listAnno = listAnno;
	}

	public int getAnnoId() {
		return annoId;
	}

	public void setAnnoId(int annoId) {
		this.annoId = annoId;
	}

	public int getAnnoSize() {
		return annoSize;
	}

	public void setAnnoSize(int annoSize) {
		this.annoSize = annoSize;
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

	public Announces getAnnounce() {
		return announce;
	}

	public void setAnnounce(Announces announce) {
		this.announce = announce;
	}

}
