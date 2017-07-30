package com.akcord.admin.dao;

import java.util.List;

import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;

public interface UserManagerDao {
	
	List<UserDto> getUserList();	
	UserDto getUser(String user_id);
	int blackuserReg(String user_id);
	int majorPlus(String mname);
	List<MajorDto> getMajor();

}
