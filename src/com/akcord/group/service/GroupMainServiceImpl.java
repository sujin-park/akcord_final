package com.akcord.group.service;

import java.util.List;

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

}
