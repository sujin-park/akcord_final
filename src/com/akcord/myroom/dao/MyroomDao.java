package com.akcord.myroom.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.myroom.model.MyroomDto;
import com.akcord.myroom.model.MyroomNextDto;

public interface MyroomDao {
	List<MyroomDto> sectionList(String user_id);
	List<MyroomNextDto> myroomList(Map<String, String> query);
	List<MyroomNextDto> choiceSectionList(Map<String, String> query);
	List<MyroomNextDto> searchList(Map<String, String> query);
	List<GroupRoomDto> groupNameList(String user_id);
	void insertArticle(MyroomNextDto myroomNextDto);
	int getMyroomNextId();
	MyroomNextDto selectArticle(String myroomNextId);
	void updateMyAtricle(MyroomNextDto myroomNextDto);
	void updateGroupAtricle(MyroomNextDto myroomNextDto);
	void deleteAtricle(String myroomNextId);
	void createCategory(MyroomDto myroomDto);
	void updateCategory(MyroomDto myroomDto);
	void deleteCategory(String myroomId);
	
	public int getScheduleId(int groupId);
}
