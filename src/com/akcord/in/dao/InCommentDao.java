package com.akcord.in.dao;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.ChooseDto;
import com.akcord.in.model.CommentDto;

public interface InCommentDao {

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
