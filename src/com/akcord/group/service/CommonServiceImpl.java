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
	
	public PageNavigation makePageNavigation(Map<String, String> query){
		PageNavigation pageNavigation = new PageNavigation();
		int newArticleCount = 0;
		int totalArticleCount = 0;
		int pg = Integer.parseInt(query.get("pg"));
		String type = query.get("type");
		// 각자의 컨트롤러에서 query.put("type", "admin") 이런식으로 구분값을 보낸후
		// 여기서 그 값을 꺼내서 구분하고, 각자 리스트 뿌렸던 쿼리를 count해서 글 갯수 구하기
		if (type.equals("group")) {
		newArticleCount = sqlSession.getMapper(CommonDao.class).newGroupListCount(query);
		totalArticleCount = sqlSession.getMapper(CommonDao.class).totalGroupListCount(query);
		}

		
		
		
		
		
		
		
		// 고정시켜두기		
		pageNavigation.setNewArticleCount(newArticleCount);
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = totalArticleCount % BoardConstant.LIST_SIZE == 0 ? totalArticleCount / BoardConstant.LIST_SIZE : totalArticleCount / BoardConstant.LIST_SIZE + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		pageNavigation.setNowFirst(pg <= BoardConstant.PAGE_SIZE);
		pageNavigation.setNowEnd((totalPageCount - 1) / BoardConstant.PAGE_SIZE * BoardConstant.PAGE_SIZE < pg);
		pageNavigation.setPageNo(pg);		
		return pageNavigation;
	}; 
}
