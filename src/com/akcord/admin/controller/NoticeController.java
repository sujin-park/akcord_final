package com.akcord.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.model.NoticeDto;
import com.akcord.admin.model.UserManageDto;
import com.akcord.admin.service.NoticeService;
import com.akcord.admin.service.UserManagerService;
import com.akcord.group.service.CommonService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/mvnoticelist.akcord")
	public ModelAndView mvnoticelist(HttpSession session,@RequestParam Map<String,String> query){
		ModelAndView mav = new ModelAndView();
		List<NoticeDto> list = noticeService.getNoticeList(query);
		UserDto userDto = (UserDto) session.getAttribute("user");
		query.put("type", "notice");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		mav.addObject("user",userDto);
		mav.addObject("noticeList",list);
		mav.addObject("query", query);
		mav.setViewName("/admin/notice");
		return mav;
	}
	
	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.GET)
	public String noticeWrite(){																					
		return "/admin/noticewrite";
	}
	@RequestMapping(value="/noticedelete.akcord",method=RequestMethod.GET)
	public String noticedelete(@RequestParam("str") String str){
	String checkStr[] = str.split(",");
		for (int i = 0; i < checkStr.length; i++) {
			noticeService.delete(checkStr[i]);
		}
		return "redirect:/notice/mvnoticelist.akcord?word=&pg=1";
	}
	@RequestMapping(value="/noticepublic.akcord",method=RequestMethod.GET)
	public String noticepublic(@RequestParam("str") String str){
		String checkStr[] = str.split(",");
		for (int i = 0; i < checkStr.length; i++) {
			noticeService.noticePublic(checkStr[i]);
		}
		return "redirect:/notice/mvnoticelist.akcord?word=&pg=1";
	}

	@RequestMapping(value="/noticewrite.akcord",method=RequestMethod.POST)
	public String noticeWrite(NoticeDto noticeDto){
		int cnt = noticeService.noticeWrite(noticeDto);
		return "redirect:/notice/mvnoticelist.akcord?word=&pg=1";
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
	public String noticemodify(NoticeDto noticeDto){
		int cnt = noticeService.modify(noticeDto);
		return "redirect:/notice/mvnoticelist.akcor?word=&pg=1";
	}
		
}
