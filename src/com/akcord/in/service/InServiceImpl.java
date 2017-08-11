package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import javax.xml.namespace.QName;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.metadata.SqlServerCallMetaDataProvider;
import org.springframework.stereotype.Service;

import com.akcord.group.model.MajorDto;
import com.akcord.in.dao.InDao;
import com.akcord.in.model.*;
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
	public List<InDto> replyCountList(Map<String, String> queryString) {
		int pg = Integer.parseInt(queryString.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		queryString.put("start", start+"");
		queryString.put("end", end+"");
		return sqlSession.getMapper(InDao.class).replyCountList(queryString);
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

	@Override
	public void good_or_badUpdate(Map<String, String> queryString) {
		sqlSession.getMapper(InDao.class).good_or_badUpdate(queryString);
	}

	@Override
	public ChooseDto good_or_badSelect(String qna_comment_id) {
		return sqlSession.getMapper(InDao.class).good_or_badSelect(qna_comment_id);
	}

	@Override
	public List<ReplyDto> replyList(int qna_id) {
		return sqlSession.getMapper(InDao.class).replyList(qna_id);
	}

	@Override
	public void replyWrite(ReplyDto replyDto) {
		sqlSession.getMapper(InDao.class).replyWrite(replyDto);
	}

	@Override
	public List<ChooseDto> good_or_badAllSelect(String qna_id) {
		return sqlSession.getMapper(InDao.class).good_or_badAllSelect(qna_id);
	}


}