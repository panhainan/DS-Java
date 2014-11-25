/**
 * 
 */
package com.phn.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.phn.bean.Comments;
import com.phn.bean.Pages;
import com.phn.bean.Topics;
import com.phn.bean.Users;
import com.phn.service.CommentService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class CommentAction {

	private CommentService commentService;
	private Comments comment;
	private Topics topic;
	private Pages pageBean;
	private List<Comments> listComment;
	private int nowPage = 1;
	HttpSession session = ServletActionContext.getRequest().getSession();

	public String newComment() throws Exception {
		Users user = (Users) session.getAttribute("tu");
		boolean flag = this.commentService.newComment(comment, user, topic);
		int pageSize = this.pageBean.getPageSize();
		int allRecords = this.pageBean.getAllRecords();
		this.nowPage = allRecords / pageSize + 1;
		if (flag != true) {
			return "comment_new_no";
		}
		return "comment_new_ok";
	}
	
	public String Delete() throws Exception{
		this.commentService.deleteComment(comment,topic);
		return "comment_delete_ok";
	}

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public Comments getComment() {
		return comment;
	}

	public void setComment(Comments comment) {
		this.comment = comment;
	}

	public Topics getTopic() {
		return topic;
	}

	public void setTopic(Topics topic) {
		this.topic = topic;
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

	public List<Comments> getListComment() {
		return listComment;
	}

	public void setListComment(List<Comments> listComment) {
		this.listComment = listComment;
	}

}
