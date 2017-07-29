package com.akcord.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;
import com.akcord.group.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/make.akcord")
	public String makegroup(GroupRoomDto groupRoomDto, HttpSession session){
		groupRoomDto.setLeaderId(1);
		int cnt = groupService.createG(groupRoomDto);
		return "redirect:/group/list.akcord";
	}
	
	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String myseq = "1";
		List<GroupRoomDto> list = groupService.grouplist(myseq);
		List<MajorDto> majorlist = groupService.majorlist();
		mav.addObject("mList", majorlist);
		mav.addObject("grouplist", list);
		mav.setViewName("/user/group/grouplist");
		return mav;
	}
	
	@RequestMapping("/waitinglist.akcord")
	public ModelAndView acceptlist(){
		ModelAndView mav = new ModelAndView();
		//mav.addObject("", waitinglist);
		//요청일, 전공, 그룹방명, 그룹방내용, 리더
		int seq = 1; // session에서 내 시퀀스 가져와야함
		List<GroupRoomDto> waitinglist = groupService.waitinglist(seq);
		mav.addObject("waitlist", waitinglist);
		mav.setViewName("/user/group/waitinglist");
		return mav;
	}
	@RequestMapping("/join.akcord")
	public String join(@RequestParam("seq") String seq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("userId", "1"); // 사용자 아이디는 세션에서 가져오기
		int cnt = groupService.joinGroup(map);
		return "redirect:/group/list.akcord";
	}
	@RequestMapping("/cancel.akcord")
	public String cancel(@RequestParam("seq") String seq) {
		ModelAndView mav = new ModelAndView();
		int cnt = groupService.cancel(seq);
		return "redirect:/group/waitinglist.akcord";
	}
}
