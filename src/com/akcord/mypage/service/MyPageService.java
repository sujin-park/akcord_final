package com.akcord.mypage.service;

import java.util.List;
import java.util.Map;

import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

public interface MyPageService {
   
   UserDto mypage(String id);
   int mypagemodify(Map<String, String> map);   
   
   MypageDto myArticle(String user_id);         
   
   List<String> groupcheck(int user_id);   
   List<String> groupshare(String group_id);   

   List<MypageDto> myArticleSearch(String user_id);         
   String getgroupname(String myroom_next_id);   // 그룹 이름 가져와요
   MypageDto myArticleGo(Map<String, String> map);
   
   int myArticleDeleteReply(int seq);      
   int myArticleDeleteQna(int seq);      
   int myArticleDeleteShare(int seq);      
   int myArticleDeletechile(int seq);      // 하위 답글 삭제
   int searchChile(int seq);            // 하위 답글 유무 검색
   

}