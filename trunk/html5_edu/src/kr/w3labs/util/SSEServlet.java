package kr.w3labs.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SSEServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res)
	    throws IOException, ServletException {
	PrintWriter out = res.getWriter();

	res.setContentType("text/event-stream");
	res.setCharacterEncoding("utf-8");
	
	out.write("retry: 5000"); // 트위터와 같게 60초로 설정
	out.write("\n");
	out.write("\n");
	out.write("data: " + getTime() );
	out.flush();

	out.close();

    }
    
    private String getTime() {
        Calendar oCalendar = Calendar.getInstance( );  // 현재 날짜/시간 등의 각종 정보 얻기
        
        String time = oCalendar.get(Calendar.HOUR_OF_DAY) + ":" + oCalendar.get(Calendar.MINUTE) + ":" + oCalendar.get(Calendar.SECOND);

        return time;
    }

}
