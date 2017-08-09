package com.akcord.group.dao;

import java.util.Map;

public interface CommonDao {
	void updateHit(int seq);

	int newGroupListCount(Map<String, String> query);
	int totalGroupListCount(Map<String, String> query);
	
	int totalGroupWaitCount(Map<String, String> query);
	int totalOriginCount(Map<String, String> query);
	int totalWaitCount(Map<String, String> query);
	int newNoticeListCount();
	int totalNoticeListCount(Map<String, String> query);
	
	
	int newUserListCount();
	int totalUserListCount(Map<String, String> query);
	
	
	int totalBlackUserListCount(Map<String, String> query);
	int totalMyroomListCount(Map<String, String> query);
	
}
