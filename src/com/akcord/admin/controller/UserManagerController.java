package com.akcord.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.admin.model.NoticeDto;
import com.akcord.admin.model.UserManageDto;
import com.akcord.admin.service.UserManagerService;
import com.akcord.group.service.CommonService;
import com.akcord.user.model.MajorDto;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/usermanager")
public class UserManagerController {
	
	@Autowired
	private UserManagerService userManagerService;
	@Autowired
	private CommonService commonService;
	
	@RequestMapping("/mvmemberlist.akcord")
	public ModelAndView mvuserList(@RequestParam Map<String,String> query){
		ModelAndView mav = new ModelAndView();
		query.put("type", "usermanage");
		List<UserManageDto> list = userManagerService.getUserList(query);
		List<MajorDto> mlist = userManagerService.getMajor();
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		mav.addObject("majorList",mlist);
		mav.addObject("userList",list);
		mav.addObject("query", query);
		mav.setViewName("/admin/memberlist");
		return mav;
	}

	
	@RequestMapping("/blackuserReg.akcord")
	public ModelAndView blackuserReg(@RequestParam("str") String str,@RequestParam Map<String,String> query){
	      ModelAndView mav = new ModelAndView();
	      int cnt= userManagerService.blackuserReg(str);
	      List<UserManageDto> list = userManagerService.getUserList(query);
	      mav.addObject("userList",list);
	      mav.setViewName("/admin/memberlist");
	      return mav;
	 }
	
	@RequestMapping("/blacklist.akcord")
	public ModelAndView getblackList(@RequestParam Map<String,String> query){
		ModelAndView mav = new ModelAndView();
		query.put("type", "blackusermanage");
		List<UserManageDto> list = userManagerService.getBlackUserList(query);
		List<MajorDto> mlist = userManagerService.getMajor();
		
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		
		mav.addObject("majorList",mlist);
		mav.addObject("blackuserList",list);
		mav.addObject("query", query);

		mav.setViewName("/admin/blackmemberlist");
		return mav;
	}
	
	@RequestMapping("/majorPlus.akcord")
	public String majorPlus(@RequestParam("mname") String mname){
		int cnt= userManagerService.majorPlus(mname);
		return "redirect:/usermanager/mvmemberlist.akcord?key=&word=&pg=1";
	}
	
/*	@RequestMapping(value="/memberOrder.akcord",method=RequestMethod.GET)
	public ModelAndView memberOrder(@RequestParam Map<String,String> str,@RequestParam("st") String st){
		ModelAndView mav = new ModelAndView();
		List<UserManageDto> list = userManagerService.getMemberOrder(str);
		if(st.equals("1")){
			mav.addObject("userList",list);
			mav.setViewName("/admin/memberlist");
			System.out.println("회원목록찍기");
		}if(st.equals("2")){
			mav.addObject("blackuserlist",list);
			mav.setViewName("/admin/blackmemberlist");
			System.out.println("블랙회원목록찍기");
		}
		return mav;
	}	*/
	@RequestMapping("/blackuserOut.akcord")
	   public String blackuserOut(@RequestParam("user_id") String user_id){
	      userManagerService.bUserOut(user_id);
	      return "redirect:/usermanager/mvmemberlist.akcord?key=&word=&pg=1";
	 }
	
}
