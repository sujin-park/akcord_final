package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.CommentDto;
import com.akcord.in.model.InDto;

public interface CommentService {
	
	CommentDto getAnswer(int qna_id); //클릭시 질문 글번호 가져오기
	int answerSave(CommentDto commentDto); //답변 저장
	List<CommentDto> list(Map<String, String> queryString); //답변 저장 후 리스트 뷰
	List<CommentDto> getlist(int qna_id); //클릭시 답변 글번호 가져오기
	int updateHit(int qna_id); //조회수 업데이트
	int modify(CommentDto commentDto);//수정
}
