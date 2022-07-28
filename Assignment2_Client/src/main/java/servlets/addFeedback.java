package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class addFeedback
 */
@WebServlet("/servlets/addFeedback")
public class addFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");	
		try {
			   // Step1: Load JDBC Driver
			   Class.forName("com.mysql.cj.jdbc.Driver");  //can be omitted for newer version of drivers
			
			   // Step 2: Define Connection URL
			   String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			   // Step 3: Establish connection to URL
			   Connection conn = DriverManager.getConnection(connURL); 
			        
			   // Step 4: Create a query string
			   String sqlStr = "INSERT INTO feedback (name, email, phone, subject, message) VALUES (?, ?, ?, ?, ?)";
			        
			   // Step 5: Execute SQL Command
			   PreparedStatement ps = conn.prepareStatement(sqlStr);
			   ps.setString(1, name);
			   ps.setString(2, email);
			   ps.setString(3, phone);
			   ps.setString(4, subject);
			   ps.setString(5, message);
			   int numRowsAffected = ps.executeUpdate();
			   
			   // Step 6: Process Result		        
			   System.out.print("Num rows affected: " + numRowsAffected);
			   
			   // Step 7: Close connection
			   conn.close();
			   if (numRowsAffected == 1) {
				   response.sendRedirect("/Assignment1/pages/contact.jsp?code=created");
			   } else {
				   response.sendRedirect("/Assignment1/pages/contact.jsp?code=failed");
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
