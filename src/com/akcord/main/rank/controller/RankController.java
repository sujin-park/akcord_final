package com.akcord.main.rank.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.akcord.main.rank.model.RankDto;
import com.akcord.main.rank.service.RankService;

@Controller
@RequestMapping("/rank")
public class RankController {
	
	@Autowired
	private RankService rankService;

	@RequestMapping(value="/getrank.akcord")
	public @ResponseBody String getRank(){
		JSONObject json = new JSONObject();
		List<RankDto> listQna = rankService.getQna();
		List<RankDto> listGroup = rankService.getGroup();
		List<RankDto> listMyroom = rankService.getMyroom();
		
		JSONArray jQna = new JSONArray();
		JSONArray jGroup = new JSONArray();
		JSONArray jMyroom = new JSONArray();
		
		for (int i = 0; i < 5; i++) {
			JSONObject jtmp = new JSONObject();
			jtmp.put("hit", listQna.get(i).getHit());
			jtmp.put("id", listQna.get(i).getId());
			jtmp.put("subject", listQna.get(i).getSubject());
			
			jQna.add(jtmp);
		}
		for (int i = 0; i < 5; i++) {
			JSONObject jtmp = new JSONObject();
			jtmp.put("hit", listGroup.get(i).getHit());
			jtmp.put("id", listGroup.get(i).getId());
			String id =  listGroup.get(i).getId();
			String subject = rankService.getGroupname(id);
			jtmp.put("subject", subject);
			
			jGroup.add(jtmp);
		}
		for (int i = 0; i < 5; i++) {
			JSONObject jtmp = new JSONObject();
			jtmp.put("hit", listMyroom.get(i).getHit());
			jtmp.put("id", listMyroom.get(i).getId());
			jtmp.put("subject", listMyroom.get(i).getSubject());
			
			jMyroom.add(jtmp);
		}
		
		json.put("jq", jQna);
		json.put("jg", jGroup);
		json.put("jm", jMyroom);
		
		return json.toJSONString();
		
	}
}
