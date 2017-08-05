package com.akcord.mypage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.mypage.dao.MyPageDao;
import com.akcord.mypage.model.MypageDto;
import com.akcord.user.model.UserDto;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public UserDto mypage(String id) {
		// TODO 내 정보를 불러와보아요
		return sqlSession.getMapper(MyPageDao.class).mypage(id);
	}
	@Override
	public int mypagemodify(Map<String, String> map) {
		// TODO 내 정보를 불러와보아요
		return sqlSession.getMapper(MyPageDao.class).mypagemodify(map);
	}

	@Override
	public MypageDto myArticle(String user_id) {
		// TODO 내 글을 불러와보자
		return sqlSession.getMapper(MyPageDao.class).myArticle(user_id);
	}

	@Override
	public MypageDto myArticleSearch(String word) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MypageDto myArticleGo(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> groupcheck(int user_id) {
		// TODO 그룹 가입 여부 확인
		return sqlSession.getMapper(MyPageDao.class).groupcheck(user_id);
	}
	@Override
	public List<String> groupshare(String group_id) {
		// TODO 그룹방에 글 공유 여부 확인
		return sqlSession.getMapper(MyPageDao.class).groupshare(group_id);
	}
	@Override
	public Map<String, String> getgroupname(String group_id) {
		// TODO 마이페이지 노출을 위한 그룹명 가져오기
		return sqlSession.getMapper(MyPageDao.class).getgroupname(group_id);
	}
	@Override
	public int myArticleDeleteReply(int seq) {
		// TODO 내 답글 삭제
		int qna_comment_id = seq;
		return sqlSession.getMapper(MyPageDao.class).myArticleDeleteReply(qna_comment_id);
	}
	@Override
	public int myArticleDeleteQna(int seq) {
		// TODO 내 지식인 글 삭제
		int qna_id = seq;
		return sqlSession.getMapper(MyPageDao.class).myArticleDeleteQna(qna_id);
	}
	@Override
	public int myArticleDeleteShare(int seq, int group_id) {
		// TODO 내 공유글 삭제
		int myroom_next_id = seq;
		return sqlSession.getMapper(MyPageDao.class).myArticleDeleteShare(myroom_next_id, group_id);
	}

}
