package webservices;

import java.io.StringReader;
import java.util.ArrayList;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.stream.JsonParsingException;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import dbaccess.TourDAO;
import dbaccess.User;
import dbaccess.UserDAO;

@Path("/UserService")
public class UserService {
	@GET
	@Path("/listAllUsers")
	@Produces(MediaType.APPLICATION_JSON)
	public Response listallUsers() {
		ArrayList<User> userArr = new ArrayList<>();
		try {
			UserDAO db = new UserDAO();
			userArr = db.listAllUsers();
		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		
		return Response
				.status(Response.Status.OK)
				.entity(userArr)
				.build();
	}
	
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
	
	@PUT
	@Path("/createUser")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response createUser(String inputData) {
		int rowsAffected = -1;
		String jsonOutput = "";
		
		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			JsonObject inputJSONObj = jsonReader.readObject();
			
			String name = inputJSONObj.getString("name");
			String email = inputJSONObj.getString("email");
			String password = inputJSONObj.getString("password");
			String pfp = inputJSONObj.getString("profile_pic_url");
			
			// data validation (To check if data is feasible or not)
			// can include checks for name/email availability but no time to do now.
			
			UserDAO db = new UserDAO();
			
			rowsAffected = db.createUser(name, email, null ,password, pfp);
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
	
	@DELETE
	@Path("/deleteUser")
	@Produces(MediaType.APPLICATION_JSON)
	public Response deleteUser(@QueryParam("userid") String useridStr) {
		int userid = Integer.parseInt(useridStr);
		int rowsAffected = -1;
		String jsonOutput = "";
		try {
			UserDAO db = new UserDAO();
			rowsAffected = db.deleteUser(userid);
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
	@Path("/updateUser")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateUser(@QueryParam("userid") String useridStr, String inputData) {
		int userid = Integer.parseInt(useridStr);
		int rowsAffected = -1;
		String jsonOutput="";
		try {
			JsonReader jsonReader = Json.createReader(new StringReader(inputData));
			
			JsonObject inputJSONObj = jsonReader.readObject();
			
			String name = inputJSONObj.getString("name");
			String email = inputJSONObj.getString("email");
			String password = inputJSONObj.getString("password");
			String role = inputJSONObj.getString("role");
			String pfp = inputJSONObj.getString("profile_pic_url");			
			
			UserDAO db = new UserDAO();
			rowsAffected = db.updateUser(userid, name, email, password, role, pfp);
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