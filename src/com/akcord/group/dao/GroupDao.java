package com.akcord.group.dao;

import java.util.List;

import com.akcord.group.model.GroupRoomDto;

public interface GroupDao {
	public int createG(GroupRoomDto groupRoomDto);
	public List<GroupRoomDto> grouplist();
}
