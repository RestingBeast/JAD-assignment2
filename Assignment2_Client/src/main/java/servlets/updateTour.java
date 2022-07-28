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
 * Servlet implementation class UpdateTour
 */
@WebServlet("/servlets/updateTour")
public class updateTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateTour() {
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
		String tour = request.getParameter("tour");
		String b_desc = request.getParameter("brief_desc");
		String d_desc = request.getParameter("detailed_desc");
		String priceStr = request.getParameter("price");
		String slotsStr = request.getParameter("slots");
		String categoryStr = request.getParameter("category");
		String picture = request.getParameter("picture");
		int slots = 0, category = 0;
		double price = 0;
		try {
			price = Double.parseDouble(priceStr);
			slots = Integer.parseInt(slotsStr);
			category = Integer.parseInt(categoryStr);
			Class.forName("com.mysql.jdbc.Driver");
			String connURL = "jdbc:mysql:// localhost:3306/assignment1?user=root&password=owlciitty&serverTimezone=UTC";
			Connection conn = DriverManager.getConnection(connURL);
			String sqlStr = "UPDATE tour SET tour = ?, brief_desc = ?, detailed_desc = ?, price = ?, slots = ?, fk_category_id = ?,"
					+ " tour_pic_url = ? WHERE tourid = ?";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, tour);
			ps.setString(2, b_desc);
			ps.setString(3, d_desc);
			ps.setDouble(4, price);
			ps.setInt(5, slots);
			ps.setInt(6, category);
			ps.setString(7, picture);
			ps.setInt(8, tourid);
			int numRowsAffected = ps.executeUpdate();
			System.out.println(numRowsAffected);
			conn.close();
			if (numRowsAffected == 1) {
				response.sendRedirect("/Assignment1/pages/managetours.jsp");
			} else {
				response.sendRedirect("/Assignment1/pages/tourform.jsp?errCode=failed&tourid=" + tourid);
			}
		} catch (NumberFormatException e) {
			response.sendRedirect("/Assignment1/pages/tourform.jsp?errCode=invalidField&tourid=" + tourid);
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
