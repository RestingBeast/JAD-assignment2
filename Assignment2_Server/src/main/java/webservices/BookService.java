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
	BookingDAO bookDB = new BookingDAO();
	
	@GET
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listAllBookings() {
		ArrayList<Booking> bookArr = new ArrayList<>();
		
		try {
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
			
			int slotsTaken = inputJSONObj.getInt("slots_taken");
			int uid = inputJSONObj.getInt("fk_user_id");
			int tid = inputJSONObj.getInt("fk_tour_id");
			double price = inputJSONObj.getInt("price");
			
			if (slotsTaken < 0 || slotsTaken < 5) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\" : \"bad rating data\"}")
						.build();
			}
			
			rowsAffected = bookDB.insertBooking(slotsTaken, uid, tid, price);
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
				.status(Response.Status.OK)
				.entity(jsonOutput)
				.build();
	}
}
