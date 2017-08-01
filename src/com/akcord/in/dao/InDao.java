package com.akcord.in.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.akcord.group.model.GroupRoomDto;
import com.akcord.in.model.InDto;
import com.akcord.in.service.InService;



public interface InDao {
	public int answerroom(InDto inDto);
	public List<InDto> answerlist(); 
	
}
