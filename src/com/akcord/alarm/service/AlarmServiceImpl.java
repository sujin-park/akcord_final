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

      sqlSession.getMapper(AlarmDao.class).alarminsertGroupinvite(target_id);
   }

   @Override
   public void alarminsertGroupaccept(String target_id) {

      sqlSession.getMapper(AlarmDao.class).alarminsertGroupaccept(target_id);
   }

   @Override
   public void alarminsertQnareply(String target_id) {

      sqlSession.getMapper(AlarmDao.class).alarminsertQnareply(target_id);
   }

   @Override
   public void alarminsertQnacomment(String target_id) {

      sqlSession.getMapper(AlarmDao.class).alarminsertQnacomment(target_id);
   }

   @Override
   public void alarminsertQnalike(String target_id) {

      sqlSession.getMapper(AlarmDao.class).alarminsertQnalike(target_id);
   }

   @Override
   public void alarminsertQnadislike(String target_id) {

      sqlSession.getMapper(AlarmDao.class).alarminsertQnadislike(target_id);
   }

   @Override
   public List<AlarmDto> alarmlist0(String target_id) {

      return sqlSession.getMapper(AlarmDao.class).alarmlist0(target_id);
   }
   @Override
   public List<AlarmDto> alarmlist1(String target_id) {

      return sqlSession.getMapper(AlarmDao.class).alarmlist1(target_id);
   }

   @Override
   public int alarmreadset(int seqence_num) {

      return sqlSession.getMapper(AlarmDao.class).alarmreadset(seqence_num);
   }

   @Override
   public int alarmNoneread(String target_id) {
      return sqlSession.getMapper(AlarmDao.class).alarmNoneread(target_id);
   }

   @Override
   public void alarmOff(String target_id) {
      sqlSession.getMapper(AlarmDao.class).alarmOff(target_id);
   }


   @Override
   public List<Integer> alarmMemberCall() {
      return sqlSession.getMapper(AlarmDao.class).alarmMemberCall();
   }

   @Override
   public void alarminsertNotice(int target_id) {
      List<Integer> list = sqlSession.getMapper(AlarmDao.class).alarmMemberCall();
      
      for (int i = 0; i < list.size(); i++) {
         target_id = list.get(i);
         sqlSession.getMapper(AlarmDao.class).alarminsertNotice(target_id);
      }
      
   }

@Override
public int alarmcheck(String target_id) {
   return sqlSession.getMapper(AlarmDao.class).alarmcheck(target_id);
}

@Override
public void alarmOn(String target_id) {
   sqlSession.getMapper(AlarmDao.class).alarmOn(target_id);
}

}