package com.akcord.group.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.alarm.service.AlarmService;
import com.akcord.group.model.GroupHwDto;
import com.akcord.group.model.GroupListDto;
import com.akcord.group.model.GroupRoomDto;
import com.akcord.group.model.ScheduleDto;
import com.akcord.group.service.CommonService;
import com.akcord.group.service.GroupMainService;
import com.akcord.user.model.UserDto;
import com.akcord.user.service.UserService;
import com.akcord.util.PageNavigation;

@Controller
@RequestMapping("/groupmain")
public class GroupMainController {

	@Autowired
	private GroupMainService groupMainService;

	@Autowired
	private CommonService commonService;

	@Autowired
	private AlarmService alarmService;
	@Autowired
	private UserService userService;
	@RequestMapping("/main.akcord") // 캘린더로 들어가기
	public ModelAndView main(@RequestParam("groupId") int groupId) {
		ModelAndView mav = new ModelAndView();
		GroupRoomDto group = groupMainService.gMainInfo(groupId);
		mav.addObject("gInfo", group);
		// mav.addObject("groupId", groupId);
		mav.setViewName("/user/group/main/groupcalender");
		return mav;
	}

	@RequestMapping("/list.akcord") // 글목록
	public ModelAndView groupMain(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		String startDate = map.get("startDate");
		String endDate = map.get("endDate");
		int groupId = Integer.parseInt(map.get("groupId"));
		List<GroupHwDto> list = groupMainService.groupArticleList(map);

		if (startDate != null) {
			int totalperson = groupMainService.totalperson(groupId);
			int countperson = groupMainService.countperson(Integer.parseInt(map.get("scheduleId") + ""));
			double percent2 = (double) countperson/totalperson;
			double percent = percent2 * 100;
			mav.addObject("percent", percent);
		} else {
			mav.addObject("percent", 100);
		}
		mav.addObject("alist", list);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("groupId", groupId);
		mav.addObject("scheduleId", map.get("scheduleId"));
		mav.setViewName("/user/group/main/articlelist");
		return mav;
	}

	@RequestMapping("/group.akcord")
	public ModelAndView groupList(@RequestParam Map<String, String> query, HttpSession session) { // 그룹원
																									// 관리
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		int groupId = Integer.parseInt(query.get("groupId"));
		query.put("user_id", user.getUser_id() + "");
		List<GroupListDto> glist = groupMainService.gMemberlist(query);

		query.put("type", "wait");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);

