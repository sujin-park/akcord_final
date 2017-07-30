package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupMainDao;
import com.akcord.group.model.GroupListDto;

@Service
public class GroupMainServiceImpl  implements GroupMainService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GroupListDto> gMemberlist(String seq) {
		return sqlSession.getMapper(GroupMainDao.class).gMemberlist(seq);
	}

	@Override
	public int rejectMember(String seq) {
		return sqlSession.getMapper(GroupMainDao.class).rejectMember(seq);
	}

	@Override
	public int acceptMember(String seq) {
		return sqlSession.getMapper(GroupMainDao.class).acceptMember(seq);
	}

	@Override
	public List<GroupListDto> searchlist(String sid) {
		return sqlSession.getMapper(GroupMainDao.class).searchlist(sid);
	}

	@Override
	public int invite(Map<String, String> map) {
		return sqlSession.getMapper(GroupMainDao.class).invite(map);
	}

	@Override
	public List<GroupListDto> originlist(String seq) {
		return sqlSession.getMapper(GroupMainDao.class).originlist(seq);
	}

}
