package com.akcord.main.poll.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.User;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.service.CommonService;
import com.akcord.main.poll.model.PollDto;
import com.akcord.main.poll.service.PollService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/poll")
public class PollController {

   @Autowired
   private PollService pollService;

   @Autowired
   private CommonService commonService;

   @RequestMapping(value = "/list.akcord")
   public ModelAndView polllist(@RequestParam Map<String, String> query, HttpSession session) {
      ModelAndView mav = new ModelAndView();

      List<PollDto> list = pollService.polllist(query);
      UserDto userDto = (UserDto) session.getAttribute("user");
      query.put("type", "poll");

      PageNavigation pageNavigation = commonService.makePageNavigation(query);
      pageNavigation.setRoot("/akcord_project");
      pageNavigation.setNavigator();
      mav.addObject("navigator", pageNavigation);
      mav.addObject("user", userDto);
      mav.addObject("query", query);
      mav.addObject("list", list);
      mav.setViewName("/admin/teacher");

      // 리턴 주소 어떻게 하지 ????
      return mav;
   }

   @RequestMapping(value = "/make.akcord", method = RequestMethod.POST)
   public String pollmake(PollDto pollDto, @RequestParam List<String> answer) {
      int seq = pollService.getNextPollSeq();
      int cnt = pollService.pollmake(pollDto);
      for (int i = 0; i < answer.size() - 1; i++) {
         int text = pollService.pollmakeContent(answer.get(i));
      }
      // 모달 창을 꺼야함!!!
      // 뭘로 리턴할까!!!
      return "redirect:/poll/list.akcord?pg=1&key=&word=&order=";
   }

   @RequestMapping(value = "/modify.akcord")
   public @ResponseBody String pollmodify(@RequestParam("pseq") int seq) {
      int poll_id = seq;
      // 먼저 제목과 날짜 먼저 호출하자
      JSONObject jsonObject = new JSONObject();
      JSONArray jalist = new JSONArray();
      PollDto pollDto = pollService.pollmodify(poll_id); // 투표 정보를 불러온다
      List<String> list = new ArrayList<String>();
      list = pollService.pollgetContent(poll_id); // 투표 본문을 불러온다
      jsonObject.put("Subject", pollDto.getSubject());
      jsonObject.put("StartDate", pollDto.getStartDate());
      jsonObject.put("EndDate", pollDto.getEndDate());
      jsonObject.put("ChartType", pollDto.getChart_type());
      jsonObject.put("poll_id", seq);

      for (int i = 0; i < list.size(); i++) {
         // JSONObject jsontmp = new JSONObject();
         String text = list.get(i);
         // jsontmp.put("list", list.get(i));
         jalist.add(text);
      }
      jsonObject.put("contlist", jalist);
      // 모달 창이 유지되어야 한다!!
      return jsonObject.toJSONString();
   }

   @RequestMapping(value = "/result.akcord")
   public @ResponseBody String pollresult(@RequestParam("pseq") int seq) {
      int poll_id = seq;
      String ChartType="";
      // 먼저 제목과 날짜 먼저 호출하자
      JSONObject jsonObject = new JSONObject();
      JSONArray jarr = new JSONArray();
      List<PollDto> plist = pollService.pollresult(poll_id); // 투표 정보를 불러온다
      if(plist.get(0).getChart_type().equals("1"))
         ChartType="bar";
      else if(plist.get(0).getChart_type().equals("2"))
         ChartType="doughnut";
      else if(plist.get(0).getChart_type().equals("3"))
         ChartType="line";
      else if(plist.get(0).getChart_type().equals("4"))
         ChartType="polarArea";
      jsonObject.put("Subject", plist.get(0).getSubject());
      jsonObject.put("ChartType", ChartType);
      jsonObject.put("poll_id", seq);
      for (PollDto pollDto : plist) {
         JSONObject jsontmp = new JSONObject();
         // String text = plist.get(i);
         jsontmp.put("content", pollDto.getContent());
         jsontmp.put("cnt", pollDto.getCnt());
         // jalist.add(text);
         jarr.add(jsontmp);
      }
      jsonObject.put("pollresult", jarr);
      // 모달 창이 유지되어야 한다!!
      return jsonObject.toJSONString();
   }

   @RequestMapping(value = "/pollupdate.akcord")
   public @ResponseBody String pollupdate(@RequestParam Map<String, String> query, HttpSession session) {
      int pdid = 1;
      JSONObject jsonObject = new JSONObject();
      JSONArray jarr = new JSONArray();
      UserDto userDto = (UserDto) session.getAttribute("user");
      List<PollDto> plist = pollService.mainpollget();
      List<PollDto> puserlist = pollService.removeBtn(); // poll_id,user_id
      for (int i = 0; i < puserlist.size(); i++) {
         if (puserlist.get(i).getUser_id().equals(query.get("user_id"))) {
            pdid = 0;
         } 
      }
      //System.out.println(puserlist.get(0).getUser_id());
      jsonObject.put("Subject", plist.get(0).getSubject());
      jsonObject.put("pdid",pdid);
      for (PollDto pollDto : plist) {
         JSONObject jsontmp = new JSONObject();
         jsontmp.put("poll_id", pollDto.getPoll_id());
         jsontmp.put("content", pollDto.getContent());
         jarr.add(jsontmp);
      }
      jsonObject.put("plist", jarr);
      return jsonObject.toJSONString();
   }

   @RequestMapping("/modifydate.akcord")
   public String pollmodifydate(@RequestParam Map<String, String> map) {
      int cnt = pollService.pollmodifydate(map);
      return "redirect:/poll/list.akcord?pg=1&key=&word=&order=";
   }

   @RequestMapping(value = "/delete.akcord")
   public String pollclose(@RequestParam("pseq") int seq) {
      int poll_id = seq;
      int cnt = pollService.pollclose(poll_id);
      return "redirect:/poll/list.akcord?pg=1&key=&word=&order=";
   }

   @RequestMapping(value = "/dopoll.akcord")
   public ModelAndView dopoll(@RequestParam Map<String, String> query, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String content = query.get("content");
      List<PollDto> plist = pollService.mainpollget();
      UserDto userDto = (UserDto) session.getAttribute("user");
      pollService.pollupdate(query);
      pollService.pollYN(query);
      session.setAttribute("plist", plist);
      session.setAttribute("psubject",plist.get(0).getSubject());      
      session.setAttribute("user", userDto);
      mav.setViewName("/index");

      return mav;

   }

}