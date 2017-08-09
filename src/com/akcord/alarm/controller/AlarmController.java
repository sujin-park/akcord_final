package com.akcord.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.akcord.alarm.model.AlarmDto;
import com.akcord.alarm.service.AlarmService;
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
   
   @Autowired
   private AlarmService alarmService;
	@RequestMapping(value="/alarm.akcord")
	public @ResponseBody String alarmcount(HttpSession sesstion){
		UserDto userDto = (UserDto) sesstion.getAttribute("user");
		//String user_id = userDto.getUser_id() + "";
		//String name = userDto.getName();
		String user_id = "1";
		String name = "디제이 짱짱맨";
		// 리스트와 숫자를 리턴해줘야한다.
		JSONObject jsonObject = new JSONObject();
		JSONArray jarr0 = new JSONArray();
		JSONArray jarr1 = new JSONArray();
		// 님들 알림 디비로 고고!
		//AlarmDto alarmDto = new AlarmDto();
		int noneRead = alarmService.alarmNoneread(user_id);
		List<AlarmDto> list0 = alarmService.alarmlist0(user_id);
		List<AlarmDto> list1 = alarmService.alarmlist1(user_id);

	
      for (AlarmDto alarmDto:list0) {
         JSONObject jsontmp = new JSONObject();

         jsontmp.put("target_id",alarmDto.getTarget_id());
         jsontmp.put("logtime", alarmDto.getLogtime());
         jsontmp.put("key", alarmDto.getKey());
         jsontmp.put("seq", alarmDto.getAlarm_seq());
         jsontmp.put("flag", alarmDto.getFlag());

         jarr0.add(jsontmp);
      }
      for (AlarmDto alarmDto:list1) {
         JSONObject jsontmp = new JSONObject();

         jsontmp.put("target_id",alarmDto.getTarget_id());
         jsontmp.put("logtime", alarmDto.getLogtime());
         jsontmp.put("key", alarmDto.getKey());
         jsontmp.put("seq", alarmDto.getAlarm_seq());
         jsontmp.put("flag", alarmDto.getFlag());

         jarr1.add(jsontmp);
      }
      
      jsonObject.put("nr", noneRead);
      jsonObject.put("name", name);
      jsonObject.put("list0", jarr0);
      jsonObject.put("list1", jarr1);
      

      return jsonObject.toJSONString();
   }

}