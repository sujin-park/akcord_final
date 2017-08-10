package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.SqlServerCallMetaDataProvider;
import org.springframework.stereotype.Service;

import com.akcord.group.model.MajorDto;
import com.akcord.in.dao.InDao;
import com.akcord.in.model.InDto;
import com.akcord.util.BoardConstant;

@Service
public class InServiceImpl implements InService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int answerroom(Map <String, String> queryString) {
		return sqlSession.getMapper(InDao.class).answerroom(queryString);
	}

	@Override
	public List<InDto> answerlist(Map <String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		queryString.put("start", start+"");
		queryString.put("end", end+"");
		return sqlSession.getMapper(InDao.class).answerlist(queryString);
	}

	@Override
	public InDto getId(String string) {
		return null;
	}

	@Override
	public InDto getAnswer(int qna_id) {
		System.out.println(qna_id);
		return sqlSession.getMapper(InDao.class).getAnswer(qna_id);
	}

	@Override
	public List<InDto> list(Map<String, String> queryString) {
		return sqlSession.getMapper(InDao.class).list(queryString);
	}

	@Override
	public List<MajorDto> majorlist() {
		return sqlSession.getMapper(InDao.class).majorlist();
	}

//	@Override
//	public List<InDto> category(Map<String, String>  category) {
//		return sqlSession.getMapper(InDao.class).category(category);
//	}

	@Override
	public int updateAnswerroom(Map <String, String> queryString) {
		return sqlSession.getMapper(InDao.class).updateAnswerroom(queryString);
	}

	@Override
	public int deleteAnswerroom(String qna_id) {
		return sqlSession.getMapper(InDao.class).deleteAnswerroom(qna_id);
	}

}