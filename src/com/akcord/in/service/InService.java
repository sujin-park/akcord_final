package com.akcord.in.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.MajorDto;
import com.akcord.in.model.*;


public interface InService {
   List<MajorDto> majorlist(); //전공 리스트
   List<InDto> answerlist(Map <String, String> queryString); //지식인 리스트
   List<InDto> replyCountList(Map <String, String> queryString); //답변순 리스트
   //List<InDto> category (Map <String, String>  category); //카테고리 클릭시 리스트
   InDto getAnswer(int qna_id); //지식인 리스트 클릭시 질문내용보기

   int answerroom(Map <String, String> queryString); //질문 등록
   int updateAnswerroom(Map <String, String> queryString); //질문 수정
   int deleteAnswerroom(String qna_id); //질문 삭제

   List<InDto> list(Map<String, String> queryString);
   InDto getId(String string);
   
   List<ChooseDto> good_or_badAllSelect(String qna_id); //모든 답변의 좋아요 싫어요 조회
   void good_or_badUpdate(Map<String, String> queryString); //하나의 답변에 좋아요 싫어요 증가
   ChooseDto good_or_badSelect(String qna_comment_id); //하나의 답변애 좋아요 싫어요 조회
   
   List<ReplyDto> replyList(int qna_id);
   void replyWrite(ReplyDto replyDto);
}