package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class deleteTour
 */
@WebServlet("/servlets/deleteTour")
public class deleteTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteTour() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment1/pages/error/401.html");
			return;
		}
		
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=owlciitty&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			String sqlStr = "DELETE FROM tour WHERE tourid = ?";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, tourid);
			int numRowsAffected = ps.executeUpdate();
			System.out.println(numRowsAffected);
			conn.close();
			response.sendRedirect("/Assignment1/pages/managetours.jsp");
		} catch(Exception e) {
			System.out.println("Exception: " + e);
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
