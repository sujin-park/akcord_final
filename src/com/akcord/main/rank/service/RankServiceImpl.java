package com.akcord.main.rank.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.main.rank.dao.RankDao;
import com.akcord.main.rank.model.RankDto;
@Service
public class RankServiceImpl implements RankService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RankDto> getQna() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(RankDao.class).getQna();
	}

	@Override
	public List<RankDto> getQnaComment() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(RankDao.class).getQnaComment();
	}

	@Override
	public List<RankDto> getGroup() {
		// TODO
		return sqlSession.getMapper(RankDao.class).getGroup();
	}

	@Override
	public List<RankDto> getMyroom() {
		// TODO 
		return sqlSession.getMapper(RankDao.class).getMyroom();
	}

	@Override
	public String getGroupname(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(RankDao.class).getGroupname(id);
	}

}
