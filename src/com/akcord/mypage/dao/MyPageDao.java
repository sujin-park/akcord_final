package com.akcord.mypage.dao;

import java.util.List;
import java.util.Map;

import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

public interface MyPageDao {
   
   UserDto mypage(String id);   // 占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
   int mypagemodify(Map<String, String> map);   // 占쏙옙 占쏙옙占쏙옙 modify
   
   MypageDto myArticle(String user_id);            // 占쏙옙 占쌜듸옙 호占쏙옙
   
   List<String> groupcheck(int user_id);   // 占쌓뤄옙 占쏙옙占쏙옙 체크
   List<String> groupshare(String group_id);   // 占쌓뤄옙 占쏙옙占쏙옙 확占쏙옙
   
   List<MypageDto> myArticleSearch(String user_id);         // 占쏙옙 占쏙옙 占쌩울옙 占싯삼옙
   String getgroupname(String myroom_next_id);   // 그룹 이름 가져와요
   MypageDto myArticleGo(Map<String, String> map);   // 占쏙옙 占쏙옙占쏙옙 占쌍댐옙 占쌉쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙
   
   int myArticleDeleteReply(int qna_comment_id);      // 占쏙옙 占쏙옙 占쌕뤄옙 占쏙옙占쏙옙 - 占썰변
   int myArticleDeleteQna(int qna_id);      // 占쏙옙 占쏙옙 占쌕뤄옙 占쏙옙占쏙옙 - 占쏙옙占쏙옙占쏙옙
   int myArticleDeleteShare(int myroom_next_id);      // 占쏙옙 占쏙옙 占쌕뤄옙 占쏙옙占쏙옙 - 占쏙옙占쏙옙占쏙옙
   int myArticleDeletechile(int seq);      // 하위 답글 삭제
   int searchChile(int seq);            // 하위 답글 유무 검색

}