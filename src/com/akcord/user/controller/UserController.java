package com.akcord.user.controller;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.user.model.UserDto;
import com.akcord.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/join.akcord", method=RequestMethod.GET)
	public String join(){
		return "/user/join/join";
	}
	
	@RequestMapping(value="/join.akcord", method=RequestMethod.POST)
	public ModelAndView join(UserDto userDto){
		ModelAndView mav = new ModelAndView();
		int cnt = userService.join(userDto);
		mav.addObject("user", userDto);
		mav.setViewName("/join/joinok");
		return mav;
		
	}
	
	@RequestMapping("/idCheck.akcord")
	public @ResponseBody String idCheck(@RequestParam("sid") String sid){

		int cnt = userService.idCheck(sid);
		JSONObject json = new JSONObject(); //{}
		json.put("count", cnt);//{'count' : '1'}
		json.put("sid", sid);//{'count' : '1', 'suser_id' : 'java2'}
//		System.out.println(json.toJSONString());
		return json.toJSONString();
		
	}
	
	@RequestMapping(value="/login.akcord", method=RequestMethod.GET)
	public String login(){
		return "/user/login/login";
	}
	
	@RequestMapping(value= "/login.akcord", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> map, HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/login/loginfail");
		UserDto userDto = userService.login(map);
		if( userDto != null){
			session.setAttribute("user", userDto);
			mav.setViewName("/index");
			//redirect로 해도 상관없음. String으로 리턴을 해서 
			//ModelAndView는 request와 같기때문에 한번 받아오면 그 다음 페이지부터 유지할수 없음.
		}
		return mav;
	}
	
	
	
}
