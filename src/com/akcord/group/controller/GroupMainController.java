package com.akcord.group.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupListDto;
import com.akcord.group.service.GroupMainService;

@Controller
@RequestMapping("/groupmain")
public class GroupMainController {

	@Autowired
	private GroupMainService groupMainService;
	
	@RequestMapping("/list.akcord")
	public ModelAndView groupMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/group/list");
		return mav;
	}
	@RequestMapping("/group.akcord")
	public ModelAndView groupList() {
		ModelAndView mav = new ModelAndView();
		String seq = "1";
		List<GroupListDto> glist = groupMainService.gMemberlist(seq);
		mav.addObject("glist", glist);
		mav.setViewName("/user/group/setgroup");
		return mav;
	}
}
