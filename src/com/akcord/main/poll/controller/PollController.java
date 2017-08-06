package com.akcord.main.poll.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.main.poll.model.PollDto;
import com.akcord.main.poll.service.PollService;

@Controller
@RequestMapping("/poll")
public class PollController {

	@Autowired
	private PollService pollService;
	
	
	@RequestMapping(value="/make.akcord", method=RequestMethod.POST)
	public String pollmake(PollDto pollDto, @RequestParam List<String> answer){
		int seq = pollService.getNextPollSeq();
		int cnt = pollService.pollmake(pollDto);
		for (int i = 0; i < answer.size()-1; i++) {
			int text = pollService.pollmakeContent(answer.get(i));
		}
		// 모달 창을 꺼야함!!!
		// 뭘로 리턴할까!!!
		return "redirect:/poll/list.akcord";
	}
		@RequestMapping(value="/modify.akcord")
		public @ResponseBody String pollmodify(@RequestParam("seq") int seq){
			int poll_id = seq;
			// 먼저 제목과 날짜 먼저 호출하자
			JSONObject jsonObject = new JSONObject();
			JSONArray jalist = new JSONArray();
			PollDto pollDto =  pollService.pollmodify(poll_id);	// 투표 정보를 불러온다
			List<String> list = new ArrayList<String>();
			list = pollService.pollgetContent(poll_id);	// 투표 본문을 불러온다
			jsonObject.put("Subject", pollDto.getSubject());
			jsonObject.put("StartDate", pollDto.getStartDate());
			jsonObject.put("EndDate", pollDto.getEndDate());
			jsonObject.put("ChartType", pollDto.getChartType());
			jsonObject.put("poll_id", seq);
	
			for (int i = 0; i < list.size(); i++) {
				//JSONObject jsontmp = new JSONObject();
				String text = list.get(i);
				//jsontmp.put("list", list.get(i));
				jalist.add(text);
			}
			jsonObject.put("contlist", jalist);
			// 모달 창이 유지되어야 한다!!
		return jsonObject.toJSONString();
	}
		@RequestMapping(value="/result.akcord")
		public @ResponseBody String pollresult(@RequestParam("seq") int seq){
			int poll_id = seq;
			// 먼저 제목과 날짜 먼저 호출하자
			JSONObject jsonObject = new JSONObject();
			JSONArray jarr = new JSONArray();
			List<PollDto> plist=  pollService.pollresult(poll_id);	// 투표 정보를 불러온다
			jsonObject.put("Subject", plist.get(0).getSubject());
			jsonObject.put("ChartType", plist.get(0).getChartType());
			jsonObject.put("poll_id", seq);
			for (PollDto pollDto:plist) {
				JSONObject jsontmp = new JSONObject();
				//String text = plist.get(i);
				jsontmp.put("content",pollDto.getContent());
				jsontmp.put("cnt", pollDto.getCount());
//				jalist.add(text);
				jarr.add(jsontmp);
			}
			jsonObject.put("pollresult", jarr);
			// 모달 창이 유지되어야 한다!!
		return jsonObject.toJSONString();
		}
		
		
		@RequestMapping("/modifydate.akcord")
		public String pollmodifydate(@RequestParam Map<String,String> map){
			System.out.println("여긴 날짜를 수정합니다.");
	         System.out.println(map.get("startDate"));
	         System.out.println(map.get("poll_id"));

			int cnt = pollService.pollmodifydate(map);
			return "redirect:/poll/list.akcord";
		}
		
/*	      @RequestMapping("/modifydate.akcord")
	      public ModelAndView pollmodifydate(@RequestParam Map<String,String> map){
	         System.out.println("여긴 날짜를 수정합니다.");
	         System.out.println(map.get("startDate"));
	         System.out.println(map.get("poll_id"));
	         ModelAndView mav = new ModelAndView();
	        // int cnt = pollService.pollmodifydate(pollDto);
	         mav.setViewName("/admin/teacher");
	         return mav;
	      }*/
	      
		@RequestMapping(value="/delete.akcord")
		public ModelAndView pollclose(@RequestParam("seq") int seq){
			int poll_id = seq;
			ModelAndView mav = new ModelAndView();
			int cnt = pollService.pollclose(poll_id);
			
			// 모달 창을 꺼야함!!!
			// 뭘로 리턴할까!!!
			mav.setViewName("/admin/teacher");
			return mav;
		}
		
		@RequestMapping(value="/list.akcord")
		public ModelAndView polllist(){

			ModelAndView mav = new ModelAndView();
			List<PollDto> list = pollService.polllist();

			mav.addObject("list", list);
			mav.setViewName("/admin/teacher");
			
			// 리턴 주소 어떻게 하지 ????
		return mav;
	}
	
}
