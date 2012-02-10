package kr.w3labs.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DragNDropFileUploaderSvl
 */
public class DragNDropFileUploaderSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	private static final String FILE_UPLOAD_PATH = "/eclipse_w3labs";
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// File 의 물리적 Upload
		fileUpload(request, response);
		
	}

	private void fileUpload(HttpServletRequest request,
			HttpServletResponse response) throws IOException  {
		
		String maskname = request.getParameter("maskname");
		String fileName = request.getParameter("X-File-Name");
		String fileCount = request.getParameter("fileCount");
		System.out.println(">>>>" + fileName + " >>" + maskname + " >>" + fileCount);
		String filePath = FILE_UPLOAD_PATH + "/" + maskname;
		
		File file = new File(filePath);
		
		FileOutputStream outputStream = null;
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		PrintWriter out = null;
		
		try{
			outputStream = new FileOutputStream(file);
			bin = new BufferedInputStream(request.getInputStream());
			bout = new BufferedOutputStream(outputStream);
			
			int bytesRead = 0;
			byte[] buffer = new byte[1024];
			while ((bytesRead = bin.read(buffer, 0, 1024)) != -1) {
				bout.write(buffer, 0, bytesRead);
			}
			
			out = response.getWriter();
			out.println("{success:true}");
			
		} finally {
			bout.close();
			bin.close();
			outputStream.close();
			out.close();
		}
	}
}
