<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
<title>Spring Guestbook</title>
</head>
<body>
<p>
<c:choose>
	<c:when test="${nickname != null}">
		Hello, ${nickname}! (You can <a href="${userUrl}">Sign out</a>.)
	</c:when>
	<c:otherwise>
		Hello! <a href="${userUrl}">Sign in</a>
		to include your name with greetings you post.
	</c:otherwise>
</c:choose>
</p>
<c:choose>
	<c:when test="${count == 0}">
		<p>The guestbook has no messages.</p>
	</c:when>
	<c:otherwise>
		<c:forEach var="greetings" items="${greetings}">
			<c:choose>
				<c:when test="${greetings.author == null}">
					<p>An anonymous person wrote:</p>
				</c:when>
				<c:otherwise>
					<p><b>${greetings.author.nickname}</b> wrote:</p>
				</c:otherwise>
			</c:choose>
			<blockquote>${greetings.content}</blockquote>
		</c:forEach>
	</c:otherwise>
</c:choose>

<form action="/guestbook.do" method="post">
	<div><textarea name="content" rows="3" cols="60"></textarea></div>
  	<div><input type="submit" value="Post Greeting" /></div>
</form>
</body>
</html>