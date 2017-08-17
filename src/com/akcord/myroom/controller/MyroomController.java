package com.akcord.myroom.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.service.CommonService;
import com.akcord.myroom.model.MyroomDto;
import com.akcord.myroom.model.MyroomNextDto;
import com.akcord.myroom.service.MyroomService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/myroom")
public class MyroomController {

	@Autowired
	private MyroomService myroomService;
	
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/myroomlist.akcord")
	public ModelAndView myroomlistArticle(@RequestParam Map<String, String> query, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		query.put("user_id", user_id);
		String ch = query.get("ch");
		String myroomId = query.get("myroomId");
		
		if(myroomId == null || myroomId == "") { //사이드바에서 개인방 선택
			List<MyroomDto> sectionList = myroomService.sectionList(user_id);
			mav.addObject("sectionList", sectionList);
			List<MyroomNextDto> myroomList = myroomService.myroomList(query);
			mav.addObject("myroomList", myroomList);
		} else { //section이름 선택
			List<MyroomDto> sectionList = myroomService.sectionList(user_id);
			mav.addObject("sectionList", sectionList);
			List<MyroomNextDto> choiceSectionList = myroomService.choiceSectionList(query);
			mav.addObject("myroomList", choiceSectionList);
		}
		query.put("type", "myroom");
		query.put("user_id", user_id);
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		mav.addObject("query", query);
		mav.setViewName("/user/myroom/myroomlist");
		return mav;
	}
	
	@RequestMapping("/searchlist.akcord")
	public ModelAndView searchlistArticle(@RequestParam Map<String, String> query, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		query.put("user_id", user_id);
		
		List<MyroomDto> sectionList = myroomService.sectionList(user_id);
		mav.addObject("sectionList", sectionList);
		List<MyroomNextDto> searchList = myroomService.searchList(query);
		mav.addObject("myroomList", searchList);
		
		query.put("type", "myroom");
		query.put("user_id", user_id);
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		query.put("major_id", query.get("key"));
		mav.addObject("query", query);
		mav.setViewName("/user/myroom/myroomlist");
		return mav;
	}
	
	@RequestMapping(value="/write.akcord", method=RequestMethod.GET)
	public ModelAndView myroomWriteArticle(@RequestParam Map<String, String> query, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		String myroomId = query.get("myroomId");
		String num = query.get("num");
		String myroomNextId = query.get("myroomNextId");
		
		List<MyroomDto> sectionList = myroomService.sectionList(user_id);
		mav.addObject("sectionList", sectionList);
		List<GroupRoomDto> list = myroomService.groupNameList(user_id);
		mav.addObject("groupNameList", list);
		if(num.equals("200")) {
			MyroomNextDto myroomNextDto = myroomService.selectArticle(myroomNextId);
			mav.addObject("myroomNextDto", myroomNextDto);
		}
		mav.addObject("query", query);
		mav.addObject("myroomId", myroomId);
		mav.addObject("myroomNextId", myroomNextId);
		mav.setViewName("/user/myroom/myroom");
		return mav;
	}
	
	@RequestMapping(value="/write.akcord", method=RequestMethod.POST)
	public ModelAndView myroomWritePostArticle(@RequestParam Map<String,String> query, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String num = query.get("num");
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		
		List<MyroomDto> sectionList = myroomService.sectionList(user_id);
		mav.addObject("sectionList", sectionList);
		List<GroupRoomDto> list = myroomService.groupNameList(user_id);
		mav.addObject("groupNameList", list);
		
		MyroomNextDto myroomNextDto = new MyroomNextDto();
		myroomNextDto.setUser_id(Integer.parseInt(user_id));
		if(query.get("myroomId") != null && query.get("myroomId") != "")
			myroomNextDto.setMyroomId(Integer.parseInt(query.get("myroomId")));
		else
			myroomNextDto.setMyroomId(Integer.parseInt(query.get("myroomId1")));
		myroomNextDto.setSubject(query.get("subject"));
		myroomNextDto.setContent(query.get("content"));
		myroomNextDto.setIsShare(Integer.parseInt(query.get("isShare")));
		
		if(Integer.parseInt(query.get("groupId")) != 0) {
			myroomNextDto.setGroupId(Integer.parseInt(query.get("groupId")));
			// 여기서 일정 가져오기 
			String scheduleId = myroomService.getScheduleId(Integer.parseInt(query.get("groupId")));
			if(scheduleId != null) {
				myroomNextDto.setScheduleId(scheduleId);
			}
		}
		if(num.equals("100")) {
			myroomService.insertArticle(myroomNextDto);
			int myroomNextId = myroomNextDto.getMyroomNextId();
			mav.addObject("myroomId", query.get("myroomId"));
			mav.addObject("myroomNextId", myroomNextId);
		} else {
			myroomNextDto.setMyroomNextId(Integer.parseInt(query.get("myroomNextId1")));
			myroomService.updateAtricle(myroomNextDto);
			mav.addObject("myroomId", query.get("myroomId1"));
			mav.addObject("myroomNextId", myroomNextDto.getMyroomNextId());
		}
		query.put("num", "200");
		mav.addObject("query", query);
		mav.addObject("myroomNextDto", query);
		mav.setViewName("/user/myroom/myroom");
		return mav;
	}
	
	@RequestMapping("/delete.akcord")
	public String myroomDeleteArticle(@RequestParam Map<String, String> query, HttpSession session) {
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		String myroomNextId = query.get("myroomNextId");
		
		myroomService.deleteAtricle(myroomNextId);
		return "redirect:/myroom/myroomlist.akcord?user_id=" + user_id + "&ch=" + query.get("ch") + "&myroomId=" + query.get("myroomId") + "&pg=" + query.get("pg");
	}
	
	@RequestMapping("/selectC.akcord")
	public @ResponseBody String selectCategory(@RequestParam("user_id") String user_id) {
		List<MyroomDto> sectionList = myroomService.sectionList(user_id);
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(MyroomDto myroomDto : sectionList) {
			JSONObject jsonaddr = new JSONObject();
			jsonaddr.put("subject", myroomDto.getSubject());
			jsonaddr.put("myroomId",myroomDto.getMyroomId());
			jarr.add(jsonaddr);
		}
		json.put("sectionList", jarr);
		return json.toJSONString();
	}
	
	@RequestMapping("/addC.akcord")
	public @ResponseBody String createCategory(MyroomDto myroomDto, HttpSession session) {
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		myroomDto.setUser_id(Integer.parseInt(user_id));
		myroomService.createCategory(myroomDto);
		int myroomId = myroomDto.getMyroomId();
		JSONObject json = new JSONObject();
		json.put("myroomId", myroomId);
		json.put("subject", myroomDto.getSubject());
		return json.toJSONString();
	}
	
	/*@RequestMapping("/updateC.akcord")
	public @ResponseBody String updateCategory(MyroomDto myroomDto) {
		myroomService.updateCategory(myroomDto);
		JSONObject json = new JSONObject();
		json.put("myroomId", myroomDto.getMyroomId());
		json.put("subject", myroomDto.getSubject());
		return json.toJSONString();
	}*/
	
	@RequestMapping("/deleteC.akcord")
	public @ResponseBody String deleteCategory(@RequestParam Map<String, String> query) {
		String myroomId = query.get("myroomId");
		myroomService.deleteCategory(myroomId);
		JSONObject json = new JSONObject();
		return json.toJSONString();
	}
}
