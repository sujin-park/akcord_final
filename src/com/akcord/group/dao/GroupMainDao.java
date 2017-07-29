package com.akcord.group.dao;

import java.util.List;

import com.akcord.group.model.GroupListDto;

public interface GroupMainDao {
	public List<GroupListDto> gMemberlist(String seq);
}
