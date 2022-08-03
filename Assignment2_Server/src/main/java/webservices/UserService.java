package webservices;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.User;
import dbaccess.UserDAO;

@Path("/UserService")
public class UserService {
	@GET
	@Path("/getUser")
	@Produces(MediaType.APPLICATION_JSON)
	public Response findUser(@QueryParam("userid") int userid) {
		// http://localhost:8080/Assignment2_Server/UserService/getUser?userid=1 (Can try in postman)
		User user = new User();
		try {
			UserDAO db = new UserDAO();
			user = db.findById(userid);
		} catch(Exception e) {
			System.out.println("Exception : " + e);
		}
		return Response
				.status(Response.Status.OK)
				.entity(user)
				.build();
	}
}