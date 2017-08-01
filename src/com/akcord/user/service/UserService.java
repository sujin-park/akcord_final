package com.akcord.user.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.user.model.UserDto;
public interface UserService {
	
	int idCheck(String id);
	int join(Map<String, String> map);
	
	UserDto login(Map<String, String> map);
	
	UserDto getUser(String id);
	int modify(UserDto userDto);
	int delete(String id);
	
	List<GroupRoomDto> group(String seq);
}
