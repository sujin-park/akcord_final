package com.akcord.in.model;

public class CommentDto extends InDto {
	private int qna_comment_id;
	private int qna_id;
	private int user_id;
	private String qna_subject;
	private String qna_comment;
	private String reg_date;
	private int category;
	private int comment_count;

	private int qna_re_id;
	private String re_comment;
	private String reply_reg_date;
	public int getQna_comment_id() {
		return qna_comment_id;
	}
	public void setQna_comment_id(int qna_comment_id) {
		this.qna_comment_id = qna_comment_id;
	}
	public int getQna_id() {
		return qna_id;
	}
	public void setQna_id(int qna_id) {
		this.qna_id = qna_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_comment() {
		return qna_comment;
	}
	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public int getQna_re_id() {
		return qna_re_id;
	}
	public void setQna_re_id(int qna_re_id) {
		this.qna_re_id = qna_re_id;
	}
	public String getRe_comment() {
		return re_comment;
	}
	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}
	public String getReply_reg_date() {
		return reply_reg_date;
	}
	public void setReply_reg_date(String reply_reg_date) {
		this.reply_reg_date = reply_reg_date;
	}


}
