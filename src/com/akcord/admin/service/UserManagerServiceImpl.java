package com.akcord.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.admin.dao.UserManagerDao;
import com.akcord.admin.model.UserManageDto;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;
import com.akcord.util.BoardConstant;
@Service
public class UserManagerServiceImpl implements UserManagerService {

	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public List<UserManageDto> getUserList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.ALIST_SIZE;
		int start = end - BoardConstant.ALIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(UserManagerDao.class).getUserList(query);
	}

/*	@Override
	public UserDto getUser(String user_id) {
		return null;
	}
*/
	@Override
	public int blackuserReg(String user_id) {
		return sqlSession.getMapper(UserManagerDao.class).blackuserReg(user_id);
	}

	@Override
	public int majorPlus(String mname) {
		return  sqlSession.getMapper(UserManagerDao.class).majorPlus(mname);
	}

	@Override
	public List<MajorDto> getMajor() {
		return sqlSession.getMapper(UserManagerDao.class).getMajor();
	}

	@Override
	public List<UserManageDto> getMemberOrder(Map<String, String> str) {
		return sqlSession.getMapper(UserManagerDao.class).getMemberOrder(str);
	}

	@Override
	public List<UserManageDto> getBlackUserList(Map<String, String> query) {
		int pg = Integer.parseInt(query.get("pg"));
		int end = pg * BoardConstant.LIST_SIZE;
		int start = end - BoardConstant.LIST_SIZE;
		query.put("start", start+"");
		query.put("end", end+"");
		return sqlSession.getMapper(UserManagerDao.class).getBlackUserList(query);
	}

	@Override
	public void bUserOut(String user_id) {
		sqlSession.getMapper(UserManagerDao.class).bUserOut(user_id);
	}

}
