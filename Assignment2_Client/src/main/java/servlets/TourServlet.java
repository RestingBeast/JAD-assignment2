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
 * Servlet implementation class TourServlet
 */
@WebServlet("/TourServlet")
public class TourServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TourServlet() {
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
				createTour(request, response);
			} else {
				if (action.equalsIgnoreCase("update")) {
					updateTour(request, response);
				} else if (action.equalsIgnoreCase("delete")) {
					deleteTour(request, response);
				}
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e.getMessage());
		}
	}
	
	protected void createTour(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		String tour = request.getParameter("tour");
		String b_desc = request.getParameter("brief_desc");
		String d_desc = request.getParameter("detailed_desc");
		String priceStr = request.getParameter("price");
		String slotsStr = request.getParameter("slots");
		String categoryStr = request.getParameter("category");
		String picture = request.getParameter("pic_url");
		int slots = 0, category = 0;
		double price = 0;
		
		try {
			   price = Double.parseDouble(priceStr);
			   slots = Integer.parseInt(slotsStr);
			   category = Integer.parseInt(categoryStr);   
		} catch (NumberFormatException e){
				response.sendRedirect("/Assignment2_Client/pages/tourform.jsp?errCode=invalidField");
				return;
		}
		JSONObject tourJSON = new JSONObject();
		tourJSON.put("tour", tour);
		tourJSON.put("brief_desc", b_desc);
		tourJSON.put("detailed_desc", d_desc);
		tourJSON.put("price", priceStr);
		tourJSON.put("slots", slots);
		tourJSON.put("fk_category_id", category);
		tourJSON.put("tour_pic_url", picture);
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/TourService";
		WebTarget target = client
				.target(restUrl)
				.path("createTour");
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(tourJSON, MediaType.APPLICATION_JSON));
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managetours.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/tourform.jsp?errCode=failed");;
		}
	}
	
	protected void updateTour(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		String tour = request.getParameter("tour");
		String b_desc = request.getParameter("brief_desc");
		String d_desc = request.getParameter("detailed_desc");
		String priceStr = request.getParameter("price");
		String slotsStr = request.getParameter("slots");
		String categoryStr = request.getParameter("category");
		String picture = request.getParameter("pic_url");
		int slots = 0, category = 0;
		double price = 0;
		
		try {
			   price = Double.parseDouble(priceStr);
			   slots = Integer.parseInt(slotsStr);
			   category = Integer.parseInt(categoryStr);   
		} catch (NumberFormatException e){
				response.sendRedirect("/Assignment2_Client/pages/tourform.jsp?errCode=failed&tourid=" + tourid);
				return;
		}
		JSONObject tourJSON = new JSONObject();
		tourJSON.put("tour", tour);
		tourJSON.put("brief_desc", b_desc);
		tourJSON.put("detailed_desc", d_desc);
		tourJSON.put("price", priceStr);
		tourJSON.put("slots", slots);
		tourJSON.put("fk_category_id", category);
		tourJSON.put("tour_pic_url", picture);
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/TourService";
		WebTarget target = client
				.target(restUrl)
				.path("updateTour")
				.queryParam("tourid", tourid);
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(tourJSON, MediaType.APPLICATION_JSON));
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managetours.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/tourform.jsp?errCode=failed&tourid=" + tourid);;
		}
	}
	
	protected void deleteTour(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		String role = (String)session.getAttribute("sessRole");
		System.out.println(userId + role);
		if (role == null || !role.equals("Admin")){
			response.sendRedirect("/Assignment2_Client/pages/error/401.html");
			return;
		}
		
		int tourid = Integer.parseInt(request.getParameter("tourid"));
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/TourService";
		WebTarget target = client
				.target(restUrl)
				.path("deleteTour")
				.queryParam("tourid", tourid);
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.delete();
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/managetours.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/mangetour.jsp");;
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
