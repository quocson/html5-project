package com.doltank.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NotificationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void service(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException {
	
        PrintWriter out = res.getWriter();
        System.out.println("Notification has occurred~~!!" + req.getCharacterEncoding() + "/" + res.getCharacterEncoding());

    	res.setContentType("text/event-stream");
    	res.setCharacterEncoding("utf-8");
    	out.write("retry: 5000"); // 5초마다 호출 
    	out.write("\n");
    	out.write("\n");
    	out.write("data: " + getTime() );
    	out.flush();
    	out.close();
    
        }
    
    private String getTime() {
        Calendar oCalendar = Calendar.getInstance( );  
        
        String time = oCalendar.get(Calendar.HOUR_OF_DAY) + ":" + oCalendar.get(Calendar.MINUTE) + ":" + oCalendar.get(Calendar.SECOND);

        return time;
    }

}
