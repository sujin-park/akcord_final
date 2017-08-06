package com.akcord.alarm.service;

import java.util.List;

import com.akcord.alarm.model.AlarmDto;

public interface AlarmService {
	
	void alarminsertGroupinvite(String target_id);		// 알람 DB 저장 - Groupinvite
	void alarminsertGroupaccept(String target_id);		// 알람 DB 저장 - Groupaccept
	void alarminsertQnareply(String target_id);			// 알람 DB 저장 - Qnareply
	void alarminsertQnacomment(String target_id);		// 알람 DB 저장 - Qnacomment
	void alarminsertQnalike(String target_id);			// 알람 DB 저장 - Qnalike
	void alarminsertQnadislike(String target_id);		// 알람 DB 저장 - Qnadislike
	
	List<String> alarmMemberCall();	// 모든 멤버 호출
	void alarminsertNotice(String target_id);// 공지사항 알림 전송
	
	AlarmDto alarmlist(String target_id);	// 알람 리스트 호출
	int alarmNoneread(String target_id);	// 아직 안 읽은 알람
	int alarmreadset(int seqence_num);		// 알람 읽음 설정
	
	void alarmOff(); 		// 알람 기능 해제
	void alarmOn(); 		// 알람 기능 켜기
	
	
}
