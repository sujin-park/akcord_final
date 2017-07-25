package com.akcord.admin.dao;

import java.util.List;

import com.akcord.admin.model.NoticeDto;

public interface NoticeDao {
	
	List<NoticeDto> getNoticeList();
	int noticeWrite(NoticeDto noticeDto);
	NoticeDto getNotice(String notice_id);
	int modify(NoticeDto noticeDto);
	int delete(String notice_id);
}
