package com.akcord.group.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupListDto;

public interface GroupMainDao {
	public List<GroupListDto> gMemberlist(Map<String, String> query);

	public int rejectMember(Map<String, String> map);

	public int acceptMember(Map<String, String> map);

	public List<GroupListDto> searchlist(String sid);
	
	public int invite(Map<String, String> map);
	
	public List<GroupListDto> originlist(Map<String, String> map);
}
