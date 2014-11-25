/**
 * 
 */
package com.phn.interceptor;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * @author 潘海南
 * @email phnlove@163.com
 */
public class UEditorFilter extends StrutsPrepareAndExecuteFilter {
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		//不过滤的url
		String url = request.getRequestURI();
		//System.out.println(url);
		if(url.contains("/ueditor/jsp/")){
			//System.out.println("使用对编辑器的拦截器");
			chain.doFilter(req, res);
		}else {
			//System.out.println("前往使用默认的拦截器");
			super.doFilter(req, res, chain);
		}
	}
}

