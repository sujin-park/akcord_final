package com.akcord.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupListDto;
import com.akcord.group.service.GroupMainService;
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/groupmain")
public class GroupMainController {

	@Autowired
	private GroupMainService groupMainService;
	
	@RequestMapping("/main.akcord") // 글목록
	public ModelAndView main(@RequestParam("groupId") int groupId){
		ModelAndView mav = new ModelAndView();
		mav.addObject("groupId", groupId);
		mav.setViewName("/user/group/main/groupcalender");
		return mav;
	}
	
	
	@RequestMapping("/list.akcord") // 글목록
	public ModelAndView groupMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/group/main/list");
		return mav;
	}
	
	@RequestMapping("/group.akcord")
	public ModelAndView groupList(@RequestParam Map<String, String> query, HttpSession session) { // 그룹원 관리 
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		int groupId = Integer.parseInt(query.get("groupId"));
		query.put("user_id", user.getUser_id()+"");
		List<GroupListDto> glist = groupMainService.gMemberlist(query);
		mav.addObject("groupId", groupId);
		mav.addObject("glist", glist);
		mav.setViewName("/user/group/main/setting");
		return mav;
	}
	
	@RequestMapping("/reject.akcord") // 대기중인 회원 지우기
	public String delete(@RequestParam Map<String, String> map) {
		int cnt = groupMainService.rejectMember(map);
		String path = "";
		int groupId = Integer.parseInt(map.get("groupId"));
		if (Integer.parseInt(map.get("state")) == 1) {
			path = "redirect:/groupmain/group.akcord?groupId="+groupId+"&pg=1&key=&word=&order=";
		} else {
			path = "redirect:/groupmain/group.akcord?groupId="+groupId+"&pg=1&key=&word=&order=";
		}
		return path;
	}
	
	@RequestMapping("/accept.akcord") // 회원 승인해주기
	public String accept(@RequestParam Map<String, String> map) {
		int cnt = groupMainService.acceptMember(map);
		int groupId= Integer.parseInt(map.get("groupId"));
		return "redirect:/groupmain/group.akcord?groupId="+groupId+"&pg=1&key=&word=&order=";
	}
	
	@RequestMapping("/search.akcord")
	public ModelAndView search(@RequestParam("sid") String sid) {
		ModelAndView mav = new ModelAndView();
		List<GroupListDto> searchlist = groupMainService.searchlist(sid);
		mav.addObject("slist", searchlist);
		mav.setViewName("/user/group/main/plusmem");
		return mav;
	}
	
	@RequestMapping("/invite.akcord")
	public String invite(@RequestParam Map<String, String> map){
		ModelAndView mav = new ModelAndView();
		int cnt = groupMainService.invite(map);
		int groupId = Integer.parseInt(map.get("groupId"));
		return "redirect:/groupmain/group.akcord?groupId="+groupId+"&pg=1&key=&word=&order=";
	}
	
	@RequestMapping("/grouplist.akcord")
	public ModelAndView grouplist(@RequestParam("groupId") int groupId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("seq", user.getUser_id()+"");
		map.put("groupId", groupId+"");
		List<GroupListDto> grouplist = groupMainService.originlist(map);
		mav.addObject("oglist", grouplist);
		mav.setViewName("/user/group/main/origingroup");
		return mav;
	}
}