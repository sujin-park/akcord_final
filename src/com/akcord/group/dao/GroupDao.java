package com.akcord.group.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;

public interface GroupDao {
	public int createG(GroupRoomDto groupRoomDto);

	public List<GroupRoomDto> grouplist(Map<String, String> query);

	public List<GroupRoomDto> waitinglist(Map<String,String> query);

	public List<MajorDto> majorlist();

	public int nowCount();

	public int joinGroup(Map<String, String> map);
	
	public int cancel(Map<String, String> map);
	
	public int accept(Map<String, String> map);	
}
