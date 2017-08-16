package com.akcord.in.model;

public class ReplyDto {
	private int qna_id;
	private String id;
	private int qna_re_id;
	private int qna_comment_id;
	private int user_id;
	private String re_comment;
	private String reg_date;

	public String getId() {
		return id;
	}

	public int getQna_id() {
		return qna_id;
	}

	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQna_re_id() {
		return qna_re_id;
	}

	public void setQna_re_id(int qna_re_id) {
		this.qna_re_id = qna_re_id;
	}

	public int getQna_comment_id() {
		return qna_comment_id;
	}

	public void setQna_comment_id(int qna_comment_id) {
		this.qna_comment_id = qna_comment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}
