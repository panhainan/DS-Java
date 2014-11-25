/**
 * 
 */
package com.phn.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSONObject;
import com.phn.bean.Comments;
import com.phn.bean.Grades;
import com.phn.bean.News;
import com.phn.bean.Pages;
import com.phn.bean.Topics;
import com.phn.bean.Users;
import com.phn.service.UserService;
import com.phn.util.ResponseUtil;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class UserAction {
	private UserService userService;
	private Users user;
	private String userName;
	private String userPass;
	private String userNic;
	private String userSex;
	private String userEmail;
	private String userProfe;
	private String userFrom;
	private String userIntro;
	private List<Topics> listTopic;
	private List<Comments> listComment;
	private List<News> listNews;
	private List<Users> listUser;
	private Pages pageBean;
	private int nowPage;
	HttpSession session = ServletActionContext.getRequest().getSession();
	HttpServletResponse response = ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();

	/**
	 * 用户注册之前的用户名验证
	 */
	public void CheckName() throws Exception {
		// System.out.println("前台传来的username值为：" + userName);
		JSONObject jobj = new JSONObject();
		boolean flag = this.userService.findByName(userName);
		jobj.put("success", flag);
		// System.out.println("返回前台的flag===" + flag+
		// "------false表示可以使用，true表示数据库已存在此用户名");
		ResponseUtil.write(response, jobj);
	}

	/**
	 * 用户注册之前的昵称验证
	 */
	public void CheckNic() throws Exception {
		JSONObject jobj = new JSONObject();
		boolean flag = this.userService.findByNic(userNic);
		jobj.put("success", flag);
		ResponseUtil.write(response, jobj);
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	public String Register() throws Exception {
		if (this.userService.add(user)) {
			return "user_register_ok";
		}
		return "register_error";
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 * @throws Exception
	 */
	public String Login() throws Exception {
		Users u = userService.findByNP(user);
		if (u != null) {
			if (u.getStatus() == 1) {
				String message = "该账号目前处于被禁用状态!无法进行此操作！";
				request.setAttribute("tipMessage", message);
				return "login_error";
			}
			if (u.getGradeIntegral() > u.getUsersGrade().getId() * 100) {
				Grades grade = this.userService.findGrade(u.getUsersGrade()
						.getId() + 1);
				u.setUsersGrade(grade);
				u.setGradeIntegral(u.getGradeIntegral()
						- (u.getUsersGrade().getId() * 100));
				this.userService.update(u);
			}
			session.setAttribute("tu", u);
			session.setMaxInactiveInterval(15 * 60);
			return "user_login_ok";
		}
		String message = "用户名或密码错误！";
		request.setAttribute("tipMessage", message);
		return "login_error";
	}

	/**
	 * 用户注销
	 * 
	 * @return
	 * @throws Exception
	 */
	public String Logout() throws Exception {
		session.removeAttribute("tu");
		return "user_logout_ok";
	}

	public String GoHome() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		/* 为了弄出头衔 */
		this.user = this.userService.find(us.getId());
		return "user_goHome_ok";
	}

	/**
	 * 获取用户所有帖子
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetTopics() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		this.pageBean = this.userService.getTopicsForPages(5, nowPage,
				us.getId());
		this.listTopic = pageBean.getListTopics();
		return "user_getTopics_ok";
	}

	/**
	 * 获取用户所有评论
	 * 
	 * @return
	 * @throws Exception
	 */
	public String GetComments() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		this.pageBean = this.userService.getCommentsForPages(us, 5, nowPage,
				us.getId());
		this.listComment = pageBean.getListComments();
		return "user_getComments_ok";
	}

	public String GetNews() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		this.pageBean = this.userService
				.getNewsForPages(5, nowPage, us.getId());
		this.listNews = pageBean.getListNews();
		return "user_getNews_ok";
	}

	public String UpdateInfo() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		us.setNickname(userNic);
		us.setSex(userSex);
		us.setEmail(userEmail);
		us.setComefrom(userFrom);
		us.setProfession(userProfe);
		us.setIntroduction(userIntro);
		this.userService.update(us);
		String message = "修改成功!";
		request.setAttribute("tipMessage", message);
		return "user_updateInfo_ok";
	}

	public String UpdatePass() throws Exception {
		Users us = (Users) session.getAttribute("tu");
		us.setPassword(userPass);
		this.userService.update(us);
		String message = "修改成功!";
		request.setAttribute("tipMessage", message);
		return "user_updatePass_ok";
	}

	public String ManageAll() throws Exception {
		this.pageBean = this.userService.ManageUsersForPage(12, nowPage);
		this.listUser = pageBean.getListUser();
		return "user_manageAll_ok";
	}

	public String ManageGoUser() throws Exception {
		this.user = this.userService.find(user.getId());
		if(user==null){
			return "a_error";
		}
		return "user_manageGoUser_ok";
	}

	public String ManageUserAllTopics() throws Exception {
		this.pageBean = this.userService.getTopicsForPages(12, nowPage,
				user.getId());
		this.listTopic = pageBean.getListTopics();
		this.user = this.userService.find(user.getId());
		if(user==null){
			return "a_error";
		}
		return "user_manageGoUserAllTopics_ok";
	}

	/**
	 * 封号
	 * 
	 * @return
	 * @throws Exception
	 */
	public String ManageDelete() throws Exception {
		this.userService.delete(user.getId());
		return "user_manageDelete_ok";
	}

	/**
	 * 解封
	 * 
	 * @return
	 * @throws Exception
	 */
	public String ManageUnDelete() throws Exception {
		this.userService.unDelete(user.getId());
		return "user_manageUnDelete_ok";
	}

	public String ManageSRole() throws Exception {
		Users us = this.userService.find(user.getId());
		us.setRoleId(16); // 将其权限设置为高级管理员
		this.userService.update(us);
		return "user_manageSRole_ok";
	}

	public String ManageARole() throws Exception {
		Users us = this.userService.find(user.getId());
		us.setRoleId(6); // 将其权限设置为普通管理员
		this.userService.update(us);
		return "user_manageARole_ok";
	}
	public String ManageRole() throws Exception {
		Users us = this.userService.find(user.getId());
		us.setRoleId(0); // 将其权限设置为普通用户
		this.userService.update(us);
		return "user_manageARole_ok";
	}
	public String GoUser() throws Exception {
		this.user = this.userService.find(user.getId());
		return "user_goUser_ok";
	}

	public String GoUserAllTopics() throws Exception {
		this.pageBean = this.userService.getTopicsForPages(10, nowPage,
				user.getId());
		this.listTopic = pageBean.getListTopics();
		this.user = this.userService.find(user.getId());
		return "user_goUserAllTopics_ok";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNic() {
		return userNic;
	}

	public void setUserNic(String userNic) {
		this.userNic = userNic;
	}

	public List<Topics> getListTopic() {
		return listTopic;
	}

	public void setListTopic(List<Topics> listTopic) {
		this.listTopic = listTopic;
	}

	public List<Comments> getListComment() {
		return listComment;
	}

	public void setListComment(List<Comments> listComment) {
		this.listComment = listComment;
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

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserProfe() {
		return userProfe;
	}

	public void setUserProfe(String userProfe) {
		this.userProfe = userProfe;
	}

	public String getUserFrom() {
		return userFrom;
	}

	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}

	public String getUserIntro() {
		return userIntro;
	}

	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}

	public List<News> getListNews() {
		return listNews;
	}

	public void setListNews(List<News> listNews) {
		this.listNews = listNews;
	}

	public List<Users> getListUser() {
		return listUser;
	}

	public void setListUser(List<Users> listUser) {
		this.listUser = listUser;
	}

}
