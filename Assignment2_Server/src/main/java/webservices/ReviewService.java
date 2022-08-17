package webservices;

import java.io.StringReader;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.stream.JsonParsingException;
import javax.ws.rs.*;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.Review;
import dbaccess.ReviewDAO;

@Path("/ReviewService")
public class ReviewService {
	ReviewDAO db = new ReviewDAO();
	
	@GET
	@Path("/getReviewsByTour")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listReviewsByTour(int tour_id) {
		ArrayList<Review> reviewArr = new ArrayList<>();
		try {
			reviewArr = db.getReviewsByTour(tour_id);
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		return Response
				.status(Response.Status.OK)
				.entity(reviewArr)
				.build();	
	}
	
	@PUT
	@Path("/createReview")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createReview(String review) {
		int rowsAffected = -1;
		String jsonOutput = "";

		try {
			JsonReader jsonReader = Json.createReader(new StringReader(review));
			
			// this statement can cause the JsonParsingException error
			JsonObject inputJSONObj = jsonReader.readObject();
			
			
			int uid = inputJSONObj.getInt("fk_user_id");
			int tid = inputJSONObj.getInt("fk_tour_id");
			int rating = inputJSONObj.getInt("rating");
			String reviewDesc = inputJSONObj.getString("review_desc");
			
			if (rating < 0 || rating > 5) {
				System.out.print("bad rating data");
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\" : \"bad rating data\"}")
						.build();
			}
			
			rowsAffected = db.insertReview(uid, tid, rating, reviewDesc);
			jsonOutput = "{\"rows affected\" : \"" + rowsAffected + "\"" + "}";
			
		} catch (JsonParsingException e) {
			String someError = "{" + "\"error\" : \"bad input data\"" + "}";
			System.out.print("bad input data");
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
			
		} catch (NullPointerException e) {
			String someError = "{" + "\"error\" : \"bad input date\"," + "\"details\" : \"" + 
								e.toString().replace("java.lang.NullPointerException: ", "") + "}";
			System.out.print("null pointer");
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
			
		} catch (Exception e) {
			System.out.print("exception: " + e);
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

