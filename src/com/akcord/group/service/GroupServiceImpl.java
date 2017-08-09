package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupDao;
import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;
import com.akcord.util.BoardConstant;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int createG(GroupRoomDto groupRoomDto) {
		return sqlSession.getMapper(GroupDao.class).createG(groupRoomDto);
	}

	@Override
	public List<GroupRoomDto> grouplist(Map<String,String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(GroupDao.class).grouplist(query);
	}
	
	public List<GroupRoomDto> waitinglist(Map<String,String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(GroupDao.class).waitinglist(query);
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
	public int cancel(Map<String, String> map) {
		return sqlSession.getMapper(GroupDao.class).cancel(map);
	}

	@Override
	public int accept(Map<String, String> map) {
		return sqlSession.getMapper(GroupDao.class).accept(map);
	}

}
