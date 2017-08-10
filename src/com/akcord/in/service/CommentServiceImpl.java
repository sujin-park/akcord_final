package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.in.dao.InCommentDao;
import com.akcord.in.model.*;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public CommentDto getAnswer(int qna_id) {
		return sqlSession.getMapper(InCommentDao.class).getAnswer(qna_id);
	}

	@Override
	public List<CommentDto> list(Map<String, String> queryString) {
		return sqlSession.getMapper(InCommentDao.class).list(queryString);
	}

	@Override
	public int answerSave(CommentDto commentDto) {
		return sqlSession.getMapper(InCommentDao.class).answerSave(commentDto);
	}

	@Override
	public List<ChooseDto> getlist(int qna_id) {
		return sqlSession.getMapper(InCommentDao.class).getlist(qna_id);
	}

	@Override
	public int updateHit(int qna_id) {
		return sqlSession.getMapper(InCommentDao.class).updateHit(qna_id);
	}

	@Override
	public int modify(CommentDto commentDto) {
		return sqlSession.getMapper(InCommentDao.class).modify(commentDto);
	}

}
