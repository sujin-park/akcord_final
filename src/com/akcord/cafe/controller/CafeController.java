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
	public ModelAndView myroomlistArticle(@RequestParam("placeY") String[] placeY, @RequestParam("placeX") String[] placeX, @RequestParam("i") int i, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String Y[] = placeY;
		String X[] = placeX;
		//System.out.println(Y[0]);
		//System.out.println(X[0]);
		//System.out.println(placeX);
		mav.addObject("Y", Y[0]);
		mav.addObject("X", X[0]);
		mav.setViewName("/user/studycafe/map");
		return mav;
	}
}