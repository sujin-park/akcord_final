package com.akcord.search.service;

import java.util.List;


import com.akcord.search.model.SearchDto;

public interface SearchService {
	List<SearchDto> Searchreturn(String string, int display, int start);
}
