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
	
	@RequestMapping(value="/mypage.akcord", method=RequestMethod.GET)
	public ModelAndView mypage(@RequestParam String id){
		System.out.println("신상털러 와슴메");
		ModelAndView mav = new ModelAndView();
		
		UserDto userDto = myPageService.mypage(id);
		mav.addObject("user",userDto);
		mav.setViewName("/user/mypage/mypage");
		
		return mav;
	}
	@RequestMapping(value="/mypagemodify.akcord", method=RequestMethod.GET)
	public ModelAndView mypagemodify(@RequestParam String id){
		
		ModelAndView mav = new ModelAndView();
		
		UserDto userDto = myPageService.mypage(id);
		mav.addObject("user",userDto);
		mav.setViewName("/user/mypage/mypagemodify");
		
		return mav;
	}
	@RequestMapping(value="/mypagemodify.akcord", method=RequestMethod.POST)
	public ModelAndView mypagemodify(@RequestParam Map<String, String> map){
		System.out.println("신상 wlsWKfh 바꾸러 와슴메");
		ModelAndView mav = new ModelAndView();
		int cnt = myPageService.mypagemodify(map);
		mav.addObject("user", map);
		if (cnt!=0){
			System.out.println("탈탈 털어씀다");
			mav.setViewName("/user/mypage/mypage");
		} else {
			mav.setViewName("/index");
		}

		return mav;

	}
	
	@RequestMapping(value="/myarticle.akcord", method=RequestMethod.GET)
	public ModelAndView myarticle(@RequestParam Map<String,String> query, HttpSession session){
		System.out.println("신상 목록 좀 보러 와슴메");
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		String user_id = userDto.getUser_id() + "";
		
		//1.유저 아이디 가져왔지
		//2. ㅇㅇ 이제 가져온걸로 내 룸에서 검색하자
		//3. 검색 조건은 그룹룸 홈웤에도 있어야한다.
		List<MypageDto> mypageDto = myPageService.myArticleSearch(user_id);
		if(mypageDto!=null){
			System.out.println("제대로 가져왔구먼유");
			for (int i = 0; i < mypageDto.size(); i++) {
				if(mypageDto.get(i).getCategory()!=null){
					if(mypageDto.get(i).getCategory().equals("1")){
						String tmp = "그룹방 공유글";
						mypageDto.get(i).setCategory(tmp);
					} else if(mypageDto.get(i).getCategory().equals("2")){
						String tmp = "지식인";
						mypageDto.get(i).setCategory(tmp);
					} else if(mypageDto.get(i).getCategory().equals("3")){
						String tmp = "지식인 답변";
						mypageDto.get(i).setCategory(tmp);
					} else {
						String tmp = "오류";
						mypageDto.get(i).setCategory(tmp);
					}
				}
			}
		}
		mav.addObject("mypage",mypageDto);
		query.put("type", "myarticle");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		
		mav.setViewName("/user/mypage/myarticle");
		return mav;
	}
	
	@RequestMapping(value="/delete.akcord")
	public String myarticledelete(@RequestParam String category, @RequestParam int seq, @RequestParam int group_id, HttpSession sesstion){
		UserDto userDto = (UserDto) sesstion.getAttribute("user");
		
		if(userDto!=null){
			int cnt = 0;
			if(category.equals("1")){
				cnt = myPageService.myArticleDeleteShare(seq, group_id);
			} else if(category.equals("2")){
				cnt = myPageService.myArticleDeleteQna(seq);
			} else if(category.equals("2")){
				cnt = myPageService.myArticleDeleteReply(seq);
			}
		}
		
		String user_id = "/mypage/myarticle.akcord";
		return user_id;
	}

}
