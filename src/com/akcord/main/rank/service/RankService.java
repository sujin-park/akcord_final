package com.akcord.main.rank.service;

import com.akcord.main.rank.model.RankDto;

public interface RankService {
	
	RankDto getQna();	// qna ��ŷ ��������
	RankDto getQnaComment();	// qna ��ŷ ��������
	
	RankDto getGroup();	//
	RankDto getMyroom();	// 마이룸 조회수 랭킹


}
