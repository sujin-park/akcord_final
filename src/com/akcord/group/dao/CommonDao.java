package com.akcord.group.dao;

import java.util.Map;

import com.akcord.util.PageNavigation;

public interface CommonDao {
	void updateHit(int seq);
	int newArticleCount(Map<String, String> map);
	int totalArticleCount(Map<String, String> map);
	
}
