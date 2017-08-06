package com.akcord.admin.service;

import java.util.List;
import java.util.Map;

import com.akcord.admin.model.UserManageDto;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;

public interface UserManagerService {
	List<UserManageDto> getUserList(Map<String, String> query);
	List<UserManageDto> getBlackUserList(Map<String, String> query);	
	//UserDto getUser(String user_id);
	void bUserOut(String user_id);
	int blackuserReg(String user_id);
	int majorPlus(String mname);
	List<MajorDto> getMajor();
	List<UserManageDto> getMemberOrder(Map<String,String> str);

}
