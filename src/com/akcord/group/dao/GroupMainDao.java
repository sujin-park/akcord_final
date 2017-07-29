package com.akcord.group.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupListDto;

public interface GroupMainDao {
	public List<GroupListDto> gMemberlist(String seq);

	public int rejectMember(String seq);

	public int acceptMember(String seq);

	public List<GroupListDto> searchlist(String sid);
	
	public int invite(Map<String, String> map);
}
