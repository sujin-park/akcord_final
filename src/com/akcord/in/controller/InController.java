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

import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.MajorDto;
import com.akcord.group.service.CommonService;
import com.akcord.group.service.GroupService;
import com.akcord.in.model.CommentDto;
import com.akcord.in.model.InDto;
import com.akcord.in.service.CommentService;
import com.akcord.in.service.InService;
import com.akcord.user.model.UserDto;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/in")
public class InController {
	@Autowired
	private InService inService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CommentService commentService;

	//전공과 일치하는 모든 리스트 출력
	@RequestMapping("/list.akcord")
	public ModelAndView list(HttpSession session, @RequestParam Map<String, String> queryString, @RequestParam("major_id") String major_id, @RequestParam("pg") int pg) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		int major_id1 = userDto.getMajor_id();
		if (major_id == null || major_id == "") {
			queryString.put("major_id", major_id1 + "");
		} else {
			queryString.put("major_id", major_id);
		}
		queryString.put("pg", pg + "");

		List<InDto> inlist = inService.answerlist(queryString);
		List<MajorDto> majorlist = inService.majorlist();
		mav.addObject("majorlist", majorlist);
		mav.addObject("inlist", inlist);

		mav.addObject("queryString", queryString);

		queryString.put("type", "in");
		PageNavigation pageNavigation = commonService.makePageNavigation(queryString);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);
		mav.setViewName("/user/in/inmain"); // 받아온걸 페이지로 준다.
		return mav;
	}

	//질문하기 버튼 클릭
	@RequestMapping(value = "/question.akcord", method = RequestMethod.GET)
	public ModelAndView newQuestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/in/question");
		return mav;
	}
	
	//글 등록시 리스트 출력
	@RequestMapping(value = "/question.akcord", method = RequestMethod.POST)
	public String newQuestion(@RequestParam Map<String, String> queryString, HttpSession session) {// 여기서는 리스트를 불러온다.
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");

		String major_id = queryString.get("major_id");
		queryString.put("user_id", userDto.getUser_id() + "");
		if (userDto != null) {
			inService.answerroom(queryString);
			mav.addObject("inDto", queryString);
		}
		return "redirect:/in/list.akcord?major_id=" + major_id + "&pg=1";
	}

	//질문메인에서 클릭시 보여지는 모든 답변 리스트
	@RequestMapping(value="/clicklist.akcord", method=RequestMethod.GET)
	public ModelAndView clicklist(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id, HttpSession session){
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		List<CommentDto> commentDto = null;
		if(userDto != null){
			int cnt = commentService.updateHit(qna_id); //조회수 증가
			commentDto = commentService.getlist(qna_id); //
			CommentDto commentDto2 = commentService.getAnswer(qna_id);
			mav.addObject("hit", cnt);
			mav.addObject("comments", commentDto);
			mav.addObject("qnaview", commentDto2);
		}
		mav.setViewName("/user/in/qna");
		return mav;
	}
	
	//답변하기 클릭시 보여지는 페이지.
	@RequestMapping(value="/comment.akcord", method=RequestMethod.GET)
	public ModelAndView comment(@RequestParam Map<String, String> queryString, @RequestParam("qna_id") int qna_id){
		ModelAndView mav = new ModelAndView();
		CommentDto commentDto = null;
		commentDto = commentService.getAnswer(qna_id);
		mav.addObject("qnaview", commentDto);
		mav.setViewName("/user/in/answer");
		return mav;
	}
	
	//지식인 글 수정 버튼 클릭
	@RequestMapping(value = "/updateQuestion.akcord", method = RequestMethod.GET)
	public ModelAndView updateAnswer(@RequestParam Map<String, String> queryString) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/in/updateQuestion");
		mav.addObject("question", queryString);
		return mav;
	}

	//지식인 글 수정 후 수정 버튼 클릭
	@RequestMapping(value = "/updateQuestion.akcord", method = RequestMethod.POST)
	public String updateAnswer(@RequestParam Map<String, String> queryString, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		int major_id = userDto.getMajor_id();

		inService.updateAnswerroom(queryString);
		mav.addObject("inDto", queryString);
		return "redirect:/in/list.akcord?major_id=" + major_id + "&pg=1"; // 밑에 메소드로가
	}

	//지식인 글 삭제 버튼 클릭
	@RequestMapping(value = "/deleteQuestion.akcord", method = RequestMethod.GET)
	public String deleteAnswer(@RequestParam Map<String, String> queryString, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		int major_id = userDto.getMajor_id();

		inService.deleteAnswerroom(queryString.get("qna_id"));
		mav.addObject("inDto", queryString);
		return "redirect:/in/list.akcord?major_id=" + major_id + "&pg=1"; // 밑에 메소드로가
	}
	
	//글등록시 리스트로 뿌려주는 곳
	@RequestMapping(value="/answerSave.akcord", method=RequestMethod.POST) 
	public String answerSave(CommentDto commentDto, HttpSession session){//여기서는 리스트를 불러온다.
		ModelAndView mav = new ModelAndView();
		UserDto userDto = (UserDto) session.getAttribute("user");
		int major_id = userDto.getMajor_id();
		int qna_id = commentDto.getQna_id();
		commentDto.setUser_id(userDto.getUser_id());
	      
		if(userDto != null) {
			int cnt = commentService.answerSave(commentDto);
			mav.addObject("comment", commentDto);
		}
		return "redirect:/comment/list.akcord?major_id="+ major_id + "&qna_id=" + qna_id; 	 
	}
	
	@RequestMapping(value = "/inmain.akcord", method = RequestMethod.GET)
	public ModelAndView inmain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/in/inmain");
		return mav;
	}

	// 전공카테고리 클릭 시 리스트 출력
//	@RequestMapping("/category.akcord")
//	public ModelAndView cetegory(HttpSession session, @RequestParam Map<String, String> category, String major_id) {
//		ModelAndView mav = new ModelAndView();
//		UserDto user = (UserDto) session.getAttribute("user");
//
//		List<InDto> inlist = inService.category(category);
//		List<MajorDto> majorlist = inService.majorlist();
//		mav.addObject("majorlist", majorlist);
//		mav.addObject("inlist", inlist);
//
//		mav.setViewName("/user/in/inmain"); // 받아온걸 페이지로 준다.
//		return mav;
//	}

}