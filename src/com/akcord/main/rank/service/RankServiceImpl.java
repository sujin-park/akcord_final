package com.akcord.main.rank.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.akcord.main.rank.dao.RankDao;
import com.akcord.main.rank.model.RankDto;

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
		// TODO 그룹 멤버수 순위
		return sqlSession.getMapper(RankDao.class).getGroup();
	}

	@Override
	public List<RankDto> getMyroom() {
		// TODO 마이룸 공유글 조회수
		return sqlSession.getMapper(RankDao.class).getMyroom();
	}

}
