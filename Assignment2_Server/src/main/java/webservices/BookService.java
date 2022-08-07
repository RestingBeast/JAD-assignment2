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

public class BookService {
	TourDAO tourDB = new TourDAO();
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAllBookings() {
		ArrayList<Booking> bookArr = new ArrayList<>();
		
		try {
			BookingDAO bookDB = new BookingDAO();
			bookArr = bookDB.listAllBookings();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		return Response
				.status(Response.Status.OK)
				.entity(bookArr)
				.build();	 
	}
	
	@PUT
	@Path("/createBooking")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createBooking(String inputData) {
		int rowsAffected = -1;
		String jsonOutput = "";

		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			// this statement can cause the JsonParsingException error
			JsonObject inputJSONObj = jsonReader.readObject();
			
			Integer slotsTaken = inputJSONObj.getInt("slots_taken");
			Integer uid = inputJSONObj.getInt("fk_user_id");
			Integer tid = inputJSONObj.getInt("fk_tour_id");
			Integer pid = inputJSONObj.getInt("fk_payment_id");
			Double price = Double.parseDouble(inputJSONObj.getString("price"));
			
			if (slotsTaken < 0 || slotsTaken < 5) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\" : \"bad rating data\"}")
						.build();
			}
			
			BookingDAO bookDB = new BookingDAO();
			rowsAffected = bookDB.createBooking(slotsTaken, uid, tid, pid, price);
			jsonOutput = "{\"rows affected\" : \"" + rowsAffected + "\"" + "}";
			
		} catch (JsonParsingException e) {
			String someError = "{" + "\"error\" : \"bad input data\"" + "}";
			
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
			
		} catch (NullPointerException e) {
			String someError = "{" + "\"error\" : \"bad input date\"," + "\"details\" : \"" + 
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
}
