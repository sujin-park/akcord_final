package com.akcord.main.poll.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.main.poll.dao.PollDao;
import com.akcord.main.poll.model.PollDto;
import com.akcord.util.BoardConstant;

@Service
public class PollServiceImpl implements PollService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextPollSeq() {
		return sqlSession.getMapper(PollDao.class).getNextPollSeq();
	}
	
	@Override
	public int pollmake(PollDto pollDto) {
		return sqlSession.getMapper(PollDao.class).pollmake(pollDto);
	}
	@Override
	public int pollmakeContent(String content) {
		return sqlSession.getMapper(PollDao.class).pollmakeContent(content);
	}

	@Override
	public PollDto pollmodify(int poll_id) {
		return sqlSession.getMapper(PollDao.class).pollmodify(poll_id);
	}
	@Override
	public int pollmodifydate(Map<String,String> map) {
		return sqlSession.getMapper(PollDao.class).pollmodifydate(map);
	}

	@Override
	public List<String> pollgetContent(int poll_id) {
		return sqlSession.getMapper(PollDao.class).pollgetContent(poll_id);
	}

	@Override
	public int pollclose(int poll_id) {
		return sqlSession.getMapper(PollDao.class).pollclose(poll_id);
	}

	@Override
	public List<PollDto> polllist(Map<String,String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.ALIST_SIZE;
		int start = end - BoardConstant.ALIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(PollDao.class).polllist(query);
	}

	@Override
	public List<PollDto> pollresult(int poll_id) {
		return sqlSession.getMapper(PollDao.class).pollresult(poll_id);
	}

	@Override
	public List<PollDto> mainpollget() {
		return sqlSession.getMapper(PollDao.class).mainpollget();
	}

	@Override
	public void pollupdate(Map<String, String> query) {
		sqlSession.getMapper(PollDao.class).pollupdate(query);
	}

	@Override
	public void pollYN(Map<String, String> query) {
		sqlSession.getMapper(PollDao.class).pollYN(query);
	}

	@Override
	public List<PollDto> removeBtn() {
		return sqlSession.getMapper(PollDao.class).removeBtn();
	}
}
