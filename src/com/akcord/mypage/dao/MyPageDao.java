package com.akcord.mypage.dao;

import java.util.List;
import java.util.Map;

import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

public interface MyPageDao {
	
	UserDto mypage(String id);	// �� ���� ����
	int mypagemodify(Map<String, String> map);	// �� ���� modify
	
	MypageDto myArticle(String user_id);				// �� �۵� ȣ��
	
	List<String> groupcheck(int user_id);	// �׷� ���� üũ
	List<String> groupshare(String group_id);	// �׷� ���� Ȯ��
	Map<String, String> getgroupname(String group_id);	// �׷� �̸� ȣ��
	
	List<MypageDto> myArticleSearch(String user_id);			// �� �� �߿� �˻�
	MypageDto myArticleGo(Map<String, String> map);	// �� ���� �ִ� �Խ������� �̵�
	
	int myArticleDeleteReply(int qna_comment_id);		// �� �� �ٷ� ���� - �亯
	int myArticleDeleteQna(int qna_id);		// �� �� �ٷ� ���� - ������
	int myArticleDeleteShare(int myroom_next_id, int group_id);		// �� �� �ٷ� ���� - ������

}
