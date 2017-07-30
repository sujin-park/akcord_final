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
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/make.akcord")
	public String makegroup(GroupRoomDto groupRoomDto, HttpSession session){
		UserDto user = (UserDto) session.getAttribute("user");
		groupRoomDto.setLeaderId(user.getUser_id());
		int cnt = groupService.createG(groupRoomDto);
		return "redirect:/group/list.akcord";
	}
	
	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		List<GroupRoomDto> list = groupService.grouplist(user.getUser_id()+"");
		List<MajorDto> majorlist = groupService.majorlist();
		mav.addObject("mList", majorlist);
		mav.addObject("grouplist", list);
		mav.setViewName("/user/group/grouplist");
		return mav;
	}
	
	@RequestMapping("/waitinglist.akcord")
	public ModelAndView acceptlist(HttpSession session){
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		List<GroupRoomDto> waitinglist = groupService.waitinglist(user.getUser_id());
		mav.addObject("waitlist", waitinglist);
		mav.setViewName("/user/group/waitinglist");
		return mav;
	}
	@RequestMapping("/join.akcord")
	public String join(@RequestParam("seq") String seq, HttpSession session){
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("userId", user.getUser_id()+"");
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
