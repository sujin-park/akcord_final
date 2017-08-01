package com.akcord.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.admin.dao.NoticeDao;
import com.akcord.admin.model.NoticeDto;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<NoticeDto> getNoticeList() {
		return sqlSession.getMapper(NoticeDao.class).getNoticeList();
	}
	@Override
	public int noticeWrite(NoticeDto noticeDto) {
		return sqlSession.getMapper(NoticeDao.class).noticeWrite(noticeDto);
	}
	@Override
	public NoticeDto getNotice(String notice_id) {
		return sqlSession.getMapper(NoticeDao.class).getNotice(notice_id);
	}
	@Override
	public int modify(NoticeDto noticeDto) {
		return sqlSession.getMapper(NoticeDao.class).modify(noticeDto);
	}
	@Override
	public int delete(String notice_id) {
		return sqlSession.getMapper(NoticeDao.class).delete(notice_id);
	}
	@Override
	public int noticePublic(String notice_id) {
		return sqlSession.getMapper(NoticeDao.class).noticePublic(notice_id);
	}
	@Override
	public List<NoticeDto> getNoticeOrder(Map<String, String> str) {
		return sqlSession.getMapper(NoticeDao.class).getNoticeOrder(str);
	}
	
}
