package com.akcord.admin.service;

import java.util.List;

import com.akcord.admin.model.UserManageDto;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;

public interface UserManagerService {
	List<UserManageDto> getUserList();	
	UserDto getUser(String user_id);
	int blackuserReg(String user_id);
	int majorPlus(String mname);
	List<MajorDto> getMajor();
}
