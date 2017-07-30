package com.akcord.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.service.UserManagerService;
import com.akcord.user.model.MajorDto;
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
		List<MajorDto> mlist = userManagerService.getMajor();
		mav.addObject("userList",list);
		mav.addObject("majorList",mlist);
		mav.setViewName("/admin/memberlist");
		return mav;
	}
	
	@RequestMapping("/blackuserReg.akcord")
	public ModelAndView blackuserReg(@RequestParam("str") String str){
		ModelAndView mav = new ModelAndView();
		int cnt= userManagerService.blackuserReg(str);
		List<UserDto> list = userManagerService.getUserList();
		mav.addObject("userList",list);
		mav.setViewName("/admin/memberlist");
		return mav;
	}
	@RequestMapping("/mayjorPlus.akcord")
	public ModelAndView majorPlus(@RequestParam("mname") String mname){
		ModelAndView mav = new ModelAndView();
		int cnt= userManagerService.majorPlus(mname);
		List<UserDto> list = userManagerService.getUserList();
		List<MajorDto> mlist = userManagerService.getMajor();
		mav.addObject("userList",list);
		mav.addObject("majorList",mlist);
		mav.setViewName("/admin/memberlist");
		return mav;
	}
}
