package com.akcord.main.poll.model;

import java.io.Serializable;

public class PollDto implements Serializable{
	
	private int poll_id;
	private String subject;
	private String chart_type;
	private String content;
	private String startDate;
	private String endDate;
	private String userId;
	private String cnt;
	private String user_id;
	private String flag;
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public int getPoll_id() {
		return poll_id;
	}
	public void setPoll_id(int poll_id) {
		this.poll_id = poll_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getChart_type() {
		return chart_type;
	}
	public void setChart_type(String chart_type) {
		this.chart_type = chart_type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	

}
