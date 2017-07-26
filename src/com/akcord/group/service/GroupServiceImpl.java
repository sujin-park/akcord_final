package com.akcord.group.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupDao;
import com.akcord.group.model.GroupRoomDto;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int createG(GroupRoomDto groupRoomDto) {
		return sqlSession.getMapper(GroupDao.class).createG(groupRoomDto);
	}

	@Override
	public List<GroupRoomDto> grouplist() {
		return sqlSession.getMapper(GroupDao.class).grouplist();
	}

}
