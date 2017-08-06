package com.akcord.group.model;

public class GroupHwDto extends GroupRoomDto {
	private int myroomNextId;
	private int scheduleId;
	private String mysubject;
	public String getMysubject() {
		return mysubject;
	}
	public void setMysubject(String mysubject) {
		this.mysubject = mysubject;
	}
	public String getMycontent() {
		return mycontent;
	}
	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}
	private String mycontent;
	public int getMyroomNextId() {
		return myroomNextId;
	}
	public void setMyroomNextId(int myroomNextId) {
		this.myroomNextId = myroomNextId;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
}
