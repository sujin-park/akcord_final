package com.akcord.in.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.in.model.CommentDto;
import com.akcord.in.model.InDto;
import com.akcord.in.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	   @RequestMapping(value="/answer.akcord", method=RequestMethod.GET)
	   public ModelAndView qna(){
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/user/comment/answer");
	      return mav;
	   }

	   @RequestMapping(value="/comment.akcord", method=RequestMethod.GET)
	   public ModelAndView comment(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id){
		  System.out.println("comment 뷰 페이지까지 오나?");
	      ModelAndView mav = new ModelAndView();
	      CommentDto commentDto = null;
	      commentDto = commentService.getAnswer(qna_id);
	      System.out.println(qna_id);
	      mav.addObject("qna_id", commentDto);
	      mav.setViewName("/user/comment/answer");
	      return mav;
	   } //답변하기 클릭시 보여지는 페이지.
	
	
}
