package com.akcord.search.service;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.InDto;
import com.akcord.myroom.model.MyroomNextDto;
import com.akcord.search.model.SearchDto;
import com.akcord.search.model.SearchTotalDto;
import com.akcord.search.model.SearchdaumDto;

public interface SearchService {
	List<SearchTotalDto> Searchreturn(String string, int display, int start);

	List<SearchTotalDto> Searchdaumreturn(String keyword, int pageno, int result);

	List<MyroomNextDto> SearchMypageDto(String keyword);

	List<InDto> SearchInQnaDto(String string);

	List<SearchTotalDto> SearchCafereturn(String keyword, int display, int start);

	List<SearchTotalDto> SearchCafedaumreturn(String keyword, int pageno, int result);

	List<SearchTotalDto> SearchJisicreturn(String keyword, int display, int start);

	List<SearchTotalDto> SearchJisicdaumreturn(String keyword, int pageno, int result);

}
