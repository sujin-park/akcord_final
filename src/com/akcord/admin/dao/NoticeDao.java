package com.akcord.admin.dao;

import java.util.List;

import com.akcord.admin.model.NoticeDto;

public interface NoticeDao {
	
	List<NoticeDto> getNoticeList();
	List<NoticeDto> getNoticeOrder(String str);
	int noticeWrite(NoticeDto noticeDto);
	NoticeDto getNotice(String notice_id);
	int modify(NoticeDto noticeDto);
	int delete(String notice_id);
	int noticePublic(String notice_id);
}
