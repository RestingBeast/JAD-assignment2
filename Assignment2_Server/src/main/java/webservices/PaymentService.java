package webservices;

import java.io.StringReader;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.stream.JsonParsingException;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.*;

public class PaymentService {
	PaymentInfoDAO paymentDB = new PaymentInfoDAO();
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAllPayments() {
		ArrayList<PaymentInfo> paymentArr = new ArrayList<>();
		
		try {
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
			
			int uid = inputJSONObj.getInt("fk_user_id");
			String name = inputJSONObj.getString("full_name");
			String number = inputJSONObj.getString("phone_number");
			String address = inputJSONObj.getString("address");
			String zip = inputJSONObj.getString("zip");
			double price = Double.parseDouble(inputJSONObj.getString("payment"));
			
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
			
			rowsAffected = paymentDB.insertPayment(uid, name, number, address, zip, price);
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
				.status(Response.Status.OK)
				.entity(jsonOutput)
				.build();
	}
}
