package com.akcord.alarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
      String user_id = userDto.getUser_id() + "";
      String name = userDto.getName();
      
      JSONObject jsonObject = new JSONObject();
      JSONArray jarr0 = new JSONArray();
      JSONArray jarr1 = new JSONArray();
      //AlarmDto alarmDto = new AlarmDto();
      int noneRead = alarmService.alarmNoneread(user_id);
      List<AlarmDto> list0 = alarmService.alarmlist0(user_id);
      List<AlarmDto> list1 = alarmService.alarmlist1(user_id);
   
      for (AlarmDto alarmDto:list0) {
         JSONObject jsontmp = new JSONObject();
         jsontmp.put("target_id",alarmDto.getTarget_id());
         jsontmp.put("logtime", alarmDto.getLogtime());
         jsontmp.put("key", alarmDto.getKey());
         jsontmp.put("seq", alarmDto.getSeq());
         jsontmp.put("flag", alarmDto.getFlag());
         jarr0.add(jsontmp);
      }
      for (AlarmDto alarmDto:list1) {
         JSONObject jsontmp = new JSONObject();
         jsontmp.put("target_id",alarmDto.getTarget_id());
         jsontmp.put("logtime", alarmDto.getLogtime());
         jsontmp.put("key", alarmDto.getKey());
         jsontmp.put("seq", alarmDto.getSeq());
         jsontmp.put("flag", alarmDto.getFlag());
         jarr1.add(jsontmp);
      }
      jsonObject.put("nr", noneRead);
      jsonObject.put("name", name);
      jsonObject.put("list0", jarr0);
      jsonObject.put("list1", jarr1);
      return jsonObject.toJSONString();
   }
   
   @RequestMapping(value="/delete.akcord")
   public String alarmDelete(@RequestParam int seq, @RequestParam int key, HttpSession sesstion){

      UserDto userDto = (UserDto) sesstion.getAttribute("user");
      //System.out.println("내가 메이쟈다  "+userDto.getMajor_id());
      int sequence_num = seq;
      String text = "";
      if(userDto!=null){
         int cnt = alarmService.alarmreadset(sequence_num);
         if(cnt!=0){

            if(key==1){
               text = "/group/waitinglist.akcord?pg=1";
            } else if(key==2){
               text = "/group/waitinglist.akcord?pg=1";
            } else if(key==3){
               text = "/in/list.akcord?user_id="+userDto.getUser_id()+"&major_id="+userDto.getMajor_id()+"&pg=1";
            } else if(key==4){
               text = "/in/list.akcord?user_id="+userDto.getUser_id()+"&major_id="+userDto.getMajor_id()+"&pg=1";
            } else if(key==5){
               text = "/in/list.akcord?user_id="+userDto.getUser_id()+"&major_id="+userDto.getMajor_id()+"&pg=1";
            } else if(key==6){
               text = "/in/list.akcord?user_id="+userDto.getUser_id()+"&major_id="+userDto.getMajor_id()+"&pg=1";
            } else if(key==7){
               text = "/notice/userNoticelist.akcord?pg=1&key=&word=&order=";
            } 
         }
      }
      return "redirect:" + text;
   }
   
   @RequestMapping(value="/alarmoff.akcord")
   public String alarmOff(HttpSession session){
      UserDto userDto = (UserDto) session.getAttribute("user");
      String target_id = userDto.getUser_id() + "";
      alarmService.alarmOff(target_id);
      return "redirect:/mypage/mypage.akcord?id"+target_id;
   }
   
   @RequestMapping(value="/alarmon.akcord")
   public String alarmOn(HttpSession session){
      UserDto userDto = (UserDto) session.getAttribute("user");
      String target_id = userDto.getUser_id() + "";
      //String target_id = "29";
      int check = alarmService.alarmcheck(target_id);

      if(check!=0){
         alarmService.alarmOn(target_id);

      }

      return "redirect:/mypage/mypage.akcord?id="+target_id;
   }

}