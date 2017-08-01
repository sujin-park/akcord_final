package com.akcord.group.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupListDto;

public interface GroupMainService {

	public List<GroupListDto> gMemberlist(Map<String, String> query); // 대기 리스트
	public int rejectMember(Map<String, String> map); // 회원 승인 거절
	
	public int acceptMember(Map<String, String> map); // 회원 승인
	
	public List<GroupListDto> searchlist(String sid);
	
	public int invite(Map<String, String> map);
	
	public List<GroupListDto> originlist(Map<String, String> map);
}
