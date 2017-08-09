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

@Service
public class InServiceImpl implements InService {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int answerroom(InDto inDto) {
		return sqlSession.getMapper(InDao.class).answerroom(inDto);
	}

	@Override
	public List<InDto> answerlist(Map <String, String> queryString) {
		return sqlSession.getMapper(InDao.class).answerlist(queryString);
	}

	@Override
	public InDto getId(String string) {
		return null;
	}

	@Override
	public InDto getAnswer(int qna_id) {
		
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

	@Override
	public List<InDto> category(Map<String, String>  category) {
		return sqlSession.getMapper(InDao.class).category(category);
	}


}