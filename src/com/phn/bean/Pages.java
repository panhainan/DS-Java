/**
 * 
 */
package com.phn.bean;

import java.util.List;

/**
 * @author phn
 * 
 */
public class Pages {

	private List<Topics> listTopics;
	private List<Comments> listComments;
	private List<News> listNews;
	private List<Users> listUser;
	private List<Announces> ListAnno;
	private List<Helps> listHelp;

	private int currentPage; // 当前页数
	private int pageSize; // 每页显示的记录数
	private int totalPages; // 总页数
	private int allRecords; // 总记录数

	private boolean isFirstPage; // 是否是第一页
	private boolean isFinalPage; // 是否是最后一页
	private boolean hasPreviousPage; // 是否有上一页
	private boolean hasNextPage; // 是否有下一页

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getAllRecords() {
		return allRecords;
	}

	public void setAllRecords(int allRecords) {
		this.allRecords = allRecords;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public boolean isFinalPage() {
		return isFinalPage;
	}

	public void setFinalPage(boolean isFinalPage) {
		this.isFinalPage = isFinalPage;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	/**
	 * 初始化分页信息
	 */
	public void init() {
		this.isFirstPage = isFirstPage;
		this.isFinalPage = isFinalPage;
		this.hasPreviousPage = hasPreviousPage;
		this.hasNextPage = hasNextPage;
	}

	/**
	 * 计算总页数
	 * 
	 * @param pageSize
	 *            每页的记录数
	 * @param allRecords
	 *            总记录数
	 * @return 总页数
	 */
	public static int calculateTotalPage(final int pageSize,
			final int allRecords) {
		int total = (allRecords % pageSize == 0) ? allRecords / pageSize
				: allRecords / pageSize + 1;
		if (total == 0) {
			total = 1;
		}
		return total;
	}

	/**
	 * 计算当前页的开始记录数
	 * 
	 * @param pageSize
	 *            每页记录数
	 * @param currentPage
	 *            当前第几页
	 * @return 当前页开始记录数
	 */
	public static int currentPage_startRecord(final int pageSize,
			final int currentPage) {
		final int startRecord = pageSize * (currentPage - 1);
		return startRecord;
	}

	/**
	 * 判断当前页是否为0
	 * 
	 * @param page
	 *            当前页
	 * @return 判断当前页的结果
	 */
	public static int judgeCurrentPage(int page) {
		final int judgeCurrent = (page == 0) ? 1 : page;
		return judgeCurrent;
	}

	public List<Topics> getListTopics() {
		return listTopics;
	}

	public void setListTopics(List<Topics> listTopics) {
		this.listTopics = listTopics;
	}

	public List<Comments> getListComments() {
		return listComments;
	}

	public void setListComments(List<Comments> listComments) {
		this.listComments = listComments;
	}

	public List<News> getListNews() {
		return listNews;
	}

	public void setListNews(List<News> listNews) {
		this.listNews = listNews;
	}

	public List<Announces> getListAnno() {
		return ListAnno;
	}

	public void setListAnno(List<Announces> listAnno) {
		ListAnno = listAnno;
	}

	public List<Helps> getListHelp() {
		return listHelp;
	}

	public void setListHelp(List<Helps> listHelp) {
		this.listHelp = listHelp;
	}

	public List<Users> getListUser() {
		return listUser;
	}

	public void setListUser(List<Users> listUser) {
		this.listUser = listUser;
	}

}
