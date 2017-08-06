package com.akcord.admin.dao;

import java.util.List;
import java.util.Map;

import com.akcord.admin.model.NoticeDto;

public interface NoticeDao {
	
	List<NoticeDto> getNoticeList(Map<String,String> query);

	int noticeWrite(NoticeDto noticeDto);
	NoticeDto getNotice(String notice_id);
	int modify(NoticeDto noticeDto);
	int delete(String notice_id);
	int noticePublic(String notice_id);
	
}
