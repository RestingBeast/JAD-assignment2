package servlets;

import java.io.IOException;

import classes.Review;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.jose4j.json.internal.json_simple.JSONObject;

/**
 * Servlet implementation class addReview
 */
@WebServlet("/addReview")
public class addReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uidStr = request.getParameter("fk_user_id");
		String tidStr = request.getParameter("fk_tour_id");
		String ratingStr = request.getParameter("rating");
		String message = request.getParameter("message");
		
		JSONObject reviewJSON = new JSONObject();
		Integer rating = 0, uid = 0, tid = 0;
		
		try {
			rating = Integer.parseInt(ratingStr);
			uid = Integer.parseInt(uidStr);
			tid = Integer.parseInt(tidStr);
			
			
		} catch (NumberFormatException e) {
			response.sendRedirect("http://localhost:8080/Assignment2_Client/pages/tour-details.jsp?tourid=" + tidStr + "&err=InvalidRating");
			return;
		}
		
		reviewJSON.put("fk_user_id", uid);
		reviewJSON.put("fk_tour_id", tid);
		reviewJSON.put("rating", rating);
		reviewJSON.put("review_desc", message);
		
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/ReviewService";
		WebTarget target = client
				.target(restUrl)
				.path("createReview");
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(reviewJSON, MediaType.APPLICATION_JSON));
		
		if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("success");
			response.sendRedirect("http://localhost:8080/Assignment2_Client/pages/tour-details.jsp?tourid=" + tidStr);
		} else {
			System.out.println("failed");
			response.sendRedirect("http://localhost:8080/Assignment2_Client/pages/tour-details.jsp?tourid=" + tidStr + "&err=Notfound");
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
