package com.akcord.main.rank.service;

import java.util.List;

import com.akcord.main.rank.model.RankDto;

public interface RankService {
	
	List<RankDto> getQna();
	List<RankDto> getQnaComment();
	
	List<RankDto> getGroup();	//
	String getGroupname(String id);	// 그룹이름 구해오기
	
	
	List<RankDto> getMyroom();


}
