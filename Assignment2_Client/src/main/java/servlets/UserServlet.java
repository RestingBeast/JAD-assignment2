package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.jose4j.json.internal.json_simple.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
				createUser(request, response);
			} else {
				if (action.equalsIgnoreCase("update")) {
					updateUser(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					deleteUser(request, response);
				}
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e.getMessage());
		}
	}
	
	protected void createUser(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String roleF = request.getParameter("role");
		String pic_url = request.getParameter("pic_url");
		System.out.print(roleF);
		
		JSONObject userJSON = new JSONObject();
		userJSON.put("username", username);
		userJSON.put("email", email);
		userJSON.put("password", password);
		userJSON.put("role", roleF);
		userJSON.put("profile_pic_url", pic_url);
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
		WebTarget target = client
				.target(restUrl)
				.path("createUser");
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(userJSON, MediaType.APPLICATION_JSON));
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managecustomers.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/userform.jsp?errCode=failed");;
		}
	}
	
	protected void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String roleF = request.getParameter("role");
		String pic_url = request.getParameter("pic_url");
		System.out.println(roleF);
		
		JSONObject userJSON = new JSONObject();
		userJSON.put("username", username);
		userJSON.put("email", email);
		userJSON.put("password", password);
		userJSON.put("role", roleF);
		userJSON.put("profile_pic_url", pic_url);
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
		WebTarget target = client
				.target(restUrl)
				.path("updateUser")
				.queryParam("userid", userid);
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(userJSON, MediaType.APPLICATION_JSON));
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managecustomers.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/userform.jsp?errCode=failed&userid=" + userid);;
		}
	}
	
	protected void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/UserService";
		WebTarget target = client
				.target(restUrl)
				.path("deleteUser")
				.queryParam("userid", userid);
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.delete();
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managecustomers.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/mangecustomers.jsp");;
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
