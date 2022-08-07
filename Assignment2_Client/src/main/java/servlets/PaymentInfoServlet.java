package servlets;

import java.util.ArrayList;
import classes.PaymentInfo;

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
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * Servlet implementation class PaymentInfoServlet
 */
@WebServlet("/PaymentInfoServlet")
public class PaymentInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(true);
		String address = request.getParameter("address");
		ArrayList<PaymentInfo>plist = new ArrayList<PaymentInfo>();
		Client client = ClientBuilder.newClient();
		String restUrl = "http://localhost:8080/Assignment2_Server/PaymentInfoService";
		WebTarget target = client
				.target(restUrl)
				.path("searchByAddress")
				.queryParam("address", address);
		
		Invocation.Builder invocationBuilder = target.request(MediaType.APPLICATION_JSON);
		Response resp = invocationBuilder.get();
		System.out.println("Status :" + resp.getStatus());
		
		if(resp.getStatus() == Response.Status.OK.getStatusCode()) {
			System.out.println("Successful Retrieval");
			plist = resp.readEntity(new GenericType<ArrayList<PaymentInfo>>() {});
			session.setAttribute("paymentInfoList", plist);
			response.sendRedirect("/Assignment2_Client/pages/sortbyaddress.jsp");
		} else {
			response.sendRedirect("/Assignment2_Client/pages/sortbyaddress.jsp?errCode=Failed");
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
