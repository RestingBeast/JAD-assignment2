package servlets;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServeImage
 */
@WebServlet("/ServeImage")
public class ServeImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileNotFoundException {
		// TODO Auto-generated method stub
		String picture = request.getParameter("picture");
		response.setContentType("image/jpeg");
        FileInputStream fis = new FileInputStream("D:\\KKZ\\School\\Y2Sem1\\J2EE\\CA2\\"
        		+ "JAD-assignment2\\Assignment2_Client\\src\\main\\webapp\\images\\tour\\" + picture);
        System.out.println("served");
        fis.transferTo(response.getOutputStream());
        fis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
