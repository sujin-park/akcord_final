package com.akcord.in.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.MajorDto;
import com.akcord.in.model.InDto;

public interface InDao {
   List<InDto> answerlist(Map <String, String> queryString); 
   InDto getAnswer(int qna_id);
   List<MajorDto> majorlist();
   //List<InDto> category (Map <String, String> category);
   
   int answerroom(Map <String, String> queryString);
   int updateAnswerroom(Map <String, String> queryString);
   int deleteAnswerroom(String qna_id);
   
   List<InDto> list(Map<String, String> queryString);
}