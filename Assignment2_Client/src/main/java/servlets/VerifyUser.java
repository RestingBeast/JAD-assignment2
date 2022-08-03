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
 * Servlet implementation class verfifyUser
 */
@WebServlet("/servlets/VerifyUser")
public class VerifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// create session if one doesn't exist
		HttpSession session = request.getSession(true);
		
		String role = "";
		String id = "";
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		System.out.println(email);
		System.out.println(pwd);
		
		try {
			   // Step1: Load JDBC Driver
			   Class.forName("com.mysql.cj.jdbc.Driver");
			
			   // Step 2: Define Connection URL
			   String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			   // Step 3: Establish connection to URL
			   Connection conn = DriverManager.getConnection(connURL); 
			        
			   // Step 4: Create a query string
			   String sqlStr = "SELECT * FROM user WHERE email = ? AND password = ?";
			        
			   // Step 5: Execute SQL Command
			   PreparedStatement ps = conn.prepareStatement(sqlStr);
			   ps.setString(1, email);
			   ps.setString(2, pwd);
			   ResultSet rs = ps.executeQuery();
			   boolean userFound = false;
			   // Step 6: Process Result		        
			   if (rs.next()) {	
				   	userFound = true;
					id = rs.getString("userid");
					role = rs.getString("role");
					session.setAttribute("sessUserID", id);
					session.setAttribute("sessRole", role);				
			   }
			// Step 7: Close connection
			   conn.close();
			   
			   if (userFound) {
				   if (role.equals("Admin")) {
					   response.sendRedirect("/Assignment2_Client/pages/managetours.jsp");
				   } else {
					   response.sendRedirect("/Assignment2_Client/pages/index.jsp");
				   }
			   } else {
				   response.sendRedirect("/Assignment2_Client/pages/login.jsp?code=invalidLogin");
			   }
			   
			} catch (Exception e) {
					System.out.print("Exception: " + e);
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
