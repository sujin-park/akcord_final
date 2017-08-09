package com.akcord.in.dao;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.CommentDto;

public interface InCommentDao {

	CommentDto getAnswer(int qna_id);
	int answerSave(CommentDto commentDto);
	List<CommentDto> list(Map<String, String> queryString);
	List<CommentDto> getlist(int qna_id);
	int updateHit(int qna_id);
	int modify(CommentDto commentDto);
}
