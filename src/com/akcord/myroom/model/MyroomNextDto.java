package com.akcord.myroom.model;

import com.akcord.group.model.GroupRoomDto;

public class MyroomNextDto extends GroupRoomDto {

	private int myroomNextId;
	private int myroomId;
	private int user_id;
	private String subject;
	private String content;
	private String reg_date;
	private String update_date;
	private int isShare;
	private int scheduleId;
	public int getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}

	public int getMyroomNextId() {
		return myroomNextId;
	}

	public void setMyroomNextId(int myroomNextId) {
		this.myroomNextId = myroomNextId;
	}

	public int getMyroomId() {
		return myroomId;
	}

	public void setMyroomId(int myroomId) {
		this.myroomId = myroomId;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public int getIsShare() {
		return isShare;
	}

	public void setIsShare(int isShare) {
		this.isShare = isShare;
	}

}
