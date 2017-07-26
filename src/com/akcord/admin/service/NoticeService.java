package com.akcord.admin.service;

import java.util.List;

import com.akcord.admin.model.NoticeDto;

public interface NoticeService {
	List<NoticeDto> getNoticeList();
	int noticeWrite(NoticeDto noticeDto);
	NoticeDto getNotice(String notice_id);
	int modify(NoticeDto noticeDto);
	int delete(String notice_id);

}
