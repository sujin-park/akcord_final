package com.akcord.mypage.service;

import java.util.List;
import java.util.Map;

import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

public interface MyPageService {
	
	UserDto mypage(String id);	// 내 정보 보기
	int mypagemodify(Map<String, String> map);	// 내 정보 modify
	
	MypageDto myArticle(String user_id);			// 내 글들 호출
	
	List<String> groupcheck(int user_id);	// 그룹 가입 체크
	List<String> groupshare(String group_id);	// 그룹 공유 확인 및 공유 글 번호
	Map<String, String> getgroupname(String group_id);	// 그룹 이름 호출
	
	MypageDto myArticleSearch(String word);			// 내 글 중에 검색
	MypageDto myArticleGo(Map<String, String> map);	// 내 글이 있는 게시판으로 이동
	
	int myArticleDeleteReply(int seq);		// 내 글 바로 삭제 - 답변
	int myArticleDeleteQna(int seq);		// 내 글 바로 삭제 - 지식인
	int myArticleDeleteShare(int seq, int group_id);		// 내 글 바로 삭제 - 공유글
	

}
