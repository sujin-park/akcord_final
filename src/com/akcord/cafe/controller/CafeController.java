package com.akcord.cafe.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.cafe.service.CafeService;

@Controller
@RequestMapping("/cafe")
public class CafeController {

//	@Autowired
//	private CafeService cafeService;
	
	@RequestMapping("/studycafe.akcord")
	public ModelAndView studyCafe(@RequestParam Map<String, String> query) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/studycafe/studycafe");
		return mav;
	}
	
	@RequestMapping("/map.akcord")
	public ModelAndView myroomlistArticle(@RequestParam("latitude") String latitude, @RequestParam("longitude") String longitude, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(Y[0]);
		//System.out.println(X[0]);
		//System.out.println(placeX);
		mav.addObject("X", latitude);
		mav.addObject("Y", longitude);
		mav.setViewName("/user/studycafe/map");
		return mav;
	}
}