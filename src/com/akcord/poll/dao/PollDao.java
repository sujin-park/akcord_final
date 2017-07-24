package com.akcord.poll.dao;

public interface PollDao {
	
	// << task for poll for admin >>
	public void pollmake();	// insert poll data into database
	public void polllist();	// pull list of polls
	public void pollmodify(); // modify poll data
	public void pollclose();  // close poll
	
	// << poll function for users >>
	public void pollshow();	// shows poll form for users
	public void pollvote();	// insert user's choice data
	public void pollchart();// shows chart of poll result;
	
	public void pollavailable();	// check availability for vote 
	
}
