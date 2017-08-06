package com.akcord.alarm.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.alarm.dao.AlarmDao;
import com.akcord.alarm.model.AlarmDto;

@Service
public class AlarmServiceImpl implements AlarmService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void alarminsertGroupinvite(String target_id) {
		// TODO 그룹 초대받았을때 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertGroupinvite(target_id);
	}

	@Override
	public void alarminsertGroupaccept(String target_id) {
		// TODO 그룹 가입 승인됬을때 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertGroupaccept(target_id);
	}

	@Override
	public void alarminsertQnareply(String target_id) {
		// TODO 지식인 글에 답변이 달렸을때 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertQnareply(target_id);
	}

	@Override
	public void alarminsertQnacomment(String target_id) {
		// TODO 지식인 글에 덧글이 달렸을때 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertQnacomment(target_id);
	}

	@Override
	public void alarminsertQnalike(String target_id) {
		// TODO 지식인 글에 좋아요 눌려졌을 떄 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertQnalike(target_id);
	}

	@Override
	public void alarminsertQnadislike(String target_id) {
		// TODO 지식인 글에 싫어요 눌러졌을때 알람
		sqlSession.getMapper(AlarmDao.class).alarminsertQnadislike(target_id);
	}

	@Override
	public AlarmDto alarmlist(String target_id) {
		// TODO 알람 리스트 가져오기
		return sqlSession.getMapper(AlarmDao.class).alarmlist(target_id);
	}

	@Override
	public int alarmreadset(int seqence_num) {
		// TODO 알람 읽음 설정
		return sqlSession.getMapper(AlarmDao.class).alarmreadset(seqence_num);
	}

	@Override
	public int alarmNoneread(String target_id) {
		// TODO 안읽은 알람 수
		return sqlSession.getMapper(AlarmDao.class).alarmNoneread(target_id);
	}

	@Override
	public void alarmOff() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void alarmOn() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> alarmMemberCall() {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(AlarmDao.class).alarmMemberCall();
	}

	@Override
	public void alarminsertNotice(String target_id) {
		// TODO 모든 멤버에게 공지 사항 등록을 알린다.
		List<String> list = sqlSession.getMapper(AlarmDao.class).alarmMemberCall();
		
		for (int i = 0; i < list.size(); i++) {
			target_id = list.get(i);
			sqlSession.getMapper(AlarmDao.class).alarminsertNotice(target_id);
		}
		
	}

}
