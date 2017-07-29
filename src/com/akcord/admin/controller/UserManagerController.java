package com.akcord.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.service.UserManagerService;
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/usermanager")
public class UserManagerController {
	
	@Autowired
	private UserManagerService userManagerService;
	
	@RequestMapping("/mvmemberlist.akcord")
	public ModelAndView mvuserList(){
		ModelAndView mav = new ModelAndView();
		List<UserDto> list = userManagerService.getUserList();
		mav.addObject("userList",list);
		mav.setViewName("/admin/memberlist");
		return mav;
	}

}
