package com.doltank.board.dao;

import java.util.List;

import javax.jdo.PersistenceManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jdo.support.JdoDaoSupport;
import org.springframework.stereotype.Repository;

import com.doltank.board.domain.Greeting;

@Repository
public class GuestbookDao extends JdoDaoSupport
{
	@Autowired
	public GuestbookDao(PersistenceManagerFactory pmf)
	{
		setPersistenceManagerFactory(pmf);
	}
	
	@SuppressWarnings("unchecked")
	public List<Greeting> getList() 
	{
		String query = "select from " + Greeting.class.getName() + " where boardType == '2' order by date desc range 0,5";
		return (List<Greeting>) getPersistenceManager().newQuery(query).execute();
	}
	
	public void writeGreeting(Greeting greeting)
	{
		getJdoTemplate().makePersistent(greeting);
	}
}
