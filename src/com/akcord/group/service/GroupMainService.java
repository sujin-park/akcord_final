package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupHwDto;
import com.akcord.group.model.GroupListDto;
import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.ScheduleDto;

public interface GroupMainService {

	public List<GroupListDto> gMemberlist(Map<String, String> query); // 대기 리스트
	public int rejectMember(Map<String, String> map); // 회원 승인 거절
	
	public int acceptMember(Map<String, String> map); // 회원 승인
	
	public List<GroupListDto> searchlist(String sid); // 검색
	
	public int invite(Map<String, String> map); // 그룹원초대
	
	public List<GroupListDto> originlist(Map<String, String> map); // 그룹원 리스트 뿌리기
	
	public GroupRoomDto gMainInfo(int groupId); // 그룹방 기본 정보 뿌리기
	
	public int scheduleInsert(ScheduleDto scheduleDto); // 일정 추가
	
	public List<ScheduleDto> schedulelist(int groupId); // 일정리스트 뿌리기
	
	public int scheduleModify(ScheduleDto scheduleDto); // 일정수정
	
	public int scheduleDelete(int scheduleId); // 일정삭제
	
	public List<GroupHwDto> groupArticleList(int groupId); // 그룹방 글목록 리스트
}
