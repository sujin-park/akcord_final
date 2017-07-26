package com.akcord.group.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/waitinglist.akcord")
	public ModelAndView acceptlist(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/group/waitinglist");
		return mav;
	}
	
	@RequestMapping("/make.akcord")
	public ModelAndView makegroup(@RequestParam Map<String, String> map){
		ModelAndView mav = new ModelAndView();
		GroupRoomDto groupRoomDto = new GroupRoomDto();
		groupRoomDto.setMajorId(Integer.parseInt(map.get("majorId")));
		groupRoomDto.setGroupName(map.get("groupName"));
		groupRoomDto.setContent(map.get("content"));
		groupRoomDto.setLeaderId(1);
		groupRoomDto.setgCount(Integer.parseInt(map.get("gCount")));
		int cnt = groupService.createG(groupRoomDto);
		
		return mav;
	}
	
	@RequestMapping("/list.akcord")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<GroupRoomDto> list = groupService.grouplist();
		System.out.println(list.size() + "group controller");
		mav.addObject("grouplist", list);
		mav.setViewName("/user/group/grouplist");
		return mav;
	}
}
