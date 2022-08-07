package servlets;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;

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
		try {
			String action = request.getParameter("action");
			
			if (action == null) {
				tourPicture(request, response);
			} else {
				if (action.equalsIgnoreCase("user")) {
					userPicture(request, response);
				}
				if (action.equalsIgnoreCase("userform")) {
					userPictureForm(request, response);
				}
			}
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}	
	}
	
	protected void tourPicture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "http://localhost:8080/Assignment2_Client/pages/tourform.jsp";
		String touridPart = request.getParameter("tourid");
		System.out.println(touridPart + "Start");
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
			    url+= "?pic_url="+fileName;
			    System.out.println("Here 1" + url);
			    if (tourid != 0) {
			    	url += "&tourid=" + tourid;
			    	System.out.println("Here 2" + url);
			    }
			} catch (Exception e) {
				if (tourid != 0) {
			    	url += "?tourid=" + tourid;
			    }
				System.out.println("Here 3" + url);
			} finally {
				System.out.println("Here 4" + url);
				response.sendRedirect(url);
			}
		    
		} else {
			if (tourid != 0) {
		    	url += "?tourid=" + tourid;
		    	System.out.println("Here 5" + url);
		    }
			response.sendRedirect(url);
			System.out.println("Here 6" + url);
		}
	}
	
	protected void userPicture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pictureParam = "";
		Part filePart = request.getPart("picture");
		if (filePart != null) {
			try {
				String fileName = filePart.getSubmittedFileName();
			    String filePath = "D:\\KKZ\\School\\Y2Sem1\\J2EE\\CA2\\JAD-assignment2\\Assignment2_Client\\src\\main\\webapp\\images\\user\\"+ fileName;
			    for (Part part : request.getParts()) {
			      part.write(filePath);
			    }
			    System.out.println(fileName);
			    pictureParam="?picture="+fileName;
			} catch (Exception e) {
				System.out.println("Here 1");
			} finally {		
				response.sendRedirect("/Assignment2_Client/pages/register.jsp" + pictureParam);
				System.out.println("Here 2");
			}
		    
		} else {
			response.sendRedirect("/Assignment2_Client/pages/register.jsp");
			System.out.println("Here 3");
		}
	}
	
	protected void userPictureForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "http://localhost:8080/Assignment2_Client/pages/userform.jsp";
		String useridPart = request.getParameter("userid");
		System.out.println(useridPart + " Start");
		int userid = 0;
		if (!useridPart.equals("-1")) {
			userid = Integer.parseInt(useridPart);
		}
		Part filePart = request.getPart("picture");
		if (filePart != null) {
			try {
				String fileName = filePart.getSubmittedFileName();
			    String filePath = "D:\\KKZ\\School\\Y2Sem1\\J2EE\\CA2\\JAD-assignment2\\Assignment2_Client\\src\\main\\webapp\\images\\user\\"+ fileName;
			    for (Part part : request.getParts()) {
			      part.write(filePath);
			    }
			    url+= "?pic_url="+fileName;
			    System.out.println("Here 1" + url);
			    if (userid != 0) {
			    	url += "&userid=" + userid;
			    	System.out.println("Here 2" + url);
			    }
			} catch (Exception e) {
				if (userid != 0) {
			    	url += "?userid=" + userid;
			    }
				System.out.println("Here 3" + url);
			} finally {
				System.out.println("Here 4" + url);
				response.sendRedirect(url);
			}
		    
		} else {
			if (userid != 0) {
		    	url += "?userid=" + userid;
		    	System.out.println("Here 5" + url);
		    }
			response.sendRedirect(url);
			System.out.println("Here 6" + url);
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
