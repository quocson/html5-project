package com.doltank.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.doltank.board.domain.Board;
import com.doltank.board.domain.Greeting;
import com.doltank.board.service.BoardService;
import com.doltank.board.service.GuestbookService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
    private GuestbookService guestbookService;
	
	@Autowired
	private UserService userService;
	
	// 게시판 
	@RequestMapping(value="/board.do", method=RequestMethod.GET)
	public String getBoardController(
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model)
	{
		User user = userService.getCurrentUser();
		List<Board> boards = boardService.getList();
		
		if (user != null)
		{
			model.addAttribute("nickname", user.getNickname());
			model.addAttribute("userUrl", userService.createLogoutURL(request.getRequestURI()));
		}
		else
		{
			model.addAttribute("nickname", null);
			model.addAttribute("userUrl", userService.createLoginURL(request.getRequestURI()));
		}
		model.addAttribute("count", boards.size());
		model.addAttribute("boards", boards);
		
		return "board";
	}
	
	// 게시판 저장
	@RequestMapping(value="/board.do", method=RequestMethod.POST)
	public String postBoardController(String boardType, String content)
	{
		boardService.writeBoard(userService.getCurrentUser(), boardType, content);
		return "redirect:board.do";
	}

   // 방명록 
    @RequestMapping(value="/guestbook.do", method=RequestMethod.GET)
    public String getGuestbookController(
            HttpServletRequest request,
            HttpServletResponse response,
            ModelMap model)
    {
        User user = userService.getCurrentUser();
        List<Greeting> greetings = guestbookService.getList();
        
        if (user != null)
        {
            model.addAttribute("nickname", user.getNickname());
            model.addAttribute("userUrl", userService.createLogoutURL(request.getRequestURI()));
        }
        else
        {
            model.addAttribute("nickname", null);
            model.addAttribute("userUrl", userService.createLoginURL(request.getRequestURI()));
        }
        model.addAttribute("count", greetings.size());
        model.addAttribute("greetings", greetings);
        
        return "guestbook";
    }
    
    // 방명록 저장 
    @RequestMapping(value="/guestbook.do", method=RequestMethod.POST)
    public String postGuestbookController(String content)
    {
        guestbookService.writeGreeting(userService.getCurrentUser(), content);
        return "redirect:guestbook.do";
    }
}
