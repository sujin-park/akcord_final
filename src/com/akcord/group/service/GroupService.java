package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;

public interface GroupService {

	public int createG(GroupRoomDto groupRoomDto); // 그룹방 개설
	
	public List<GroupRoomDto> grouplist(String myseq); // 처음 그룹 리스트
	
	public List<GroupRoomDto> waitinglist(int seq); // 승인 리스트
	
	public List<MajorDto> majorlist(); // 전공 셀렉트 박스 리스트
	
	public int nowCount(); // 현재 인원 수 
	
	public int joinGroup(Map<String, String> map); // 그룹방 가입 요청
	
	public int cancel(String seq);
}
