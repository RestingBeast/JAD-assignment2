package servlets;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import classes.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * Servlet implementation class addToCart
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			
			if (action == null) {
				doGet_DisplayCart(request, response);
			} else {
				if (action.equalsIgnoreCase("buy")) {
					doGet_Add(request, response);
				} else if (action.equalsIgnoreCase("remove")) {
					doGet_Remove(request, response);
				}
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e.getMessage());
		}
	}

	protected void doGet_DisplayCart(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}
	
	protected void doGet_Add(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("cart") == null) {
			String id = request.getParameter("id");
			int slots = Integer.parseInt(request.getParameter("slots"));
			
			List<Tour> cart = new ArrayList<Tour>();
			List<Integer> slotsArr = new ArrayList<Integer>();
			
			Client client = ClientBuilder.newClient();
			String restUrl = "http://localhost:8080/Assignment2_Server/TourService";
			WebTarget target = client
					.target(restUrl)
					.path("findTourById")
					.queryParam("tourid", id);
			Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
			Response resp = invocationBuilder.get();
			System.out.println(id);
			System.out.println("Status: " + resp.getStatus());
			
			if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
				System.out.println("success");
				
				Tour tour = resp.readEntity(Tour.class);
				if (tour != null) {
					System.out.println("Id: " + tour.getId());
					System.out.println("Name: " + tour.getName());
					System.out.println("Price: " + tour.getPrice());
					System.out.println("Slots: " + tour.getSlots());
					
					cart.add(tour);
					slotsArr.add(slots);
					session.setAttribute("cart", cart);
					session.setAttribute("slots", slotsArr);
				} else {
					System.out.println("idk");
				}
			} else {
				System.out.println("failed1");
			}
		} else {
			@SuppressWarnings("unchecked")
			List<Tour> cart = (List<Tour>) session.getAttribute("cart");
			List<Integer> slotsArr = new ArrayList<Integer>();
			
			int slots = Integer.parseInt(request.getParameter("slots"));
			int index = isExisting(request.getParameter("id"), cart);
			
			if (index == -1) {
				Client client = ClientBuilder.newClient();
				String restUrl = "http://localhost:8080/Assignment2_Server/TourService";
				WebTarget target = client
						.target(restUrl)
						.path("findTourById")
						.queryParam("tourid", index);
				Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
				Response resp = invocationBuilder.get();
				
				if (resp.getStatus() == Response.Status.OK.getStatusCode()) {
					System.out.println("success");
					
					Tour tour = resp.readEntity(Tour.class);
					if (tour != null) {
						System.out.println("Id: " + tour.getId());
						System.out.println("Name: " + tour.getName());
						System.out.println("Price: " + tour.getPrice());
						System.out.println("Slots: " + tour.getSlots());
						
						cart.add(tour);
						slotsArr.add(slots);
					} else {
						System.out.println("idk");
					}
				} else {
					System.out.println("failed2");
				}
			} else {
				int updatedSlots = slotsArr.get(index) + slots;
				slotsArr.set(index, updatedSlots);
			}
			
			session.setAttribute("cart", cart);
			session.setAttribute("slots", slotsArr);
		}
		
		response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
	}
	
	protected void doGet_Remove(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<Tour> cart = (List<Tour>) session.getAttribute("cart");
		
		int index = isExisting(request.getParameter("id"), cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath() + "/pages/cart.jsp");
	}
	
	private int isExisting(String id, List<Tour> cart) {
		for (int i = 0; i < cart.size(); i++) {
			String index = "" + cart.get(i).getId();
			if (index.equalsIgnoreCase(id)) {
				return i;
			}
		}
		return -1;
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
