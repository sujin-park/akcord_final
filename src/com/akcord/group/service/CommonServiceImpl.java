package com.akcord.group.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.akcord.group.dao.CommonDao;
import com.akcord.util.BoardConstant;
import com.akcord.util.PageNavigation;
@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	private SqlSession sqlSession;
	
	public PageNavigation makePageNavigation(Map<String, String> map){
		PageNavigation pageNavigation = new PageNavigation();
		String tname = "group";
		int pg = Integer.parseInt(map.get("pg"));
		map.put("tname", tname);
		int newArticleCount = sqlSession.getMapper(CommonDao.class).newArticleCount(map);
		pageNavigation.setNewArticleCount(newArticleCount);
		int totalArticleCount = sqlSession.getMapper(CommonDao.class).totalArticleCount(map);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = totalArticleCount % BoardConstant.LIST_SIZE == 0 ? totalArticleCount / BoardConstant.LIST_SIZE : totalArticleCount / BoardConstant.LIST_SIZE + 1;
		//int totalPageCount = (totalArticleCount - 1) / BoardConstance.LIST_SIZE + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		pageNavigation.setNowFirst(pg <= BoardConstant.PAGE_SIZE);
		pageNavigation.setNowEnd((totalPageCount - 1) / BoardConstant.PAGE_SIZE * BoardConstant.PAGE_SIZE < pg);
		pageNavigation.setPageNo(pg);		
		return pageNavigation;
	}; 
}
