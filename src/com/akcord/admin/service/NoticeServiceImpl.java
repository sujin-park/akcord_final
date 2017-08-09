package com.akcord.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.admin.dao.NoticeDao;
import com.akcord.admin.model.NoticeDto;
import com.akcord.util.BoardConstant;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<NoticeDto> userNoticeList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.ALIST_SIZE;
		int start = end - BoardConstant.ALIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(NoticeDao.class).userNoticeList(query);
	}
	@Override
	public List<NoticeDto> getNoticeList(Map<String,String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.ALIST_SIZE;
		int start = end - BoardConstant.ALIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(NoticeDao.class).getNoticeList(query);
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
	public void updateHit(String notice_id) {
		sqlSession.update(notice_id);
	}
	
}
