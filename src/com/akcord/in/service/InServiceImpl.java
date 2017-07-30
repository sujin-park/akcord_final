package com.akcord.in.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.GroupDao;
import com.akcord.in.dao.InDao;
import com.akcord.in.model.InDto;

@Service
public class InServiceImpl implements InService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int answerroom(InDto inDto) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(InDao.class).answerroom(inDto);
	}

	@Override
	public List<InDto> answerlist() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(InDao.class).answerlist();
	}
}
