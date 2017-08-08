package com.akcord.main.rank.dao;

import java.util.List;

import com.akcord.main.rank.model.RankDto;

public interface RankDao {
	
	List<RankDto> getQna();	// qna ��ŷ ��������
	List<RankDto> getQnaComment();	// qna ��ŷ ��������
	
	List<RankDto> getGroup();	//
	List<RankDto> getMyroom();	// 마이룸 조회수 랭킹

}
