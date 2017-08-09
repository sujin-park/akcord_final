package com.akcord.in.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.in.dao.InCommentDao;
import com.akcord.in.model.CommentDto;
import com.akcord.in.model.InDto;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public CommentDto getAnswer(int qna_id) {
		return sqlSession.getMapper(InCommentDao.class).getAnswer(qna_id);
	}

}
