package com.akcord.in.dao;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.MajorDto;
import com.akcord.in.model.InDto;




public interface InDao {
   int answerroom(InDto inDto);
   List<InDto> answerlist(Map <String, String> queryString); 
   InDto getAnswer(int qna_id);//글번호 가져오기
   List<InDto> list(Map<String, String> queryString);
   List<MajorDto> majorlist();
   List<InDto> category (Map <String, String> category);
   
   
}