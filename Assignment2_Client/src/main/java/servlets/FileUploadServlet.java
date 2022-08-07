package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String url = "http://localhost:8080/Assignment2_Client/pages/tourform.jsp";
		String touridPart = request.getParameter("tourid");
		System.out.println(touridPart);
		int tourid = 0;
		if (!touridPart.equals("-1")) {
			tourid = Integer.parseInt(touridPart);
		}
		Part filePart = request.getPart("picture");
		if (filePart != null) {
			try {
				String fileName = filePart.getSubmittedFileName();
			    String filePath = "D:\\KKZ\\School\\Y2Sem1\\J2EE\\CA2\\JAD-assignment2\\Assignment2_Client\\src\\main\\webapp\\images\\tour\\"+ fileName;
			    for (Part part : request.getParts()) {
			      part.write(filePath);
			    }
			    if (tourid != 0) {
			    	url += "&tourid=" + tourid;
			    }
			} catch (Exception e) {
				if (tourid != 0) {
			    	url += "?tourid=" + tourid;
			    }
			} finally {
				
				response.sendRedirect(url);
			}
		    
		} else {
			if (tourid != 0) {
		    	url += "?tourid=" + tourid;
		    }
			response.sendRedirect(url);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
