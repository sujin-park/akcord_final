package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupDao;
import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int createG(GroupRoomDto groupRoomDto) {
		return sqlSession.getMapper(GroupDao.class).createG(groupRoomDto);
	}

	@Override
	public List<GroupRoomDto> grouplist(String myseq) {
		return sqlSession.getMapper(GroupDao.class).grouplist(myseq);
	}
	
	public List<GroupRoomDto> waitinglist(int seq) {
		return sqlSession.getMapper(GroupDao.class).waitinglist(seq);
	}

	@Override
	public List<MajorDto> majorlist() {
		return sqlSession.getMapper(GroupDao.class).majorlist();
	}

	@Override
	public int nowCount() {
		return sqlSession.getMapper(GroupDao.class).nowCount();
	}

	@Override
	public int joinGroup(Map<String, String> map) {
		return sqlSession.getMapper(GroupDao.class).joinGroup(map);
	}

	@Override
	public int cancel(String seq) {
		return sqlSession.getMapper(GroupDao.class).cancel(seq);
	}

}
