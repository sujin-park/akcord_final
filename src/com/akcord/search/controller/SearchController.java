package com.akcord.search.controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.akcord.search.model.SearchDto;
import com.akcord.search.service.SearchService;


@Controller
@RequestMapping("/search")
public class SearchController {

	
	@Autowired
    private SearchService searchService; 



	@RequestMapping(value="/search.akcord", method=RequestMethod.POST)
	public ModelAndView Searchreturn(@RequestParam Map<String,String> map) {
		System.out.println("여긴오냐");
		 ModelAndView mav = new ModelAndView();
	        
	        if(map.get("usr") !=null)
	        { System.out.println(map.get("usr"));
	        List<SearchDto> list = searchService.Searchreturn(map.get("usr"),10,1);
	            mav.addObject("Searchvalue", list);
	           
	        }
	        mav.setViewName("/user/search/testmain");
	        return mav;



	}



	
}
