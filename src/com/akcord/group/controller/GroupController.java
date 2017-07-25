package com.akcord.group.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.service.GroupService;

@Controller
@RequestMapping("/group")
public class GroupController {
	
	
	@RequestMapping("/list.akcord")
	public ModelAndView acceptlist(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/group/waitinglist");
		return mav;
	}
	
	@RequestMapping("/make.akcord")
	public ModelAndView makegroup(Map<String, String> map){
		ModelAndView mav = new ModelAndView();
		GroupRoomDto groupRoomDto = new GroupRoomDto();
		groupRoomDto.setMajorId(1);
		groupRoomDto.setGroupName(map.get("groupName"));
		groupRoomDto.setComment(map.get("comment"));
		groupRoomDto.setLeaderId(1);
		groupRoomDto.setCount(Integer.parseInt(map.get("count")));
		
		//System.out.println("그룹방 개설하기이");
		return mav;
	}
}
