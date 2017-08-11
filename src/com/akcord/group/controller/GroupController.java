package com.akcord.group.controller;

import java.util.Collections;
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
import com.akcord.user.service.UserService;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;

	@Autowired
	private CommonService commonService;
	@Autowired
	private UserService userService;
	@RequestMapping("/make.akcord")
	public String makegroup(GroupRoomDto groupRoomDto, HttpSession session) {
		UserDto user = (UserDto) session.getAttribute("user");
		groupRoomDto.setLeaderId(user.getUser_id());
		int cnt = groupService.createG(groupRoomDto);
	      List<GroupRoomDto> group_list = null;
	      if(user.getType()!=0) { 
	         group_list = userService.group(user.getUser_id()+"");
	         session.setAttribute("group_list", group_list);
	      }
		return "redirect:/group/list.akcord?pg=1&key=&word=&order=&state=100";
	}

	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session, @RequestParam Map<String, String> query) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		query.put("myseq", userDto.getUser_id() + "");
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
		if (query.get("count") != null) {
			mav.addObject("count", query.get("count") + "");
		} else {
			mav.addObject("count", 0);
		}
		if (query.get("state") != null) {
			mav.addObject("state", query.get("state") + "");
		} else {
			mav.addObject("state", 0);
		}

		mav.setViewName("/user/group/grouplist");
		return mav;
	}

	@RequestMapping("/waitinglist.akcord")
	public ModelAndView acceptlist(HttpSession session, @RequestParam Map<String, String> query) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		query.put("userId", user.getUser_id()+"");
		List<GroupRoomDto> waitinglist = groupService.waitinglist(query);
		query.put("type", "groupwait");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();

		mav.addObject("navigator", pageNavigation);
		mav.addObject("waitlist", waitinglist);
		mav.setViewName("/user/group/waitinglist");
		return mav;
	}

	@RequestMapping("/join.akcord")
	public String join(@RequestParam("seq") String seq, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("userId", user.getUser_id() + "");
		int cnt = groupService.joinGroup(map);
		return "redirect:/group/list.akcord?pg=1&key=&word=&order=&state=200";
	}

	@RequestMapping("/cancel.akcord")
	public String cancel(@RequestParam("seq") String seq,  HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UserDto user = (UserDto) session.getAttribute("user");
		map.put("seq", seq);
		map.put("userId", user.getUser_id() + "");
		int cnt = groupService.cancel(map);
		return "redirect:/group/waitinglist.akcord?pg=1";
	}

	@RequestMapping("/accept.akcord")
	public String accept(@RequestParam("seq") String seq,  HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		UserDto user = (UserDto) session.getAttribute("user");
		map.put("seq", seq);
		map.put("userId", user.getUser_id() + "");
		int cnt = groupService.accept(map);
	      List<GroupRoomDto> group_list = null;
	      if(user.getType()!=0) { 
	         group_list = userService.group(user.getUser_id()+"");
	         session.setAttribute("group_list", group_list);
	      }
		return "redirect:/group/waitinglist.akcord?pg=1";
	}
}
