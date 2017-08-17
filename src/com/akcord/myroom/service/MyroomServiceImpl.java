package com.akcord.myroom.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.myroom.dao.MyroomDao;
import com.akcord.myroom.model.MyroomDto;
import com.akcord.myroom.model.MyroomNextDto;
import com.akcord.util.BoardConstant;

@Service
public class MyroomServiceImpl implements MyroomService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MyroomDto> sectionList(String user_id) {
		return sqlSession.getMapper(MyroomDao.class).sectionList(user_id);
	}

	@Override
	public List<MyroomNextDto> myroomList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(MyroomDao.class).myroomList(query);
	}
	
	@Override
	public List<MyroomNextDto> choiceSectionList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(MyroomDao.class).choiceSectionList(query);
	}

	@Override
	public List<MyroomNextDto> searchList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(MyroomDao.class).searchList(query);
	}
	
	@Override
	public List<GroupRoomDto> groupNameList(String user_id) {
		return sqlSession.getMapper(MyroomDao.class).groupNameList(user_id);
	}

	@Override
	public void insertArticle(MyroomNextDto myroomNextDto) {
		sqlSession.getMapper(MyroomDao.class).insertArticle(myroomNextDto);
	}

//	@Override
//	public int getMyroomNextId() {
//		return sqlSession.getMapper(MyroomDao.class).getMyroomNextId();
//	}
	
	@Override
	public MyroomNextDto selectArticle(String myroomNextId) {
		return sqlSession.getMapper(MyroomDao.class).selectArticle(myroomNextId);
	}

	@Override
	public void updateAtricle(MyroomNextDto myroomNextDto) {
		sqlSession.getMapper(MyroomDao.class).updateMyAtricle(myroomNextDto);
		sqlSession.getMapper(MyroomDao.class).updateGroupAtricle(myroomNextDto);
	}

	@Override
	public void deleteAtricle(String myroomNextId) {
		sqlSession.getMapper(MyroomDao.class).deleteAtricle(myroomNextId);
	}

	@Override
	public void createCategory(MyroomDto myroomDto) {
		sqlSession.getMapper(MyroomDao.class).createCategory(myroomDto);
	}

	@Override
	public void updateCategory(MyroomDto myroomDto) {
		sqlSession.getMapper(MyroomDao.class).updateCategory(myroomDto);
	}

	@Override
	public void deleteCategory(String myroomId) {
		sqlSession.getMapper(MyroomDao.class).deleteCategory(myroomId);
	}

	@Override
	public String getScheduleId(int groupId) {
		return sqlSession.getMapper(MyroomDao.class).getScheduleId(groupId);
	}

}
