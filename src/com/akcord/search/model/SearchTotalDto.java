package com.akcord.search.model;

public class SearchTotalDto implements Comparable<SearchTotalDto>{
	private String subject;
	private String content;
	private String reg_date;
	private String user_name;
	private String link;
	private int count;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public int compareTo(SearchTotalDto o) {
		if(this.count > o.count){
			return -1;
		}
		else if(this.count < o.count){
			return 1;
		}else	
		return 0;
	}

}
