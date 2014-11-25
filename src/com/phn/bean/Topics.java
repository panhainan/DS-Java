/**
 * 
 */
package com.phn.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author phn
 * 
 */
public class Topics {
	private int id;
	private String title; // 标题
	private String content; // 内容
	private int countComment = 0; // 评论数
	private Date topicTime; // 发布时间
	private int niceTopic = 0; // 精品帖：0不是，1是
	private int status = 0; // 帖子状态：0未结帖，1已结贴
	private int integral = 10; // 默认帖子发布所耗积分
	// 多对一
	private Users topicsUser;
	private Types topicsType;
	// 集合，一对多
	private Set<Comments> topicComments = new HashSet<Comments>();
	private Set<News> topicNews = new HashSet<News>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCountComment() {
		return countComment;
	}

	public void setCountComment(int countComment) {
		this.countComment = countComment;
	}

	public Types getTopicsType() {
		return topicsType;
	}

	public void setTopicsType(Types topicsType) {
		this.topicsType = topicsType;
	}

	public Users getTopicsUser() {
		return topicsUser;
	}

	public void setTopicsUser(Users topicsUser) {
		this.topicsUser = topicsUser;
	}

	public Date getTopicTime() {
		return topicTime;
	}

	public void setTopicTime(Date topicTime) {
		this.topicTime = topicTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Set<Comments> getTopicComments() {
		return topicComments;
	}

	public void setTopicComments(Set<Comments> topicComments) {
		this.topicComments = topicComments;
	}

	public Set<News> getTopicNews() {
		return topicNews;
	}

	public void setTopicNews(Set<News> topicNews) {
		this.topicNews = topicNews;
	}

	public int getNiceTopic() {
		return niceTopic;
	}

	public void setNiceTopic(int niceTopic) {
		this.niceTopic = niceTopic;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

}
