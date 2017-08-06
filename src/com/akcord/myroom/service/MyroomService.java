package com.akcord.myroom.service;

import java.util.List;
import java.util.Map;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.myroom.model.MyroomDto;
import com.akcord.myroom.model.MyroomNextDto;

public interface MyroomService {
	List<MyroomDto> sectionList(String user_id); //섹션 이름 리스트
	List<MyroomNextDto> myroomList(Map<String, String> query); //내 개인방 전체 리스트
	List<MyroomNextDto> choiceSectionList(Map<String, String> query); //섹션 이름 중 선택한 개인방 리스트
	List<MyroomNextDto> searchList(Map<String, String> query); //내 개인방 전체 리스트
	List<GroupRoomDto> groupNameList(String user_id); //내가 가입한 그룹방 리스트
	void insertArticle(MyroomNextDto myroomNextDto); //개인방 글 등록
//	int getMyroomNextId();
	MyroomNextDto selectArticle(String myroomNextId); //개인방 글 조회
	void updateAtricle(MyroomNextDto myroomNextDto); //개인방 글 수정
	void deleteAtricle(String myroomNextId); //개인방 글 삭제
	void createCategory(MyroomDto myroomDto); //카테고리 추가
	void updateCategory(MyroomDto myroomDto); //카테고리 수정
	void deleteCategory(String myroomId); //카테고리 삭제
}
