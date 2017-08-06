package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.MajorDto;
import com.akcord.in.model.InDto;


public interface InService {
   int answerroom(InDto inDto);

   List<InDto> answerlist(Map <String, String> queryString);

   List<InDto> list(Map<String, String> queryString);
   InDto getId(String string);
   InDto getAnswer(int qna_id);

   List<MajorDto> majorlist();
}