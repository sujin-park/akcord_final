package com.akcord.alarm.dao;

public interface AlarmDao {
	// << alarm data insert list >>
	public void alarminsertgroupinvite();	// alarm data of group invitation
	public void alarminsertreply();			// alarm data of reply to an article
	public void alarminsertreboard();		// alarm data of reboard article
	public void alarminsertjoin();			// alarm data of group join
	public void alarminsertwithdrawer();	// alarm data of group withdrawer
	//좋아요
	//공유 알림
	
	
	// << alarm pop-up >>
	public void alarmlist();	// shows list of alarms
	public void alarmread();	// check if alarm is read or not
	public void alarmoff();		// set permission for alarm service
}
