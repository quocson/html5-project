<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>JQuery Test</title>

<%@ include file="/jsp/common/include/head.jspf" %>

 <style>
    a.test { font-weight: bold; }
 </style>

<script>
	$(document).ready(function() {
		$("#stockPrice").load("http://finance.yahoo.com/q?s=ibm").text();
		
		$("#picture").hide().next().hide();
		$("#showPicture").click(function(){
		   $("#picture").show("fast", function(){
		       $("#picture").next().show();
		   });
		   
		   //class를 제거한다.
		   $("a").removeClass("test");
		});
		
		//class를 추가한다. 
		$("a").addClass("test");
	});
</script>

</head>
<body>
	<input type="text" id="stockPrice" value="" />
	
	<input type="button" id="showPicture">

	<img src="/images/hello.png" id="picture"><span>This is the picture's caption</span>
	
	<a href="#" class="test">gogo</a>

</body>
</html>