package com.akcord.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.user.dao.UserDao;
import com.akcord.user.model.UserDto;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {	
		return sqlSession.getMapper(UserDao.class).idCheck(id);
	}

	@Override
	public UserDto login(Map<String, String> map) {
		return sqlSession.getMapper(UserDao.class).login(map);
	}

	@Override
	public UserDto getUser(String id) {
		return null;
	}

	@Override
	public int modify(UserDto userDto) {
		return 0;
	}

	@Override
	public int delete(String id) {
		return sqlSession.getMapper(UserDao.class).delete(id);
	}

	@Override
	public int join(Map<String, String> map) {
		return sqlSession.getMapper(UserDao.class).join(map);
	}

	@Override
	public List<GroupRoomDto> group(String seq) {
		return sqlSession.getMapper(UserDao.class).group(seq);
	}

}
