package com.akcord.search.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.junit.runner.manipulation.Sortable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.akcord.in.model.InDto;
import com.akcord.myroom.model.MyroomNextDto;
import com.akcord.search.model.SearchDto;
import com.akcord.search.model.SearchTotalDto;
import com.akcord.search.model.SearchdaumDto;
import com.akcord.search.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value = "/cafe.akcord", method = RequestMethod.POST)
	public ModelAndView Searchreturn3(@RequestParam Map<String, String> map) {
		List<SearchTotalDto> list4 = searchService.SearchCafereturn(map.get("usr"), 10, 1);
		List<SearchTotalDto> list5 = searchService.SearchCafedaumreturn(map.get("usr"), 1, 10);
		ModelAndView mav = new ModelAndView();
		if (map.get("usr") != null) {
			List<SearchTotalDto> totallist = new ArrayList<SearchTotalDto>();
		
			for (int i = 0; i < list4.size(); i++) {

				totallist.add(list4.get(i));

			}
			for (int j = 0; j < list5.size(); j++) {
				totallist.add(list5.get(j));
			}
			// System.out.println("여긴오냐");

			Collections.sort(totallist);

			mav.addObject("Searchvalue", totallist);

		}
		mav.setViewName("/user/search/testmain");

		return mav;
	}
	
	@RequestMapping(value = "/jisic.akcord", method = RequestMethod.POST)
	public ModelAndView Searchreturn2(@RequestParam Map<String, String> map) {
		List<SearchTotalDto> list6 = searchService.SearchJisicreturn(map.get("usr"), 10, 1);
		List<SearchTotalDto> list7 = searchService.SearchJisicdaumreturn(map.get("usr"), 1, 10);
		ModelAndView mav = new ModelAndView();
		if (map.get("usr") != null) {
			List<SearchTotalDto> totallist = new ArrayList<SearchTotalDto>();
		
			for (int i = 0; i < list6.size(); i++) {

				totallist.add(list6.get(i));

			}
			for (int j = 0; j < list7.size(); j++) {
				totallist.add(list7.get(j));
			}
			// System.out.println("여긴오냐");

			Collections.sort(totallist);

			mav.addObject("Searchvalue", totallist);

		}
		mav.setViewName("/user/search/testmain");

		return mav;
	}

	@RequestMapping(value = "/blog.akcord", method = RequestMethod.POST)
	public ModelAndView Searchreturn1(@RequestParam Map<String, String> map) {

		ModelAndView mav = new ModelAndView();
		if (map.get("usr") != null) {
			List<SearchTotalDto> totallist = new ArrayList<SearchTotalDto>();
			List<SearchTotalDto> list = searchService.Searchreturn(map.get("usr"), 10, 1);
			List<SearchTotalDto> list1 = searchService.Searchdaumreturn(map.get("usr"), 1, 10);
			for (int i = 0; i < list.size(); i++) {

				totallist.add(list.get(i));

			}
			for (int j = 0; j < list1.size(); j++) {
				totallist.add(list1.get(j));
			}
			// System.out.println("여긴오냐");

			Collections.sort(totallist);

			mav.addObject("Searchvalue", totallist);

		}
		mav.setViewName("/user/search/testmain");

		return mav;
	}

	@RequestMapping(value = "/akcord.akcord", method = RequestMethod.POST)
	public ModelAndView Searchreturn4(@RequestParam Map<String, String> map) {

		ModelAndView mav = new ModelAndView();
		if (map.get("usr") != null) {
			List<SearchTotalDto> totallist = new ArrayList<SearchTotalDto>();
			List<MyroomNextDto> list2 = searchService.SearchMypageDto(map.get("usr"));
			List<InDto> list3 = searchService.SearchInQnaDto(map.get("usr"));
			for (int k = 0; k < list2.size(); k++) {
				SearchTotalDto std = new SearchTotalDto();
				std.setContent(list2.get(k).getContent());
				std.setSubject(list2.get(k).getSubject());
				std.setReg_date(list2.get(k).getReg_date());
				std.setUser_name(String.valueOf(list2.get(k).getUser_id()));
				String str1 = list2.get(k).getContent();
				String[] words = str1.split(map.get("usr"));
				std.setCount(words.length);
				totallist.add(std);
			}
			for (int z = 0; z < list3.size(); z++) {
				SearchTotalDto std1 = new SearchTotalDto();
				std1.setContent(list3.get(z).getContent());
				std1.setSubject(list3.get(z).getSubject());
				std1.setReg_date(list3.get(z).getReg_date());
				std1.setUser_name(list3.get(z).getMajorName());

				String str1 = list3.get(z).getContent();
				String[] words = str1.split(map.get("usr"));
				std1.setCount(words.length);
				totallist.add(std1);
			}
		
			// System.out.println("여긴오냐");

			Collections.sort(totallist);

			mav.addObject("Searchvalue", totallist);

		}
		mav.setViewName("/user/search/testmain");

		return mav;
	}
	
	@RequestMapping(value = "/search.akcord", method = RequestMethod.POST)
	public ModelAndView Searchreturn(@RequestParam Map<String, String> map) {
		List<SearchTotalDto> totallist = new ArrayList<SearchTotalDto>();

		// System.out.println("여긴오냐");
		ModelAndView mav = new ModelAndView();

		if (map.get("usr") != null) {
			System.out.println(map.get("usr"));
			List<SearchTotalDto> list = searchService.Searchreturn(map.get("usr"), 10, 1);
			List<SearchTotalDto> list1 = searchService.Searchdaumreturn(map.get("usr"), 1, 10);
			List<SearchTotalDto> list4 = searchService.SearchCafereturn(map.get("usr"), 10, 1);
			List<SearchTotalDto> list5 = searchService.SearchCafedaumreturn(map.get("usr"), 1, 10);
			List<SearchTotalDto> list6 = searchService.SearchJisicreturn(map.get("usr"), 10, 1);
			List<SearchTotalDto> list7 = searchService.SearchJisicdaumreturn(map.get("usr"), 1, 10);
			List<MyroomNextDto> list2 = searchService.SearchMypageDto(map.get("usr"));
			List<InDto> list3 = searchService.SearchInQnaDto(map.get("usr"));
			for (int k = 0; k < list2.size(); k++) {
				SearchTotalDto std = new SearchTotalDto();
				std.setContent(list2.get(k).getContent());
				std.setSubject(list2.get(k).getSubject());
				std.setReg_date(list2.get(k).getReg_date());
				std.setUser_name(String.valueOf(list2.get(k).getUser_id()));
				String str1 = list2.get(k).getContent();
				String[] words = str1.split(map.get("usr"));
				std.setCount(words.length);
				totallist.add(std);
			}
			for (int z = 0; z < list3.size(); z++) {
				SearchTotalDto std1 = new SearchTotalDto();
				std1.setContent(list3.get(z).getContent());
				std1.setSubject(list3.get(z).getSubject());
				std1.setReg_date(list3.get(z).getReg_date());
				std1.setUser_name(list3.get(z).getMajorName());

				String str1 = list3.get(z).getContent();
				String[] words = str1.split(map.get("usr"));
				std1.setCount(words.length);
				totallist.add(std1);
			}
			for (int i = 0; i < list.size(); i++) {

				totallist.add(list.get(i));

			}
			for (int j = 0; j < list1.size(); j++) {
				totallist.add(list1.get(j));
			}
			for (int j = 0; j < list4.size(); j++) {
				totallist.add(list4.get(j));
			}
			for (int j = 0; j < list5.size(); j++) {
				totallist.add(list5.get(j));
			}
			for (int j = 0; j < list6.size(); j++) {
				totallist.add(list6.get(j));
			}
			for (int j = 0; j < list7.size(); j++) {
				totallist.add(list7.get(j));
			}

			Collections.sort(totallist);

			mav.addObject("Searchvalue", totallist);

		}
		mav.setViewName("/user/search/testmain");
		return mav;

	}

}