package com.doltank.board.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doltank.board.dao.BoardDao;
import com.doltank.board.domain.Board;
import com.google.appengine.api.users.User;

@Service
public class BoardService 
{
	@Autowired
	private BoardDao boardDao;
	
	public List<Board> getList(String boardType) 
	{
		return boardDao.getList(boardType);
	}
	
	public void writeBoard(User user, String boardType, String content)
	{
		Board board = new Board(user, boardType, content, new Date());
		boardDao.writeBoard(board);
	}
}
