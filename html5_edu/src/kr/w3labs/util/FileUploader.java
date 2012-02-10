package kr.w3labs.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;

/**
 * Reads an <code>application/octet-stream</code> and writes it to a file.
 * @author John Yeary <jyeary@bluelotussoftware.com>
 * @author Allan O'Driscoll
 * @version 1.0
 */
public class FileUploader extends HttpServlet {

    private static final long serialVersionUID = 6748857432950840322L;
    private static final String DESTINATION_DIR_PATH = "files";
    private static String realPath;
	private static final String FILE_UPLOAD_PATH = "/eclipse_w3labskr";

    /**
     * {@inheritDoc}
     * @param config
     * @throws ServletException
     */
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        realPath = getServletContext().getRealPath(DESTINATION_DIR_PATH) + "/";
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {

        PrintWriter writer = null;
        InputStream is = null;
        FileOutputStream fos = null;

        try {
            writer = response.getWriter();
        } catch (IOException ex) {
            log(FileUploader.class.getName() + "has thrown an exception: " + ex.getMessage());
        }

        String maskname = request.getParameter("maskname");
        String fileName = request.getParameter("qqfile");
        String fileName2 = request.getHeader("X-File-Name");

		String filePath = FILE_UPLOAD_PATH + "/" + maskname;
		System.out.println("file name = " + fileName  + " / " + fileName2); 
		System.out.println(realPath);
		
        try {
            is = request.getInputStream();
            fos = new FileOutputStream(new File(realPath + fileName));
            IOUtils.copy(is, fos);
            response.setStatus(response.SC_OK);
            writer.print("{success: true}");
        } catch (FileNotFoundException ex) {
            response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
            writer.print("{success: false}");
            log(FileUploader.class.getName() + "has thrown an exception: " + ex.getMessage());
        } catch (IOException ex) {
            response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
            writer.print("{success: false}");
            log(FileUploader.class.getName() + "has thrown an exception: " + ex.getMessage());
        } finally {
            try {
                fos.close();
                is.close();
            } catch (IOException ignored) {
            }
        }

        writer.flush();
        writer.close();
    }
}