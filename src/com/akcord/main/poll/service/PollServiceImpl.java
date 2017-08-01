package com.akcord.main.poll.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.main.poll.dao.PollDao;
import com.akcord.main.poll.model.PollDto;

@Service
public class PollServiceImpl implements PollService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getNextPollSeq() {
		// TODO next poll seq
		return sqlSession.getMapper(PollDao.class).getNextPollSeq();
	}
	
	@Override
	public int pollmake(PollDto pollDto) {
		// TODO create poll chart
		return sqlSession.getMapper(PollDao.class).pollmake(pollDto);
	}
	@Override
	public int pollmakeContent(String content) {
		// TODO create poll chart for contents
		return sqlSession.getMapper(PollDao.class).pollmakeContent(content);
	}

	@Override
	public PollDto pollmodify(int poll_id) {
		return sqlSession.getMapper(PollDao.class).pollmodify(poll_id);
		// TODO get detail poll info
		
	}
	@Override
	public int pollmodifydate(PollDto pollDto) {
		return sqlSession.getMapper(PollDao.class).pollmodifydate(pollDto);
		// TODO get detail poll info
		
	}

	@Override
	public List<String> pollgetContent(int poll_id) {
		// TODO get detail poll contents info
		return sqlSession.getMapper(PollDao.class).pollgetContent(poll_id);
	}

	@Override
	public int pollclose(int poll_id) {
		// TODO set end date to today
		return sqlSession.getMapper(PollDao.class).pollclose(poll_id);
	}

	@Override
	public List<PollDto> polllist() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(PollDao.class).polllist();
	}



}
