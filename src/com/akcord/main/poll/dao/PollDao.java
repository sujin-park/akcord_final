package com.akcord.main.poll.dao;

import java.util.List;

import com.akcord.main.poll.model.PollDto;

public interface PollDao {
	
	public int getNextPollSeq();
	
	// << task for poll for admin >>
	public int pollmake(PollDto pollDto);	// insert poll data into database
	public int pollmakeContent(String Content);	// insert poll data into database
	
	public List<PollDto> polllist();	// pull list of polls
	public PollDto pollmodify(int poll_id); // modify poll data
	public int pollmodifydate(PollDto pollDto); // modify poll data
	public List<String> pollgetContent(int poll_id); // modify poll data
	public int pollclose(int poll_id);  // close poll
	public List<PollDto> pollresult(int poll_id);

	// << poll function for users >>
	public void pollshow();	// shows poll form for users
	public void pollvote();	// insert user's choice data
	public void pollchart();// shows chart of poll result;
	
	public void pollavailable();	// check availability for vote 
	
}
