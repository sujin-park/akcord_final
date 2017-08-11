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
   public ModelAndView mypage(@RequestParam String id, HttpSession session){

      ModelAndView mav = new ModelAndView();
      UserDto userDto = (UserDto) session.getAttribute("user");
      String user_id = userDto.getUser_id()+"";
      UserDto userDto2 = myPageService.mypage(user_id);
      System.out.println("전번"+userDto.getTel1()+userDto2.getTel2());
      System.out.println("주소"+userDto2.getAddr1());
      mav.addObject("user",userDto2);
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

      ModelAndView mav = new ModelAndView();
      int cnt = myPageService.mypagemodify(map);
      mav.addObject("user", map);
      if (cnt!=0){

         mav.setViewName("/user/mypage/mypage");
      } else {
         mav.setViewName("/index");
      }

      return mav;

   }
   
   @RequestMapping(value="/myarticle.akcord", method=RequestMethod.GET)
   public ModelAndView myarticle(@RequestParam Map<String,String> query, HttpSession session){

      ModelAndView mav = new ModelAndView();
      UserDto userDto = (UserDto) session.getAttribute("user");
      String user_id = userDto.getUser_id() + "";
      
      List<MypageDto> mypageDto = myPageService.myArticleSearch(user_id);
      if(mypageDto!=null){

         for (int i = 0; i < mypageDto.size(); i++) {
            if(mypageDto.get(i).getCategory()!=null){
               if(mypageDto.get(i).getCategory().equals("1")){
                  String tmp = "마이룸";
                  mypageDto.get(i).setCategory(tmp);
               } else if(mypageDto.get(i).getCategory().equals("2")){
                  String tmp = "레코더";
                  mypageDto.get(i).setCategory(tmp);
               } else if(mypageDto.get(i).getCategory().equals("3")){
                  String tmp = "레코더 답글";
                  mypageDto.get(i).setCategory(tmp);
               } else {
                  String tmp = "오류";
                  mypageDto.get(i).setCategory(tmp);
               }
            }
         }
      }
      mav.addObject("mypage",mypageDto);
//      query.put("type", "myarticle");
//      PageNavigation pageNavigation = commonService.makePageNavigation(query);
//      pageNavigation.setRoot("/akcord_project");
//      pageNavigation.setNavigator();
//      mav.addObject("navigator", pageNavigation);
      
      mav.setViewName("/user/mypage/myarticle");
      return mav;
   }
   
   @RequestMapping(value="/delete.akcord")
   public String myarticledelete(@RequestParam String category, @RequestParam int seq, @RequestParam int group_id, HttpSession sesstion){
      UserDto userDto = (UserDto) sesstion.getAttribute("user");
      System.out.println("삭제하러 왔슴다!");
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