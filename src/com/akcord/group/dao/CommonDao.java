package com.akcord.group.dao;

import java.util.Map;

public interface CommonDao {
	void updateHit(int seq);
	int newGroupListCount(Map<String, String> query);
	int totalGroupListCount(Map<String, String> query);
	
}
