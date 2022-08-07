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
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.Tour;
import dbaccess.TourDAO;

@Path("/TourService")
public class TourService {
	@GET
	@Path("/getAllTours")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllTours() {
		ArrayList<Tour> tours = new ArrayList<Tour>();
		try {
			TourDAO db = new TourDAO();
			tours = db.getAll();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(tours)
				.build();
	}
	
	@GET
	@Path("/getToursByCategory")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getToursByCategory(@QueryParam("catid") String catidStr) {
		ArrayList<Tour> tours = new ArrayList<Tour>();
		int catid = Integer.parseInt(catidStr);
		try {
			TourDAO db = new TourDAO();
			tours = db.getByCategoryId(catid);
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(tours)
				.build();
	}
	
	@GET
	@Path("/findTourById")
	@Produces(MediaType.APPLICATION_JSON)
	public Response findTourById(@QueryParam("tourid") String touridStr) {
		Tour t = new Tour();
		int tourid = Integer.parseInt(touridStr);
		try {
			TourDAO db = new TourDAO();
			t = db.getById(tourid);
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(t)
				.build();
	}
	
	@GET
	@Path("/searchTour")
	@Produces(MediaType.APPLICATION_JSON)
	public Response searchTour(@QueryParam("name") String name) {
		ArrayList<Tour> tours = new ArrayList<Tour>();
		try {
			TourDAO db = new TourDAO();
			tours = db.getTourByName(name);
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(tours)
				.build();
	}
	
	@PUT
	@Path("/createTour")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createTour(String inputData) {
		int rowsAffected = -1;
		String jsonOutput="";
		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			JsonObject inputJSONObj = jsonReader.readObject();
			
			String tour = inputJSONObj.getString("tour");
			String b_desc = inputJSONObj.getString("brief_desc");
			String d_desc = inputJSONObj.getString("detailed_desc");
			Double price = Double.parseDouble(inputJSONObj.getString("price"));
			Integer slots = inputJSONObj.getInt("slots");
			Integer catid = inputJSONObj.getInt("fk_category_id");
			String pic_url = inputJSONObj.getString("tour_pic_url");			
			
			if (price < 0 ) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\": \"bad price data\"")
						.build();
			}

			
			TourDAO db = new TourDAO();
			rowsAffected = db.createTour(tour, b_desc, d_desc, price, slots, catid, pic_url);
			jsonOutput = "{" +
					"\"affectedRows\": " + rowsAffected +
			"}";
		}catch (NullPointerException e) {
			String someError = "{" +
					"\"error\": \"bad input data\"\n" +
					"\"details\": \"" + e.toString().replace("java.lang.NullPointerException: ", "") + "\"" +
			"}";
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
		}
		catch (JsonParsingException e) {
			String someError = "{" +
					"\"error\": \"bad input data\"" +
			"}";
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
		}
		catch (Exception e) {
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("{\n\"error\": \"" + e.toString() + "\"\n}")
					.build();
		}
		return Response
				.status(Response.Status.CREATED)
				.entity(jsonOutput)
				.build();
	}
	
	@DELETE
	@Path("/deleteTour")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteTour(@QueryParam("tourid") String touridStr) {
		int tourid = Integer.parseInt(touridStr);
		int rowsAffected = -1;
		String jsonOutput = "";
		try {
			TourDAO db = new TourDAO();
			rowsAffected = db.deleteTour(tourid);
			jsonOutput = "{" +
					"\"affectedRows\": " + rowsAffected +
			"}";
		} catch(Exception e) {
			System.out.println("Exception: " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(jsonOutput)
				.build();
	}
	
	@PUT
	@Path("/updateTour")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateTour(@QueryParam("tourid") String touridStr, String inputData) {
		int tourid = Integer.parseInt(touridStr);
		int rowsAffected = -1;
		String jsonOutput="";
		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			JsonObject inputJSONObj = jsonReader.readObject();
			
			String tour = inputJSONObj.getString("tour");
			String b_desc = inputJSONObj.getString("brief_desc");
			String d_desc = inputJSONObj.getString("detailed_desc");
			Double price = Double.parseDouble(inputJSONObj.getString("price"));
			Integer slots = inputJSONObj.getInt("slots");
			Integer catid = inputJSONObj.getInt("fk_category_id");
			String pic_url = inputJSONObj.getString("tour_pic_url");			
			
			if (price < 0 ) {
				return Response
						.status(Response.Status.BAD_REQUEST)
						.entity("{\"error\": \"bad price data\"")
						.build();
			}

			
			TourDAO db = new TourDAO();
			rowsAffected = db.updateTour(tourid, tour, b_desc, d_desc, price, slots, catid, pic_url);
			jsonOutput = "{" +
					"\"affectedRows\": " + rowsAffected +
			"}";
		}catch (NullPointerException e) {
			String someError = "{" +
					"\"error\": \"bad input data\"\n" +
					"\"details\": \"" + e.toString().replace("java.lang.NullPointerException: ", "") + "\"" +
			"}";
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
		}
		catch (JsonParsingException e) {
			String someError = "{" +
					"\"error\": \"bad input data\"" +
			"}";
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity(someError)
					.build();
		}
		catch (Exception e) {
			return Response
					.status(Response.Status.BAD_REQUEST)
					.entity("{\n\"error\": \"" + e.toString() + "\"\n}")
					.build();
		}
		return Response
				.status(Response.Status.CREATED)
				.entity(jsonOutput)
				.build();
	}
}
