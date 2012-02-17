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
		
		$('a.doSomething').click(function(){
			    //alert('You did something, woo hoo!');
			    var now = new Date();
				if(now.getHours() >= 12)
				{
				    debugger;
				    var goodDay = $('p[title="Good Day Message1"]');
				    goodDay.text('Good Afternoon!');
				}
		});
		greeting();
	});
	
	function greeting() {
		var now = new Date();
		if(now.getHours() >= 12)
		{
		    var goodDay = $('p[title="Good Day Message"]');
		    goodDay.text('Good Afternoon!');
		}
	}	
</script>

</head>
<body>
	<input type="text" id="stockPrice" value="" />
	
	<a href="#" class="doSomething">Click!</a>
	
	<p title="Good Day Message">Good Morning!</p>
	
	<p title="Good Day Message1">Good Morning!</p>
	
	<input type="button" id="showPicture">

	<img src="/images/hello.png" id="picture"><span>This is the picture's caption</span>
	
	<a href="#" class="test">gogo</a>

</body>
</html>