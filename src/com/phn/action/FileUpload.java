/**
 * 
 */
package com.phn.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.phn.bean.Users;
import com.phn.service.UserService;

/**
 * @author phn
 * 
 */
public class FileUpload {
	private Users user;
	private UserService userService;
	private File fileUpload;
	private String fileUploadFileName;
	private String fileUploadContentType;
	private String savePath;
	DateFormat df = new SimpleDateFormat("yyyyMMdd-hh-mm-ss-");
	String questionTime = df.format(new Date());
	HttpServletRequest request = ServletActionContext.getRequest();

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String userPicUpload() throws Exception {
		Random r = new Random();
		// 以服务器的文件保存地址和原文件名建立上传文件输出流
		FileOutputStream fos = new FileOutputStream(ServletActionContext
				.getRequest().getRealPath(savePath)
				+ "\\"
				+ questionTime
				+ getFileUploadFileName());
		// 以上传文件建立一个文件上传流
		FileInputStream fis = new FileInputStream(getFileUpload());
		// 将上传文件的内容写入服务器
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		String p = request.getContextPath() + this.savePath + "/"
				+ questionTime + getFileUploadFileName().toString();
		HttpSession session = ServletActionContext.getRequest().getSession();
		user = (Users) session.getAttribute("tu");
		user.setPicture(p);
		if (this.userService.update(user)) {
			return "fileupload_ok";
		}
		return "fileupload_no";
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
