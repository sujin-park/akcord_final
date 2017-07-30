package com.akcord.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.admin.dao.UserManagerDao;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;

@Service
public class UserManagerServiceImpl implements UserManagerService {

	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public List<UserDto> getUserList() {
		return sqlSession.getMapper(UserManagerDao.class).getUserList();
	}

	@Override
	public UserDto getUser(String user_id) {
		return null;
	}

	@Override
	public int blackuserReg(String user_id) {
		return sqlSession.getMapper(UserManagerDao.class).blackuserReg(user_id);
	}

	@Override
	public int majorPlus(String mname) {
		return  sqlSession.getMapper(UserManagerDao.class).majorPlus(mname);
	}

	@Override
	public List<MajorDto> getMajor() {
		return sqlSession.getMapper(UserManagerDao.class).getMajor();
	}

}
