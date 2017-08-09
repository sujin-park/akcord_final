package com.akcord.in.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.in.model.CommentDto;
import com.akcord.in.service.CommentService;
import com.akcord.user.model.UserDto;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
		
	
//	// 답변하기 클릭시 이동하는 페이지
//	   @RequestMapping(value="/answer.akcord", method=RequestMethod.GET)
//	   public ModelAndView qna(){
//	      ModelAndView mav = new ModelAndView();
//	      mav.setViewName("/user/in/answer");
//	      return mav; 
//	   }
	   
	   
	   //질문메인에서 클릭시 보여지는 답변 총리스트.
//	   @RequestMapping(value="/clicklist.akcord", method=RequestMethod.GET)
//	   public ModelAndView clicklist(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id, HttpSession session){
////		  System.out.println("comment 뷰 페이지까지 오나?");
//	      ModelAndView mav = new ModelAndView();
//	      UserDto userDto = (UserDto) session.getAttribute("user");
//	      List<CommentDto> commentDto = null;
//	      if(userDto != null){
//	    	  int cnt = commentService.updateHit(qna_id);	    	  
//	    	  commentDto = commentService.getlist(qna_id);
//	    	  CommentDto commentDto2 = commentService.getAnswer(qna_id);
//	    	  System.out.println();
//	    	  mav.addObject("hit", cnt);
//	    	  mav.addObject("qnaview", commentDto2);
//	    	  mav.addObject("comments", commentDto);
//	      }
////	      System.out.println(commentDto.size() + " 리스트 사이즈");
////	      System.out.println(commentDto.getSubject());
////	      System.out.println(queryString);
//	      mav.setViewName("/user/in/qna");
//	      return mav;
//	   } 
//	   
//	   
//	 //답변하기 클릭시 보여지는 페이지.
//	   @RequestMapping(value="/comment.akcord", method=RequestMethod.GET)
//	   public ModelAndView comment(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id){
//		  System.out.println("comment 뷰 페이지까지 오나?");
//	      ModelAndView mav = new ModelAndView();
//	      CommentDto commentDto = null;
//	      commentDto = commentService.getAnswer(qna_id);
////	      System.out.println(commentDto.getSubject());
////	      System.out.println(queryString);
//	      mav.addObject("qnaview", commentDto);
//	      mav.setViewName("/user/in/answer");
//	      return mav;
//	   } 
	   
	   //글등록시 리스트로 뿌려주는 곳
	   @RequestMapping(value="/answerSave.akcord", method=RequestMethod.POST) 
	   public String answerSave(CommentDto commentDto, HttpSession session){//여기서는 리스트를 불러온다.
	      
	      ModelAndView mav = new ModelAndView();
	      UserDto userDto = (UserDto) session.getAttribute("user");
	      int major_id = userDto.getMajor_id();
	      int qna_id = commentDto.getQna_id();
	      commentDto.setUser_id(userDto.getUser_id());
	      
//	      System.out.println(commentDto.getQna_id());
//	      System.out.println(commentDto.getQna_comment_id());
//	      System.out.println(commentDto.getQna_comment());
//	      System.out.println(commentDto.getQna_subject());
//	      System.out.println(userDto.getUser_id());
//	      
	      if(userDto != null) {
	    	  
	    	 int cnt = commentService.answerSave(commentDto);
	         mav.addObject("comment", commentDto);
	               
	   
	      }      return "redirect:/comment/list.akcord?major_id="+ major_id + "&qna_id=" + qna_id; 	 
	   }
	   
	 //질문등록 클릭시 리스트를 뿌려주는 페이지
	   @RequestMapping("/list.akcord")
	   public ModelAndView list(HttpSession session, @RequestParam Map <String, String> queryString, @RequestParam("major_id") String major_id, @RequestParam("qna_id") int qna_id) {
	      ModelAndView mav = new ModelAndView();
	      UserDto user = (UserDto) session.getAttribute("user");
//	      queryString.put("major_id", major_id);
	      List<CommentDto> commentDto = commentService.list(queryString);
	      CommentDto commentDto2 = commentService.getAnswer(qna_id);
//	      System.out.println(commentDto.size() + " 리스트 사이즈");
//	      System.out.println(commentDto.getSubject());
//	      System.out.println(queryString);
	      mav.addObject("qnaview", commentDto2);
	      mav.addObject("comments", commentDto);
	      mav.setViewName("/user/in/qna");
	      return mav;
	   } 
	   

	   @RequestMapping(value="/modify.akcord", method=RequestMethod.GET) //답변글 수정
	   public String modify(CommentDto commentDto, HttpSession session, @RequestParam("qna_comment_id") int qna_comment_id, @RequestParam("qna_id") int qna_id ){
		   ModelAndView mav = new ModelAndView();
		   System.out.println("여기까진 오냐??? ㅠㅠㅠㅠㅠ");
		   System.out.println(commentDto.getSubject());
		   System.out.println(commentDto.getContent());
		   System.out.println(commentDto.getReg_date());
		   UserDto userDto = (UserDto) session.getAttribute("user");
		   commentDto.setUser_id(userDto.getUser_id());
		   qna_id = commentDto.getQna_id();
		   qna_comment_id = commentDto.getQna_comment_id();
		   if(userDto != null){
		   int cnt = commentService.modify(commentDto);		   
		   mav.addObject("modify", cnt);
		   }
		   return "redirect:/comment/list.akcord?qna_comment_id="+ qna_comment_id + "&qna_id=" + qna_id; 	 
	   }
	   
	
}
