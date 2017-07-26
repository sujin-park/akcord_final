package com.akcord.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.model.NoticeDto;
import com.akcord.admin.service.NoticeService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	//@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.GET)
	public String noticeWrite(){
	
		return "/admin/noticewrite";
	}
	
	
	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeDto noticeDto){
		ModelAndView mav = new ModelAndView();
		int cnt = noticeService.noticeWrite(noticeDto);
		mav.addObject("notice", noticeDto);
		mav.setViewName("/admin/notice");
		return mav;
	}
	
	
}
