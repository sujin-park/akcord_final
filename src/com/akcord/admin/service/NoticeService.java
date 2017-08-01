package com.akcord.admin.service;

import java.util.List;
import java.util.Map;

import com.akcord.admin.model.NoticeDto;

public interface NoticeService {
	List<NoticeDto> getNoticeList();
	int noticeWrite(NoticeDto noticeDto);
	NoticeDto getNotice(String notice_id);
	int modify(NoticeDto noticeDto);
	int delete(String notice_id);
	int noticePublic(String notice_id);
	List<NoticeDto> getNoticeOrder(Map<String,String> str);
}
