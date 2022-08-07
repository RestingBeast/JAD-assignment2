package servlets;

import java.io.IOException;
import java.util.List;

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

import classes.*;

/**
 * Servlet implementation class bookServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String action = request.getParameter("action");

			if (action == null) {
				createPayment(request, response);
				createBooking(request, response);
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e.getMessage());
		}
	}
	
	protected void createPayment(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		double total = 0;
		
		String userId = (String)session.getAttribute("sessUserID");
		if (userId == null || userId.equals("")){
			response.sendRedirect("./error/401.html");
			return;
		}
		
		List<Tour> cart = (List<Tour>) session.getAttribute("cart");
		List<Integer> slotsArr = (List<Integer>) session.getAttribute("slotsArr");
		
		if (cart == null || slotsArr == null) {
			response.sendRedirect("cart.jsp");
			return;
		}
		
		for (int i = 0; i < cart.size(); i++) {
			double bookingPrice = cart.get(i).getPrice() * slotsArr.get(i);
			
			total += bookingPrice;
		}
		
		String name = request.getParameter("firstName") + " " + request.getParameter("lastName");
		String number = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String zip = request.getParameter("zip");
		String paymentStr = "" + total;
		int userid = 0;
		double payment = 0;
		
		try {
			payment = Double.parseDouble(paymentStr);
			userid = Integer.parseInt(userId);
		} catch (NumberFormatException e) {
			response.sendRedirect("/Assignment2_Client/pages/checkout.jsp?errCode=invalidField");
			return;
		}
		
		if (number.length() < 8 || zip.length() < 6) {
			response.sendRedirect("/Assignment2_Client/pages/checkout.jsp?errCode=invalidField");
			return;
		}
		
		JSONObject paymentJSON = new JSONObject();
		paymentJSON.put("fk_user_id", userid);
		paymentJSON.put("full_name", name);
		paymentJSON.put("phone_number", number);
		paymentJSON.put("address", address);
		paymentJSON.put("zip", zip);
		paymentJSON.put("payment", paymentStr);
		
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/PaymentInfoService";
		WebTarget target = client
				.target(restUrl)
				.path("createPayment");
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.put(Entity.entity(paymentJSON, MediaType.APPLICATION_JSON));
		System.out.println("Status: " + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
			System.out.println("Success");
			response.sendRedirect("/Assignment2_Client/pages/checkout.jsp");
		} else {
			System.out.println("Failure");
			response.sendRedirect("/Assignment2_Client/pages/checkout.jsp?errCode=failed");
		}
	}
	
	
	protected void createBooking(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		String userId = (String)session.getAttribute("sessUserID");
		if (userId == null || userId.equals("")){
			response.sendRedirect("./error/401.html");
			return;
		}
		
		List<Tour> cart = (List<Tour>) session.getAttribute("cart");
		List<Integer> slotsArr = (List<Integer>) session.getAttribute("slotsArr");
		PaymentInfo payment = (PaymentInfo) session.getAttribute("payment");
		
		if (cart == null || slotsArr == null) {
			response.sendRedirect("cart.jsp");
			return;
		}
		
		for (int i = 0; i < cart.size(); i++) {
			int slots = slotsArr.get(i);
			int userid = Integer.parseInt(userId);
			int tourid = cart.get(i).getId();
			int paymentid = payment.getId();
			double bookingPrice = cart.get(i).getPrice() * slotsArr.get(i); 
			String priceStr = "" + bookingPrice;
			
			JSONObject bookJSON = new JSONObject();
			bookJSON.put("slots_taken", slots);
			bookJSON.put("fk_user_id", userid);
			bookJSON.put("fk_tour_id", tourid);
			bookJSON.put("fk_payment_id", paymentid);
			bookJSON.put("price", priceStr);
			
			Client client = ClientBuilder.newClient();
			String restUrl = "http://localhost:8080/Assignment2_Server/BookService";
			WebTarget target = client
					.target(restUrl)
					.path("createBooking");
			
			Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
			Response resp = invocationBuilder.put(Entity.entity(bookJSON, MediaType.APPLICATION_JSON));
			System.out.println("Status :" + resp.getStatus());
			
			if(resp.getStatus() == Response.Status.CREATED.getStatusCode()) {
				System.out.println("Success");
			} else {
				System.out.println("Failure");
				response.sendRedirect("/Assignment2_Client/pages/checkout.jsp?errCode=failed");
			}
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
