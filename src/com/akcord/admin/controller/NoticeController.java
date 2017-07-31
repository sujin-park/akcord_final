package com.akcord.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.model.NoticeDto;
import com.akcord.admin.service.NoticeService;
import com.akcord.admin.service.UserManagerService;
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/mvnoticelist.akcord")
	public ModelAndView mvnoticelist(HttpSession session){
		ModelAndView mav = new ModelAndView();
		List<NoticeDto> list = noticeService.getNoticeList();
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
	
	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.GET)
	public String noticeWrite(){
	
		return "/admin/noticewrite";
	}
	@RequestMapping(value="/noticedelete.akcord",method=RequestMethod.GET)
	public ModelAndView noticedelete(@RequestParam("str") String str){
		ModelAndView mav = new ModelAndView();
		String checkStr[] = str.split(",");
		for (int i = 0; i < checkStr.length; i++) {
			noticeService.delete(checkStr[i]);
		}
		List<NoticeDto> list = noticeService.getNoticeList();
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
	@RequestMapping(value="/noticepublic.akcord",method=RequestMethod.GET)
	public ModelAndView noticepublic(@RequestParam("str") String str){
		ModelAndView mav = new ModelAndView();
		String checkStr[] = str.split(",");
		for (int i = 0; i < checkStr.length; i++) {
			noticeService.noticePublic(checkStr[i]);
		}
		List<NoticeDto> list = noticeService.getNoticeList();
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
	@RequestMapping(value="/noticeorder.akcord",method=RequestMethod.GET)
	public ModelAndView noticeOrder(@RequestParam("str") String str){
		ModelAndView mav = new ModelAndView();
		System.out.println(str);
		List<NoticeDto> list = noticeService.getNoticeOrder(str);
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeDto noticeDto){
		ModelAndView mav = new ModelAndView();
		int cnt = noticeService.noticeWrite(noticeDto);
		mav.addObject("notice", noticeDto);		
		List<NoticeDto> list = noticeService.getNoticeList();
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
	@RequestMapping(value="/noticemodify.akcord",method=RequestMethod.GET)
	public ModelAndView noticemodify(@RequestParam("nid") String nid){
		ModelAndView mav = new ModelAndView();
		NoticeDto noticeDto = noticeService.getNotice(nid);
		mav.addObject("notice",noticeDto);
		mav.setViewName("/admin/noticemodify");
		return mav;
	}
	@RequestMapping(value="/noticemodify.akcord",method=RequestMethod.POST)
	public ModelAndView noticemodify(NoticeDto noticeDto){
		ModelAndView mav = new ModelAndView();
		int cnt = noticeService.modify(noticeDto);
		List<NoticeDto> list = noticeService.getNoticeList();
		mav.addObject("noticeList",list);
		mav.setViewName("/admin/notice");
		return mav;
	}
		
}
