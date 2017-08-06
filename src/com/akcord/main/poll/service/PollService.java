package com.akcord.main.poll.service;

import java.util.List;

import com.akcord.main.poll.model.PollDto;

public interface PollService {
	
	public int getNextPollSeq();
	
	public int pollmake(PollDto pollDto);
	int pollmakeContent(String content);
	public PollDto pollmodify(int poll_id); // modify poll data
	public int pollmodifydate(PollDto pollDto); // modify poll data
	public List<PollDto> pollresult(int poll_id);
	public List<String> pollgetContent(int poll_id); // modify poll data
	
	int pollclose(int poll_id);
	List<PollDto> polllist();	// pull list of polls

}
