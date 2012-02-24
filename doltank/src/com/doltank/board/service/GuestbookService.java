package com.doltank.board.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.appengine.api.users.User;
import com.doltank.board.dao.GuestbookDao;
import com.doltank.board.domain.Greeting;

@Service
public class GuestbookService 
{
	@Autowired
	private GuestbookDao guestbookDao;
	
	public List<Greeting> getList() 
	{
		return guestbookDao.getList();
	}
	
	public void writeGreeting(User user, String content)
	{
		Greeting greeting = new Greeting(user, content, new Date());
		guestbookDao.writeGreeting(greeting);
	}
}
