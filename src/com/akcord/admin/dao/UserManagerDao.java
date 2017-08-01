package com.akcord.admin.dao;

import java.util.List;
import java.util.Map;

import com.akcord.admin.model.UserManageDto;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;

public interface UserManagerDao {
	
	List<UserManageDto> getUserList();	
	UserDto getUser(String user_id);
	int blackuserReg(String user_id);
	int majorPlus(String mname);
	List<MajorDto> getMajor();
	List<UserManageDto> getMemberOrder(Map<String,String> str);
}
