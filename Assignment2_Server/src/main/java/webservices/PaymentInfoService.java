package webservices;

import java.io.StringReader;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.stream.JsonParsingException;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.PaymentInfo;
import dbaccess.PaymentInfoDAO;

@Path("/PaymentInfoService")
public class PaymentInfoService {
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAllPayments() {
		ArrayList<PaymentInfo> paymentArr = new ArrayList<>();
		
		try {
			PaymentInfoDAO paymentDB = new PaymentInfoDAO();
			paymentArr = paymentDB.listAllPayments();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		return Response
				.status(Response.Status.OK)
				.entity(paymentArr)
				.build();	 
	}
	
	@PUT
	@Path("/createPayment")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createPayment(String inputData) {
		int rowsAffected = -1;
		String jsonOutput = "";

		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			JsonObject inputJSONObj = jsonReader.readObject();
			
			Integer uid = inputJSONObj.getInt("fk_user_id");
			String name = inputJSONObj.getString("full_name");
			String number = inputJSONObj.getString("phone_number");
			String address = inputJSONObj.getString("address");
			String zip = inputJSONObj.getString("zip");
			Double price = Double.parseDouble(inputJSONObj.getString("payment"));
			
			if (number.length() < 8 ) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\" : \"bad number data\"}")
						.build();
			}
			
			if (zip.length() < 6) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\" : \"bad zip data\"}")
						.build();
			}
			
			PaymentInfoDAO paymentDB = new PaymentInfoDAO();
			rowsAffected = paymentDB.createPayment(uid, name, number, address, zip, price);
			System.out.println(rowsAffected);
			jsonOutput = "{\"rows affected\" : \"" + rowsAffected + "\"" + "}";
			
		} catch (JsonParsingException e) {
			String someError = "{" + "\"error\" : \"bad input data\"" + "}";
			
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
			
		} catch (NullPointerException e) {
			String someError = "{" + "\"error\" : \"bad input data\"," + "\"details\" : \"" + 
								e.toString().replace("java.lang.NullPointerException: ", "") + "}";
			
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
			
		} catch (Exception e) {
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("{\"error\" : \"" + e.toString() + "\"" + "}")
					.build();
		}
		
		return Response
				.status(Response.Status.CREATED)
				.entity(jsonOutput)
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
