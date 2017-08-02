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
import com.akcord.in.model.InDto;
import com.akcord.in.service.InService;
import com.akcord.user.model.UserDto;
import com.kitri.board.model.ReboardDto;
import com.kitri.member.model.MemberDto;



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
	@RequestMapping(value="/qna.akcord", method=RequestMethod.GET)
	public ModelAndView answer(){
		ModelAndView mav = new ModelAndView();
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
	public String answer(InDto inDto, HttpSession session){
		System.out.println("여까진 오냐");
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		inDto.setUser_id(userDto.getUser_id());
		if(userDto != null) {
			
			int cnt = inService.answerroom(inDto);
			mav.addObject("inDto", inDto);
		
			
	
		}		return "redirect:/in/list.akcord";
	}
	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session) {
		System.out.println("여기까진 오냐 list");
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		
		List<InDto> inlist = inService.answerlist();
		mav.addObject("inlist", inlist);
		
		mav.setViewName("/user/in/inmain");
		return mav;
	}
	@RequestMapping(value="/qna.html", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam Map<String, String> queryString,
			@RequestParam("seq") int seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		UserDto memberDto = (UserDto) session.getAttribute("user");
		InDto inDto = null;
		if(memberDto != null) {
			inDto = inService.getId(queryString);
			}
		
		
		mav.addObject("article", reboardDto);
		mav.setViewName("view");
		return mav;
	}
	
	
}
