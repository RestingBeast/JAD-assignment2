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
import dbaccess.UserInfo;
import dbaccess.UserInfoDAO;

@Path("/UserInfoService")
public class UserInfoService {
	@GET
	@Path("/getUserInfo")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getUserInfo(@QueryParam("userid") String useridStr) {
		int userid = Integer.parseInt(useridStr);
		UserInfo u = new UserInfo();
		try {
			UserInfoDAO db = new UserInfoDAO();
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
	@Path("/getAll")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getAllTours() {
		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		try {
			UserInfoDAO db = new UserInfoDAO();
			users = db.getAll();
		} catch (Exception e) {
			System.out.println("Exception : " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(users)
				.build();
	}
}
