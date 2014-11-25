/**
 * 
 */
package com.phn.service.impl;

import java.util.Date;

import com.phn.bean.Comments;
import com.phn.bean.News;
import com.phn.bean.Topics;
import com.phn.bean.Users;
import com.phn.dao.CommentDao;
import com.phn.dao.NewDao;
import com.phn.dao.PageDao;
import com.phn.dao.TopicDao;
import com.phn.service.CommentService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */

public class CommentServiceImpl implements CommentService {
	private CommentDao commentDao;
	private PageDao pageDao;
	private TopicDao topicDao;
	private NewDao newDao;

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public PageDao getPageDao() {
		return pageDao;
	}

	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	public NewDao getNewDao() {
		return newDao;
	}

	public void setNewDao(NewDao newDao) {
		this.newDao = newDao;
	}

	@Override
	public boolean newComment(Comments comment, Users user, Topics topic) {
		Date cTime = new Date();
		comment.setCommentTime(cTime);
		Topics tpc = this.topicDao.find(topic.getId());
		tpc.setCountComment(tpc.getCountComment() + 1); // 帖子评论数加1
		tpc.getTopicsType().setCountComments(tpc.getTopicsType().getCountComments() + 1); // 帖子小类型评论数加1
		tpc.getTopicsType().getTypesCategory().setCountComments(tpc.getTopicsType().getTypesCategory().getCountComments() + 1); // 帖子大类型评论数加1
		user.setIntegral(user.getIntegral()+1);  //回复帖子，积分加1
		user.setComCount(user.getComCount()+1);
		if (tpc.getTopicsUser().getId() != user.getId()) {
			tpc.getTopicsUser().setClock(tpc.getTopicsUser().getClock() + 1);
			News tnew = new News();
			tnew.setNewsCommentUser(user);
			tnew.setNewsTopic(tpc);
			tnew.setStatus(0); // 将消息设为未读
			tnew.setNewTime(cTime);
			this.newDao.add(tnew);
		}
		if (this.topicDao.update(tpc) != true) {
			return false;
		}
		comment.setCommentsTopic(tpc);
		comment.setFloor(tpc.getCountComment()); // 设置此评论所在楼层
		comment.setCommentsUser(user);
		this.commentDao.add(comment);
		return true;
	}
	@Override
	public void deleteComment(Comments comment, Topics topic) {
		System.out.println("通知：这里是comment 的 action，准备删除帖子id为"+topic.getId()+"的评论");
		Topics tpc = this.topicDao.find(topic.getId());
		Comments com = this.commentDao.find(comment.getId());
		System.out.println("评论的楼层为："+com.getFloor());
		if (tpc.getTopicsUser().getId() != com.getCommentsUser().getId()) {
			System.out.println("被删评论的用户不是该帖子的用户，回复被删，积分减1");
			com.getCommentsUser().setIntegral(com.getCommentsUser().getIntegral()-1);  //回复被删，积分减1
		}
		com.setStatus(1);
		System.out.println("修改需要删除的评论后，该评论的状态为"+com.getStatus());
		this.commentDao.update(com);
		System.out.println("通知：帖子评论删除操作完毕，前往指定帖子");
	}



}
