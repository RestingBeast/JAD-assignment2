package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addUser
 */
@WebServlet("/servlets/AddUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());		
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		String pic_url = request.getParameter("pic_url");
		
		System.out.println(username);
		System.out.println(email);
		System.out.println(pwd);
		
		try {
			   // Step1: Load JDBC Driver
			   Class.forName("com.mysql.cj.jdbc.Driver");  //can be omitted for newer version of drivers
			
			   // Step 2: Define Connection URL
			   String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			   // Step 3: Establish connection to URL
			   Connection conn = DriverManager.getConnection(connURL); 
			        
			   // Step 4: Create a query string
			   String sqlStr = "INSERT INTO user (username, email, password, role, profile_pic_url) VALUES (?, ?, ?, 'Member', ?)";
			        
			   // Step 5: Execute SQL Command
			   PreparedStatement ps = conn.prepareStatement(sqlStr);
			   ps.setString(1, username);
			   ps.setString(2, email);
			   ps.setString(3, pwd);
			   ps.setString(4, pic_url);
			   int numRowsAffected = ps.executeUpdate();
			   
			   // Step 6: Process Result		        
			   System.out.print("Num rows affected: " + numRowsAffected);
			   
			   // Step 7: Close connection
			   conn.close();
			   if (numRowsAffected == 1) {
				   response.sendRedirect("/Assignment1/pages/login.jsp?code=created");
			   } else {
				   response.sendRedirect("/Assignment1/pages/register.jsp?errCode=failed");
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
