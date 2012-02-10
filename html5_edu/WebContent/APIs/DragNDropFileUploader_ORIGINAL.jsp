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
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JongKwang_Pocket FileUploader</title>
	<link rel="stylesheet" href="resources/css/DragNDropFileUploader.css" type="text/css" /><%-- File Upload 에서만 사용 --%>
	<script type="text/javascript" src="resources/js/DragNDropFileUploader.js" ></script>
	<script type="text/javascript">
	</script>
</head>

<body>
<form name="myForm" method="post">
	<input type="hidden" name="fileCount" value="0">
</form>
					<%-- ###################  File Upload 시작  ################# --%>
					<div id="file-uploader-demo1" style="width: 600px; float:left;" >
							<p>Please enable JavaScript to use file uploader.</p>
							<!-- or put a simple form for upload here -->
					</div>
				    <script>
						var totalFileCount = 0;
			
				        function createUploader(){
				            var uploader = new qq.FileUploader({
				                element: document.getElementById('file-uploader-demo1'),
				                action: '/html5_edu/DragNDropFileUploaderSvl',
				                sizeLimit: 1024 * 1024 * 200	<%-- 200MB 까지 첨부 가능. sizeLimit 이  모든 브라우져에서 가능한 것은 아니다.(Safari5/Chrome5 에서 성공. IE8에서 실패. 나머지 테스트 필요)--%>
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
</body>
</html>
