package webservices;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.Tour;
import dbaccess.TourDAO;
import dbaccess.PaymentInfo;
import dbaccess.PaymentInfoDAO;

@Path("/PaymentInfoService")
public class PaymentInfoService {
	@GET
	@Path("/getPaymentInfo")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getUserInfo(@QueryParam("userid") String useridStr) {
		int userid = Integer.parseInt(useridStr);
		PaymentInfo u = new PaymentInfo();
		try {
			PaymentInfoDAO db = new PaymentInfoDAO();
			u = db.findById(userid);
		} catch(Exception e) {
			System.out.println("Exception : " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(u)
				.build();
	}
	
	@GET
	@Path("/searchByAddress")
	@Produces(MediaType.APPLICATION_JSON)
	public Response serachPaymentInfo(@QueryParam("address") String address) {
		ArrayList<PaymentInfo> pInfos = new ArrayList<PaymentInfo>();
		try {
			PaymentInfoDAO db = new PaymentInfoDAO();
			pInfos = db.findByAddress(address);
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(pInfos)
				.build();
	}
}
