package com.akcord.user.service;

import java.util.Map;

import com.akcord.user.model.UserDto;

public interface UserService {
	
	int idCheck(String id);
	int join(UserDto userDto);
	
	UserDto login(Map<String, String> map);
	
	UserDto getUser(String id);
	int modify(UserDto userDto);
	int delete(String id);
	
}
