package com.doltank.board.dao;

import java.util.List;

import javax.jdo.PersistenceManagerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.jdo.support.JdoDaoSupport;
import org.springframework.stereotype.Repository;

import com.doltank.board.domain.Board;

@Repository
public class BoardDao extends JdoDaoSupport
{
	@Autowired
	public BoardDao(PersistenceManagerFactory pmf)
	{
		setPersistenceManagerFactory(pmf);
	}
	
	@SuppressWarnings("unchecked")
	public List<Board> getList(String boardType) 
	{
		String query = "select from " + Board.class.getName() + " where boardType == '" + boardType +"' order by date desc range 0,5";
		return (List<Board>) getPersistenceManager().newQuery(query).execute();
	}
	
	public void writeBoard(Board board)
	{
		getJdoTemplate().makePersistent(board);
	}
}
