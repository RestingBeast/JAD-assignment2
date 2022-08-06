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
}
