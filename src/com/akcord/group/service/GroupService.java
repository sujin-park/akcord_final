package com.akcord.group.service;

import java.util.List;

import com.akcord.group.model.GroupRoomDto;

public interface GroupService {

	public int createG(GroupRoomDto groupRoomDto); // 그룹방 개설
	
	public List<GroupRoomDto> grouplist();
}
