package com.akcord.group.model;

public class GroupRoomDto {

	private int majorId;
	private String groupName;
	private String content;
	private int leaderId;
	private int gCount;
	private String majorName;
	private String regDate;
	private String name;
	private String waitingDate;
	private int groupId;
	private int nowCount;

	public int getNowCount() {
		return nowCount;
	}

	public void setNowCount(int nowCount) {
		this.nowCount = nowCount;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getWaitingDate() {
		return waitingDate;
	}

	public void setWaitingDate(String waitingDate) {
		this.waitingDate = waitingDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public int getMajorId() {
		return majorId;
	}

	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLeaderId() {
		return leaderId;
	}

	public void setLeaderId(int leaderId) {
		this.leaderId = leaderId;
	}

	public int getgCount() {
		return gCount;
	}

	public void setgCount(int gCount) {
		this.gCount = gCount;
	}
}
