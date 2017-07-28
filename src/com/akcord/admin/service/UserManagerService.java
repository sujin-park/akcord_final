package com.akcord.admin.service;

import java.util.List;

import com.akcord.user.model.UserDto;

public interface UserManagerService {
	List<UserDto> getUserList();	
	UserDto getUser(String user_id);
}
