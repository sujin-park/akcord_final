package com.akcord.group.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupHwDto;
import com.akcord.group.model.GroupListDto;
import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.ScheduleDto;

public interface GroupMainDao {
	public List<GroupListDto> gMemberlist(Map<String, String> query);

	public int rejectMember(Map<String, String> map);

	public int acceptMember(Map<String, String> map);

	public List<GroupListDto> searchlist(String sid);
	
	public int invite(Map<String, String> map);
	
	public List<GroupListDto> originlist(Map<String, String> map);
	
	public GroupRoomDto gMainInfo(int groupId);
	
	public int scheduleInsert(ScheduleDto scheduleDto);
	
	public List<ScheduleDto> schedulelist(int groupId);
	
	public int scheduleModify(ScheduleDto scheduleDto);
	
	public int scheduleDelete(int scheduleId);
	
	public List<GroupHwDto> groupArticleList(int groupId); 
}
