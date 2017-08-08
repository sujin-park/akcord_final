package com.akcord.in.dao;

import java.util.List;

import com.akcord.in.model.CommentDto;
import com.akcord.in.model.InDto;



public interface InCommentDao {
	
	 CommentDto getAnswer(int qna_id);
}
