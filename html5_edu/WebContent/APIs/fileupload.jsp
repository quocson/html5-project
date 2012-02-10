<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
    <style>    	
		body {font-size:13px; font-family:arial, sans-serif; width:700px; margin:100px auto;}
    </style>	
	<link rel="stylesheet" href="resources/css/DragNDropFileUploader.css" type="text/css" /><%-- File Upload 에서만 사용 --%>
	<script type="text/javascript" src="resources/js/DragNDropFileUploader.js" ></script>    
</head>
<body>		
    <p><a href="http://github.com/valums/file-uploader">Back to project page</a></p>
    
	<p>To upload a file, click on the button below. Drag-and-drop is supported in FF, Chrome.</p>
	<p>Progress-bar is supported in FF3.6+, Chrome6+, Safari4+</p>
	
	<div id="file-uploader-demo1">		
		<noscript>			
			<p>Please enable JavaScript to use file uploader.</p>
			<!-- or put a simple form for upload here -->
		</noscript>         
	</div>
    
    
    <script>        
        function createUploader(){            
            var uploader = new qq.FileUploader({
                element: document.getElementById('file-uploader-demo1'),
                action: '/html5_edu/FileUploader',
                debug: true
            });           
        }
        
        // in your app create uploader as soon as the DOM is ready
        // don't wait for the window to load  
        window.onload = createUploader;     
    </script>    
</body>
</html>