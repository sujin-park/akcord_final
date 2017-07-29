package com.akcord.in.model;

import java.sql.Date;

public class InDto {
	private int qna_id;
	private int user_id;
	private int major_id;
	private String subject;
	private String content;
	private Date reg_date;
	private int hit;

	int getQna_id() {
		return qna_id;
	}

	void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	int getUser_id() {
		return user_id;
	}

	void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	int getMajor_id() {
		return major_id;
	}

	void setMajor_id(int major_id) {
		this.major_id = major_id;
	}

	String getSubject() {
		return subject;
	}

	void setSubject(String subject) {
		this.subject = subject;
	}

	String getContent() {
		return content;
	}

	void setContent(String content) {
		this.content = content;
	}

	Date getReg_date() {
		return reg_date;
	}

	void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	int getHit() {
		return hit;
	}

	void setHit(int hit) {
		this.hit = hit;
	}

}
