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
import javax.ws.rs.core.Response;

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
		Integer uid = Integer.parseInt(request.getParameter("fk_user_id"));
		Integer tid = Integer.parseInt(request.getParameter("fk_tour_id"));
		Integer rid = Integer.parseInt(request.getParameter("review_id"));
		
		Review review = new Review();
		review.setTourid(tid);
		review.setUserid(uid);
		review.setId(rid);
		
		try {
			Integer rating = Integer.parseInt(request.getParameter("rating"));
			
			review.setRating(rating);
			
		} catch (NumberFormatException e) {
			request.setAttribute("err", "Invalid Rating");
		}
		
		String reviewDesc = request.getParameter("review_desc");
		
		if (reviewDesc == null) {
			request.setAttribute("err", "Invalid Review Message");
			
			review.setReviewDesc(reviewDesc);
		}
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/ReviewService";
		WebTarget target = client
				.target(restUrl)
				.path("createReview");
		Invocation.Builder invocationBuilder = target.request();
		Response resp = invocationBuilder.put(Entity.json(review));
		System.out.println("Status: " + resp.getStatus());
		
		if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("success");
			Integer row = resp.readEntity(Integer.class);
			
			request.setAttribute("rowsAffected", row);
		} else {
			System.out.println("failed");
			
			request.setAttribute("err", "NotFound");
		}
		
		String url = "index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
