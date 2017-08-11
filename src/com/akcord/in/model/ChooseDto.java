package com.akcord.in.model;

public class ChooseDto extends CommentDto {
	private int qna_comment_id;
	private int goodCount;
	private int badCount;

	public int getQna_comment_id() {
		return qna_comment_id;
	}

	public void setQna_comment_id(int qna_comment_id) {
		this.qna_comment_id = qna_comment_id;
	}

	public int getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	public int getBadCount() {
		return badCount;
	}

	public void setBadCount(int badCount) {
		this.badCount = badCount;
	}

}
