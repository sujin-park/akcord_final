package com.akcord.alarm.service;

import java.util.List;

import com.akcord.alarm.model.AlarmDto;

public interface AlarmService {
   
   void alarminsertGroupinvite(String target_id);   
   void alarminsertGroupaccept(String target_id);   
   void alarminsertQnareply(String target_id);      
   void alarminsertQnacomment(String target_id);      
   void alarminsertQnalike(String target_id);      
   void alarminsertQnadislike(String target_id);      
   
   List<Integer> alarmMemberCall();   
   void alarminsertNotice(int target_id);
   
   List<AlarmDto> alarmlist0(String target_id);
   List<AlarmDto> alarmlist1(String target_id);   
   int alarmNoneread(String target_id);   
   int alarmreadset(int seqence_num);      
   
   void alarmOff(String target_id);       // 알람 끄기
   void alarmOn(String target_id);       // 알람 켜기
   int alarmcheck(String target_id);   // 알람 설정 여부
   
   
}