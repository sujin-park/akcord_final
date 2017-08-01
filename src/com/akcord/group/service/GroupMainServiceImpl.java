package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupMainDao;
import com.akcord.group.model.GroupListDto;
import com.akcord.util.BoardConstant;

@Service
public class GroupMainServiceImpl  implements GroupMainService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GroupListDto> gMemberlist(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.GROUP_LIST_SIZE;
		int start = end - BoardConstant.GROUP_LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(GroupMainDao.class).gMemberlist(query);
	}

	@Override
	public int rejectMember(Map<String, String> map) {
		return sqlSession.getMapper(GroupMainDao.class).rejectMember(map);
	}

	@Override
	public int acceptMember(Map<String, String> map) {
		return sqlSession.getMapper(GroupMainDao.class).acceptMember(map);
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
	public List<GroupListDto> originlist(Map<String, String> map) {
		return sqlSession.getMapper(GroupMainDao.class).originlist(map);
	}

}
