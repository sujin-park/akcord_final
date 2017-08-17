package com.akcord.search.dao;

import java.util.List;
import java.util.Map;

import com.akcord.in.model.InDto;
import com.akcord.myroom.model.MyroomNextDto;

public interface SearchDao {

	List<MyroomNextDto> SearchMypageDto(String keyword);
	List<InDto> SearchInQnaDto(String keyword);
	
	
}
