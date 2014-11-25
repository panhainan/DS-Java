/**
 * 
 */
package com.phn.service;

import com.phn.bean.Comments;
import com.phn.bean.Topics;
import com.phn.bean.Users;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public interface CommentService {

	public boolean newComment(Comments comment, Users user, Topics topic);


	/**
	 * @param comment
	 * @param topic 
	 */
	public void deleteComment(Comments comment, Topics topic);
}
