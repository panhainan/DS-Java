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
public class Users {
	private int id;
	private String username;
	private String password;
	private String nickname; // 昵称
	private String sex = "男";
	private String picture = "/DS-Java/image/ds-java.png"; // 头像
	private String email = "";
	private String comefrom = ""; // 来自
	private String introduction = ""; // 个人简介
	private String profession = ""; // 职业，专业
	private int gradeIntegral=0;
	private int integral = 50; // 积分
	private int roleId = 0; // 权限
	private int clock = 0; // 未读消息
	private int topCount = 0; // 帖子数
	private int comCount = 0; // 评论数
	private Date registerTime;
	private int status; // 0表示未禁用，1表示禁用

	private Grades usersGrade; // 等级

	// 集合，一对多
	private Set<Topics> userTopics = new HashSet<Topics>();
	private Set<Comments> userComments = new HashSet<Comments>();
	private Set<News> userCommentNews = new HashSet<News>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComefrom() {
		return comefrom;
	}

	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public int getGradeIntegral() {
		return gradeIntegral;
	}

	public void setGradeIntegral(int gradeIntegral) {
		this.gradeIntegral = gradeIntegral;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getClock() {
		return clock;
	}

	public void setClock(int clock) {
		this.clock = clock;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getTopCount() {
		return topCount;
	}

	public void setTopCount(int topCount) {
		this.topCount = topCount;
	}

	public int getComCount() {
		return comCount;
	}

	public void setComCount(int comCount) {
		this.comCount = comCount;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	public Grades getUsersGrade() {
		return usersGrade;
	}

	public void setUsersGrade(Grades usersGrade) {
		this.usersGrade = usersGrade;
	}

	public Set<Topics> getUserTopics() {
		return userTopics;
	}

	public void setUserTopics(Set<Topics> userTopics) {
		this.userTopics = userTopics;
	}

	public Set<Comments> getUserComments() {
		return userComments;
	}

	public void setUserComments(Set<Comments> userComments) {
		this.userComments = userComments;
	}

	public Set<News> getUserCommentNews() {
		return userCommentNews;
	}

	public void setUserCommentNews(Set<News> userCommentNews) {
		this.userCommentNews = userCommentNews;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
