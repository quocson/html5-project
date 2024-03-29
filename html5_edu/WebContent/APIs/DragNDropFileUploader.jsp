<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat
				,java.util.Date
				,java.util.Locale" %>
<%!
	/**
	 * 파일명 중복 방지를 위해 일자 기준으로 Unique한 파일명을 생성한다.
	 */
	private String getMaskname() {
		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyyMMdd_HHmmss_SSS_", Locale.KOREA);
		Date currentTime = new Date();
		String dTime = formatter.format(currentTime);
		return dTime;
	}
%>
<%
	String masknamePrefix = getMaskname();	// 첨부파일의 maskname 구성에 씌인다.
%>
<html lang="en">
<head>

      <!-- Meta -->
			<meta charset="UTF-8">
      <title>W3Labs.kr</title>

      <!--[if lt IE 9]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      
      <!-- 공통 CSS -->
      <link rel="stylesheet" href="../resources/css/reset.css" media="all">
      <link rel="stylesheet" href="../resources/css/fonts.css" media="all">
      <link rel="stylesheet" href="../resources/css/style.css" media="all">
      
      <!-- Media Queries -->
      <link rel="stylesheet" href="../resources/css/10col.css" media="only screen and (min-width: 992px)">
      <link rel="stylesheet" href="../resources/css/8col.css" media="only screen and (min-width: 768px) and (max-width: 991px)">
      <link rel="stylesheet" href="../resources/css/3col.css" media="only screen and (max-width: 767px)">
      <link rel="stylesheet" href="../resources/css/5col.css" media="only screen and (min-width: 480px) and (max-width: 767px)">

      <!-- 스마트폰 대응. 최대확대:3배까지 , 확대/축소:가능 -->
      <meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=3.0; user-scalable=yes">
      <!-- Add "maximum-scale=1.0, user-scalable=no" to fix the Mobile Safari auto-zoom bug on orientation changes, but keep in mind that it will disable user-zooming completely. Bad for accessibility. -->   
     
      <!-- 아이콘 16x16 -->
      <link rel="shortcut icon" href="http://w3labs.kr/wp-content/uploads/2011/01/logo_temp.png" type="image/x-icon">
      <link rel="icon" href="http://w3labs.kr/wp-content/uploads/2011/01/logo_temp.png" type="image/x-icon">
      
      <!-- 아이콘 Apple 144x144 -->
      <link rel="apple-touch-icon" sizes="114x114" href="http://w3labs.kr/wp-content/uploads/2011/01/logo_temp.png"> 
      
      <!-- iOS에서 웹페이지를 [홈 화면에 추가] -->
      <meta name="apple-mobile-web-app-capable" content="yes">
      <meta name="apple-mobile-web-app-status-bar-style" content="black">
      <link rel="apple-touch-startup-image" href="http://w3labs.kr/wp-content/uploads/2011/01/logo_temp.png">
                   
      <meta name="description" content="W3Labs.kr Demo & Samples Site">
      <meta name="keywords" content="w3labs.kr html5 sencha touch phonegap">
                 
      <!-- Jquery -->
      <script src="../resources/js/jquery-1.6.1.min.js"></script>
      <script>
      	function init(){
      		$('#thumbs').hide();
      	}
				/*********** 메뉴 List Drag and Drop 소스 코드 시작 *****************/
				function imagesSelected(myFiles) {
				  for (var i = 0, f; f = myFiles[i]; i++) {
					  
				    var imageReader = new FileReader();
				    imageReader.onload = (function(aFile) {
				      return function(e) {
				        var span = document.createElement('span');
				        span.innerHTML = ['<img name="myImg" class="images" src="', e.target.result,'" title="', aFile.name, '" width=200 style="opacity:0; margin:15px;" />'].join('');


			        	document.getElementById('thumbs').insertBefore(span, null);
				        
				        var count = document.getElementsByName('myImg').length;
				        var o = document.getElementsByName('myImg')[count-1];
				        
				        if( count == 1 )
					        $("#thumbs").slideDown(1500, function(){
						          $(o).animate({opacity: 1},2000);
					        });
				        else
			          	$(o).animate({opacity: 1},2000);
				      };
				    })(f);
				    imageReader.readAsDataURL(f);
				  }
				}
				
				function dropIt(e) {  
				   imagesSelected(e.dataTransfer.files); 
				   e.stopPropagation();  
				   e.preventDefault();   
				}  
      </script>
      
      <link rel="stylesheet" href="resources/css/DragNDropFileUploader.css" type="text/css" /><%-- File Upload 에서만 사용 --%>
			<script type="text/javascript" src="resources/js/DragNDropFileUploader.js" ></script>
      
</head>

<body onLoad="init();">
<form name="myForm" method="post" >
	<input type="hidden" name="fileCount" value="0">
</form>
	 <header id="top">
         <h1>w3labs.kr <small>Demo <em>&amp;</em> Samples</small></h1>
         <div id="say_hello">
         	<p>say hello!</p>
            <div id="hello">
         		<a href="mailto:contact@w3labs.kr">contact@w3labs.kr</a>
            	<a href="tel:+07075142739">070.7514.2739</a>
            </div>
         </div>
    </header><!-- end #header -->
		
		<section>
			<p>Hello</p>
			<p>		
				<table width="100%" border="1" cellspacing=0 cellpadding=5>
					<tr bgcolor="#F2F2F2">
						<td class="tableheader" align="left">
							<p>Thumbnail palette</p></td>
					</tr>
					<tr >
						<div id="file-uploader-demo1" style="border: 2px dashed #BBB; text-align:center"  align="left" height="120" >
						</div>
									<%-- ###################  File Upload 시작  ################# --%>
							    <script>
									var totalFileCount = 0;
						
							        function createUploader(){
							            var uploader = new qq.FileUploader({
							                element: document.getElementById('file-uploader-demo1'),
							                action: '/html5_edu/DragNDropFileUploaderSvl',
							                sizeLimit: 1024 * 1024 * 200
							                <%-- 200MB 까지 첨부 가능. sizeLimit 이  모든 브라우져에서 가능한 것은 아니다.(Safari5/Chrome5 에서 성공. IE8에서 실패. 나머지 테스트 필요)--%>
							            <%--allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],	// 첨부파일의 확장자 제한--%>
							            <%--params: { param1: 'param1' , param2: 'param2' }	// 기타 Parameter 를 Servlet 으로 던져야 할때 사용한다.--%>
							            });
							        }
						
							        function getMaskname() {
								        totalFileCount++;	// Maskname 구성할때 Sequence 값으로 사용 된다.
								        document.myForm.fileCount.value = totalFileCount;	// 총 첨부 파일 개수 (Servlet 에서 첨부파일 개수 파악에 쓰인다.)
								        return '<%=masknamePrefix%>'+totalFileCount;
							        }
						
							        window.onload = createUploader;
							    </script>
						    	<%-- ###################  File Upload 끝  ################# --%>
					</tr>
					<tr>
						<td align="center">
							<p>
								Drag & drop or choose images from your local file system
							</p></td>
					</tr>
				</table>
			</p>
		</section>
	
	


	
	
     
    <footer>
     	 
         <a href="#top"><img src="../resources/img/top.jpg" alt="back-to-top"></a>
         <p>Built with HTML5, CSS3, Typekit &amp; Media Queries</p>
         
    </footer><!-- end #footer -->
   
</body></html>
