package com.akcord.group.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupListDto;
import com.akcord.group.service.GroupMainService;

@Controller
@RequestMapping("/groupmain")
public class GroupMainController {

	@Autowired
	private GroupMainService groupMainService;
	
	@RequestMapping("/list.akcord") // 글목록
	public ModelAndView groupMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/group/list");
		return mav;
	}
	
	@RequestMapping("/group.akcord")
	public ModelAndView groupList() { // 그룹원 관리 
		ModelAndView mav = new ModelAndView();
		String seq = "1";
		List<GroupListDto> glist = groupMainService.gMemberlist(seq);
		mav.addObject("glist", glist);
		mav.setViewName("/user/group/setgroup");
		return mav;
	}
	
	@RequestMapping("/reject.akcord") // 대기중인 회원 지우기
	public String delete(@RequestParam("seq") String seq) {
		int cnt = groupMainService.rejectMember(seq);
		return "redirect:/groupmain/group.akcord";
	}
	
	
	@RequestMapping("/accept.akcord") // 회원 승인해주기
	public String accept(@RequestParam("seq") String seq) {
		int cnt = groupMainService.acceptMember(seq);
		return "redirect:/groupmain/group.akcord";
	}
	
	@RequestMapping("/search.akcord")
	public ModelAndView search(@RequestParam("sid") String sid) {
		ModelAndView mav = new ModelAndView();
		List<GroupListDto> searchlist = groupMainService.searchlist(sid);
		mav.addObject("slist", searchlist);
		mav.setViewName("/user/group/plusmem");
		return mav;
	}
	@RequestMapping("/invite.akcord")
	public String invite(@RequestParam Map<String, String> map){
		ModelAndView mav = new ModelAndView();
		int cnt = groupMainService.invite(map);
		return "redirect:/groupmain/group.akcord";
	}
}