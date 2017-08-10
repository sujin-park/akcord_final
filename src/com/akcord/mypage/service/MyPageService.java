package com.akcord.mypage.service;

import java.util.List;
import java.util.Map;

import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

public interface MyPageService {
	
	UserDto mypage(String id);	// �� ���� ����
	int mypagemodify(Map<String, String> map);	// �� ���� modify
	
	MypageDto myArticle(String user_id);			// �� �۵� ȣ��
	
	List<String> groupcheck(int user_id);	// �׷� ���� üũ
	List<String> groupshare(String group_id);	// �׷� ���� Ȯ�� �� ���� �� ��ȣ
	Map<String, String> getgroupname(String group_id);	// �׷� �̸� ȣ��
	
	List<MypageDto> myArticleSearch(String user_id);			// �� �� �߿� �˻�
	MypageDto myArticleGo(Map<String, String> map);	// �� ���� �ִ� �Խ������� �̵�
	
	int myArticleDeleteReply(int seq);		// �� �� �ٷ� ���� - �亯
	int myArticleDeleteQna(int seq);		// �� �� �ٷ� ���� - ������
	int myArticleDeleteShare(int seq, int group_id);		// �� �� �ٷ� ���� - ������
	

}
