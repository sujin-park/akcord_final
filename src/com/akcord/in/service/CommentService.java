package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.*;

public interface CommentService {
	
	CommentDto getQnaAnswer(int qna_comment_id);
	CommentDto getAnswer(int qna_id);
	int answerSave(CommentDto commentDto);
	List<CommentDto> list(Map<String, String> queryString);
	List<ChooseDto> getlist(int qna_id);
	int updateHit(int qna_id);
	int modify(CommentDto commentDto);
	void deleteQnaAnswer(int qna_comment_id);
	void deleteAnswerRe(int qna_comment_id);
}
