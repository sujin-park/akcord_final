package com.akcord.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.alarm.service.AlarmService;
import com.akcord.group.service.CommonService;
import com.akcord.mypage.model.MypageDto;
import com.akcord.mypage.service.MyPageService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private AlarmService alarmService;

	@RequestMapping(value = "/mypage.akcord", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		UserDto userDto2 = myPageService.mypage(user_id);
		int check = alarmService.alarmcheck(user_id);
		int id = userDto2.getUser_id();
		mav.addObject("user", userDto2);
		// 이 경우는 알람 on/off DB에 유저 아이디가 등록 되어있다는 의미입니다. 즉, 알람이 off 되어 있습니다.
		mav.addObject("alarm", check);
		mav.setViewName("/user/mypage/mypage");
		return mav;
	}

	@RequestMapping(value = "/mypagemodify.akcord", method = RequestMethod.GET)
	public ModelAndView mypagemodify(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto1 = (UserDto) session.getAttribute("user");
		String id = userDto1.getId();
		UserDto userDto = myPageService.mypage(id);
		mav.addObject("user", userDto);
		mav.setViewName("/user/mypage/mypagemodify");

		return mav;
	}

	@RequestMapping(value = "/mypagemodify.akcord", method = RequestMethod.POST)
	public ModelAndView mypagemodify(@RequestParam Map<String, String> map) {

		ModelAndView mav = new ModelAndView();
		int cnt = myPageService.mypagemodify(map);
		mav.addObject("user", map);
		if (cnt != 0) {
			mav.setViewName("/user/mypage/mypage");
		} else {
			mav.setViewName("/index");
		}
		return mav;
	}

	@RequestMapping(value = "/myarticle.akcord", method = RequestMethod.GET)
	public ModelAndView myarticle(@RequestParam Map<String, String> query, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";

		List<MypageDto> mypageDto = myPageService.myArticleSearch(user_id);
		if (mypageDto != null) {

			for (int i = 0; i < mypageDto.size(); i++) {
				if (mypageDto.get(i).getCategory() != null) {
					if (mypageDto.get(i).getCategory().equals("1")) {
						String myroom_next_id = mypageDto.get(i).getSeq() + "";
						String gname = myPageService.getgroupname(myroom_next_id);
						String tmp = "그룹 공유글(" + gname + ")";
						mypageDto.get(i).setCategory(tmp);
					} else if (mypageDto.get(i).getCategory().equals("2")) {
						String tmp = "레코더";
						mypageDto.get(i).setCategory(tmp);
					} else if (mypageDto.get(i).getCategory().equals("3")) {
						String tmp = "레코더 답글";
						mypageDto.get(i).setCategory(tmp);
					}
				}
				if (mypageDto.get(i).getCategory() == null) {
					String tmp = "오류";
					mypageDto.get(i).setCategory(tmp);
				}
			}
		}
		mav.addObject("mypage", mypageDto);
		// query.put("type", "myarticle");
		// PageNavigation pageNavigation =
		// commonService.makePageNavigation(query);
		// pageNavigation.setRoot("/akcord_project");
		// pageNavigation.setNavigator();
		// mav.addObject("navigator", pageNavigation);

		mav.setViewName("/user/mypage/myarticle");
		return mav;

	}

	@RequestMapping(value = "/delete.akcord")
	public String myarticledelete(@RequestParam String category, @RequestParam int seq, HttpSession sesstion) {
		UserDto userDto = (UserDto) sesstion.getAttribute("user");

		if (userDto != null) {

			int cnt = 0;
			if (category.substring(0, 2).equals("그룹")) {
				cnt = myPageService.myArticleDeleteShare(seq);
			} else if (category.equals("레코더")) {
				int check = myPageService.searchChile(seq);
				if (check != 0) {
					myPageService.myArticleDeletechile(seq);
				}
				cnt = myPageService.myArticleDeleteQna(seq);
			} else if (category.equals("레코더 답글")) {
				cnt = myPageService.myArticleDeleteReply(seq);
			} else {
			}

		}

		String user_id = "redirect:/mypage/myarticle.akcord";
		return user_id;
	}

}