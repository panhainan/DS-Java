/**
 * 
 */
package com.phn.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.phn.bean.Comments;
import com.phn.bean.News;
import com.phn.bean.Pages;
import com.phn.bean.Topics;
import com.phn.bean.Types;
import com.phn.bean.Users;
import com.phn.dao.CommentDao;
import com.phn.dao.NewDao;
import com.phn.dao.PageDao;
import com.phn.dao.TopicDao;
import com.phn.dao.TypeDao;
import com.phn.dao.UserDao;
import com.phn.service.TopicService;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class TopicServiceImpl implements TopicService {

	private TopicDao topicDao;
	private TypeDao typeDao;
	private PageDao pageDao;
	private CommentDao commentDao;
	private NewDao newDao;
	private UserDao userDao;

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	public TypeDao getTypeDao() {
		return typeDao;
	}

	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}

	public PageDao getPageDao() {
		return pageDao;
	}

	public void setPageDao(PageDao pageDao) {
		this.pageDao = pageDao;
	}

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public NewDao getNewDao() {
		return newDao;
	}

	public void setNewDao(NewDao newDao) {
		this.newDao = newDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean add(Topics topic, Users user, HttpServletResponse response,
			HttpServletRequest request, Types ttype) {
		Date ntime = new Date();
		user.setIntegral(user.getIntegral() + 2 - topic.getIntegral()); // 用户发布一条帖子加2积分
		user.setTopCount(user.getTopCount()+1);
		topic.setTopicsUser(user);

		Types ty = this.typeDao.find(ttype.getId());
		ty.setCountTopics(ty.getCountTopics() + 1); // 帖子相应的类型里的帖子数加1
		ty.getTypesCategory().setCountTopics(
				ty.getTypesCategory().getCountTopics() + 1); // 帖子相应的大类型里的帖子数加1
		topic.setTopicsType(ty);

		topic.setTopicTime(ntime);
		topic.setCountComment(0);
		topic.setStatus(0);
		this.topicDao.add(topic);
		return true;
	}

	@Override
	public Topics find(int id) {
		return this.topicDao.find(id);
	}

	@Override
	public List<Topics> getIndexHotTopic(int index) {
		return this.topicDao.getIndexHot(index);
	}

	@Override
	public List<Topics> getIndexNiceTopic(int index) {
		return this.topicDao.getIndexNice(index);
	}

	@Override
	public List<Topics> getIndexFreshTopic(int index) {
		return this.topicDao.getIndexFresh(index);
	}

	@Override
	public Pages getAllForPages(int pageSize, int nowPage) {
		final String sql = "from Topics topic  order by topic.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Topics> listTopics = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListTopics(listTopics);
		pagebean.init();
		return pagebean;
	}

	@Override
	public Pages getHotForPages(int pageSize, int nowPage) {
		final String sql = "from Topics topic where topic.countComment >=3 order by topic.countComment desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Topics> listTopics = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListTopics(listTopics);
		pagebean.init();
		return pagebean;
	}
	@Override
	public Pages getNiceForPages(int pageSize, int nowPage) {
		final String sql = "from Topics topic where topic.niceTopic =1 order by topic.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Topics> listTopics = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListTopics(listTopics);
		pagebean.init();
		return pagebean;
	}
	@Override
	public void endTopic(int[] listFloor, List<Comments> listComment) {
		for (int i = 0; i < listComment.size(); i++) {
			listComment.get(i).setIntegral(listFloor[i]);
			listComment
					.get(i)
					.getCommentsUser()
					.setIntegral(
							listComment.get(i).getCommentsUser().getIntegral()
									+ listFloor[i]);
			this.commentDao.update(listComment.get(i));
		}
	}

	@Override
	public void update(Topics topic) {
		this.topicDao.update(topic);
	}

	@Override
	public Pages search(String content, int pageSize, int nowPage) {
		final String sql = "from Topics topic where topic.title like '%"
				+ content + "%' or topic.content like '%" + content
				+ "%' order by topic.id desc";
		int allRecords = this.pageDao.getAllRowCount(sql);
		int totalPage = Pages.calculateTotalPage(pageSize, allRecords);// 总页数
		final int currentoffset = Pages.currentPage_startRecord(pageSize,
				nowPage);// 当前页的开始记录
		final int length = pageSize;
		final int currentPage = Pages.judgeCurrentPage(nowPage);
		List<Topics> listTopics = this.pageDao.query_Objects_ForPages(sql,
				currentoffset, length);
		Pages pagebean = new Pages();
		pagebean.setPageSize(pageSize);
		pagebean.setAllRecords(allRecords);
		pagebean.setCurrentPage(currentPage);
		pagebean.setTotalPages(totalPage);
		pagebean.setListTopics(listTopics);
		pagebean.init();
		return pagebean;
	}

	@Override
	public void updateNews(News tnew, Users user) {
		News tnews = this.newDao.find(tnew.getId());
		if (user.getClock() > 0) {
			user.setClock(user.getClock() - 1);
			//this.userDao.update(user);
		}
		tnews.setStatus(1);
		tnews.getNewsTopic().setTopicsUser(user);
		this.newDao.update(tnews);
	}

}
