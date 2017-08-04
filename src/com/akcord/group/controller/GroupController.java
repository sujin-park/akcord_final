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
import com.akcord.group.service.CommonService;
import com.akcord.group.service.GroupService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/make.akcord")
	public String makegroup(GroupRoomDto groupRoomDto, HttpSession session){
		UserDto user = (UserDto) session.getAttribute("user");
		groupRoomDto.setLeaderId(user.getUser_id());
		
		System.out.println(user.getUser_id() + "유저 아이디");
		int cnt = groupService.createG(groupRoomDto);
		return "redirect:/group/list.akcord?pg=1&key=&word=&order=";
	}
	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session, @RequestParam Map<String,String> query) {
		ModelAndView mav = new ModelAndView();
		
		UserDto userDto = (UserDto) session.getAttribute("user");
		query.put("myseq", userDto.getUser_id()+"");
		List<GroupRoomDto> list = groupService.grouplist(query);
		List<MajorDto> majorlist = groupService.majorlist();
		query.put("type", "group");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		mav.addObject("mList", majorlist);
		mav.addObject("grouplist", list);
		mav.addObject("query", query);
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
		return "redirect:/group/list.akcord?pg=1&key=&word=&order=";
	}
	@RequestMapping("/cancel.akcord")
	public String cancel(@RequestParam("seq") String seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		UserDto user = (UserDto) session.getAttribute("user");
		map.put("seq", seq);
		map.put("userId", user.getUser_id()+"");
		int cnt = groupService.cancel(map);
		return "redirect:/group/waitinglist.akcord";
	}
	
	@RequestMapping("/accept.akcord")
	public String accept(@RequestParam("seq") String seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String,String> map = new HashMap<String,String>();
		UserDto user = (UserDto) session.getAttribute("user");
		map.put("seq", seq);
		map.put("userId", user.getUser_id()+"");
		int cnt = groupService.accept(map);
		return "redirect:/group/waitinglist.akcord";
	}
}