		mav.addObject("query", query);
		mav.addObject("groupId", groupId);
		mav.addObject("glist", glist);
		mav.setViewName("/user/group/main/setting");
		return mav;
	}

	@RequestMapping("/reject.akcord") // 대기중인 회원 지우기
	public String delete(@RequestParam Map<String, String> map) {
		int cnt = groupMainService.rejectMember(map);
		String path = "";
		int groupId = Integer.parseInt(map.get("groupId"));
		if (Integer.parseInt(map.get("state")) == 1) {
			path = "redirect:/groupmain/group.akcord?groupId=" + groupId + "&pg=1&key=&word=&order=";
		} else {
			path = "redirect:/groupmain/group.akcord?groupId=" + groupId + "&pg=1&key=&word=&order=";
		}
		return path;
	}

	@RequestMapping("/accept.akcord") // 회원 승인해주기
	public String accept(@RequestParam Map<String, String> map, HttpSession session) {
		int cnt = groupMainService.acceptMember(map);
		UserDto user = (UserDto) session.getAttribute("user");
		int groupId = Integer.parseInt(map.get("groupId"));
		
		String target_id = user.getUser_id()+"";
		String alarmcheck = alarmService.alarmcheck(target_id)+"";
		if(!target_id.equals(alarmcheck)){
			alarmService.alarminsertGroupaccept(map.get("seq"));
		}

		
	      List<GroupRoomDto> group_list = null;
	      if(user.getType()!=0) { 
	         group_list = userService.group(user.getUser_id()+"");
	         session.setAttribute("group_list", group_list);
	      }
		return "redirect:/groupmain/group.akcord?groupId=" + groupId + "&pg=1&key=&word=&order=";
	}

	@RequestMapping("/search.akcord") // 검색
	public ModelAndView search(@RequestParam("sid") String sid, @RequestParam("groupId") String groupId) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("sid", sid);
		map.put("groupId", groupId);
		List<GroupListDto> searchlist = groupMainService.searchlist(map);
		mav.addObject("slist", searchlist);
		mav.setViewName("/user/group/main/plusmem");
		return mav;
	}

	@RequestMapping("/invite.akcord") // 그룹원 초대
	public String invite(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		int cnt = groupMainService.invite(map);
		int groupId = Integer.parseInt(map.get("groupId"));
		alarmService.alarminsertGroupinvite(map.get("seq")); // 그룹원 초대 후 알람
		return "redirect:/groupmain/group.akcord?groupId=" + groupId + "&pg=1&key=&word=&order=";
	}

	@RequestMapping("/grouplist.akcord") // 그룹원 보기
	public ModelAndView grouplist(@RequestParam Map<String, String> query, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		query.put("seq", user.getUser_id() + "");
		List<GroupListDto> grouplist = groupMainService.originlist(query);

		query.put("type", "origin");
		PageNavigation pageNavigation = commonService.makePageNavigation(query);
		pageNavigation.setRoot("/akcord_project");
		pageNavigation.setNavigator();
		mav.addObject("navigator", pageNavigation);

		mav.addObject("query", query);
		mav.addObject("oglist", grouplist);
		mav.setViewName("/user/group/main/origingroup");
		return mav;
	}

	@RequestMapping("/view.akcord") // 과제 글 보기
	public ModelAndView articleview(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		GroupHwDto groupHwDto = groupMainService.articleView(map);
		mav.addObject("groupHwDto", groupHwDto);
		mav.addObject("groupId", map.get("groupId"));
		mav.addObject("articleseq", map.get("articleseq"));
		mav.setViewName("/user/group/main/view");
		return mav;
	}

	@RequestMapping("/schedule.akcord") // 일정보기
	public @ResponseBody String scheduleInsert(ScheduleDto scheduleDto) {
		String sdate = scheduleDto.getStartDate();
		String edate = scheduleDto.getEndDate();
		int groupId = scheduleDto.getGroupId();
		scheduleDto.setStartDate(sdate.replace("/", "-").substring(0, 10));
		scheduleDto.setEndDate(edate.replace("/", "-").substring(0, 10));
		scheduleDto.setStartTime(sdate.substring(sdate.lastIndexOf(" ")) + ":00");
		scheduleDto.setEndTime(edate.substring(edate.lastIndexOf(" ")) + ":00");

		int cnt = groupMainService.scheduleInsert(scheduleDto);
		JSONObject json = makeList(groupId);
		return json.toJSONString();
	}

	private JSONObject makeList(int groupId) {

		List<ScheduleDto> slist = groupMainService.schedulelist(groupId);

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = df.format(new Date());

		JSONObject json = new JSONObject(); // 최종적으로 반환되는 json
		JSONArray jarr = new JSONArray();
		JSONArray jarr1 = new JSONArray();

		for (ScheduleDto scheduleDto : slist) {
			JSONObject jsonaddr = new JSONObject();
			JSONObject jsonaddr2 = new JSONObject();

			jsonaddr.put("start", scheduleDto.getStartDate());
			jsonaddr.put("end", scheduleDto.getEndDate());
			jsonaddr.put("title", scheduleDto.getScheduleName());
			jsonaddr.put("content", scheduleDto.getDetail());
			jsonaddr.put("allDay", "false");
			if (nowdate.compareTo(scheduleDto.getEndDate().substring(0, 10).replace("/", "-")) >= 1) {
				jsonaddr.put("color", "#dbdbdb");
			} else {
				jsonaddr.put("color", "#d34e4c");
			}

			jsonaddr.put("scheduleId", scheduleDto.getScheduleId());

			int deadline = scheduleDto.getDeadline();
			if (deadline > 0) {
				jsonaddr.put("deadline", deadline);
			} else if (deadline == 0) {
				jsonaddr.put("deadline", 0);
			} else {
				jsonaddr.put("deadline", -1);
			}

			// jarr1.add(jsonaddr2);
			jarr.add(jsonaddr);
		}

		json.put("schedule", jarr);
		// json.put("schedule2", jarr1);

		return json;
	}

	@RequestMapping(value = "/calendar.akcord", method = RequestMethod.GET)
	public @ResponseBody String list(@RequestParam("groupId") int groupId) {
		JSONObject json = makeList(groupId);
		return json.toJSONString();
	}

	@RequestMapping("/modify.akcord") // 일정 수정
	public @ResponseBody String modify(ScheduleDto scheduleDto) {
		String sdate = scheduleDto.getStartDate();
		String edate = scheduleDto.getEndDate();
		int groupId = scheduleDto.getGroupId();
		scheduleDto.setStartDate(sdate.replace("/", "-").substring(0, 10));
		scheduleDto.setEndDate(edate.replace("/", "-").substring(0, 10));
		scheduleDto.setStartTime(sdate.substring(sdate.lastIndexOf(" ")) + ":00");
		scheduleDto.setEndTime(edate.substring(edate.lastIndexOf(" ")) + ":00");
		int cnt = groupMainService.scheduleModify(scheduleDto);
		JSONObject json = makeList(groupId);
		return json.toJSONString();
	}

	@RequestMapping("/delete.akcord") // 일정 삭제
	public @ResponseBody String delete(@RequestParam("scheduleId") int scheduleId,
			@RequestParam("groupId") int groupId) {
		int cnt = groupMainService.scheduleDelete(scheduleId);
		JSONObject json = makeList(groupId);
		return json.toJSONString();
	}

	@RequestMapping("/out.akcord")
	public String deletegroup(@RequestParam int groupId) {
		ModelAndView mav = new ModelAndView();
		int cnt = groupMainService.deletegroup(groupId);
		return "redirect:/group/list.akcord?pg=1&key=&word=&order=&count=" + cnt;
	}

	@RequestMapping("/outgroup.akcord")
	public String outgroup(@RequestParam int groupId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		UserDto user = (UserDto) session.getAttribute("user");
		Map<String, String> map = new HashMap<String, String>();
		map.put("groupId", groupId + "");
		map.put("userId", user.getUser_id() + "");
		int cnt = groupMainService.outgroup(map);

		return "redirect:/group/list.akcord?pg=1&key=&word=&order=&countG=" + cnt;
	}

	@RequestMapping("/deleteA.akcord") // 글 공유 취소
	public String deleteA(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		int cnt = groupMainService.deleteArticle(map);
		String scheduleId = "";
		if (map.get("scheduleId") != null) {
			scheduleId = map.get("scheduleId")+"";
		}
		int groupId = Integer.parseInt(map.get("groupId"));
		return "redirect:/groupmain/list.akcord?groupId=" + groupId + "&scheduleId=" + scheduleId;
	}
	
	@RequestMapping("/scrap.akcord")
	public ModelAndView scrap(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		GroupHwDto groupHwDto = groupMainService.articleView(map);
		mav.addObject("groupHwDto", groupHwDto);
		mav.setViewName("/user/group/main/scrap");
		return mav;
	}
}