package com.akcord.main.poll.service;

import java.util.List;
import java.util.Map;

import com.akcord.main.poll.model.PollDto;

public interface PollService {
	
	public int getNextPollSeq();
	
	public int pollmake(PollDto pollDto);
	int pollmakeContent(String content);
	public PollDto pollmodify(int poll_id); // modify poll data
	public int pollmodifydate(Map<String,String> query); // modify poll data
	public List<PollDto> pollresult(int poll_id);
	public List<String> pollgetContent(int poll_id); // modify poll data
	public List<PollDto> mainpollget();
	public List<PollDto> removeBtn();

	int pollclose(int poll_id);
	List<PollDto> polllist(Map<String,String> map);	// pull list of polls
	public void pollupdate(Map<String,String> query);
	public void pollYN(Map<String,String> query);
}
