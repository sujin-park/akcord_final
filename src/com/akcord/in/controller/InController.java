package com.akcord.in.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;
import com.akcord.group.service.GroupService;
import com.akcord.in.model.InDto;
import com.akcord.in.service.InService;
import com.akcord.user.model.UserDto;




@Controller

@RequestMapping("/in")
public class InController {
   @Autowired
   private InService inService;
   
   @RequestMapping(value="/answer.akcord", method=RequestMethod.GET)
   public ModelAndView qna(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/user/in/answer");
      return mav;
   }
   @RequestMapping(value="/qnaview.akcord", method=RequestMethod.GET)
   public ModelAndView list(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id){
      ModelAndView mav = new ModelAndView();
      InDto inDto = null;
      inDto = inService.getAnswer(qna_id);
      mav.addObject("qna_id", inDto);
      mav.setViewName("/user/in/qna");
      return mav;
   } //링크페이지
   
   @RequestMapping(value="/questionview.akcord", method=RequestMethod.POST)
   public ModelAndView questionview(@RequestParam("qna_id") int qna_id){
	   System.out.println("qna여기까진 오냐 list");
      ModelAndView mav = new ModelAndView();
      InDto inDto = null;
      inDto = inService.getAnswer(qna_id);
      mav.addObject("qna_id", inDto);
      mav.setViewName("/user/in/qna");
      return mav;
   }

   @RequestMapping(value="/question.akcord", method=RequestMethod.GET)
   public ModelAndView question(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/user/in/question");
      return mav;
   }
   

   @RequestMapping(value="/inmain.akcord", method=RequestMethod.GET)
   public ModelAndView inmain(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/user/in/inmain");
      return mav;
   }
   @RequestMapping(value="/inmain.akcord", method=RequestMethod.POST) 
   public String answer(InDto inDto, HttpSession session){//여기서는 리스트를 불러온다.
      
      ModelAndView mav = new ModelAndView();
      UserDto userDto = (UserDto) session.getAttribute("user");

      int major_id = userDto.getMajor_id();
      inDto.setUser_id(userDto.getUser_id());
      if(userDto != null) {
    	  
         int cnt = inService.answerroom(inDto);
         mav.addObject("inDto", inDto);
               
   
      }      return "redirect:/in/list.akcord?major_id="+ major_id; //밑에 메소드로가	 
   }

   @RequestMapping("/list.akcord")
   public ModelAndView list(HttpSession session, @RequestParam Map <String, String> queryString, @RequestParam("major_id") String major_id) {
	   System.out.println("리스트까지 오남");
      ModelAndView mav = new ModelAndView();
      UserDto user = (UserDto) session.getAttribute("user");
      List<InDto> inlist = inService.answerlist(queryString);
      List<MajorDto> majorlist = inService.majorlist();
      queryString.put("major_id", major_id);
      mav.addObject("majorlist", majorlist);
      mav.addObject("inlist", inlist);
      
      mav.setViewName("/user/in/inmain"); //받아온걸 페이지로 준다.
      return mav;
   }

   
}