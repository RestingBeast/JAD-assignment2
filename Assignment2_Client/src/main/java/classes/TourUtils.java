package classes;

import java.sql.*;
import java.util.*;

public class TourUtils {
	public static ArrayList<Tour> listProducts() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		   
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";

        Connection conn = DriverManager.getConnection(connURL); 
		
		String sqlStr = "SELECT * FROM tour";
		
		PreparedStatement ps = conn.prepareStatement(sqlStr);

		ResultSet rs = ps.executeQuery(sqlStr);
		
		ArrayList<Tour> list = new ArrayList<Tour>();
		while(rs.next()) {
			Tour tour = new Tour();
			
			tour.setId(Integer.parseInt(rs.getString("tourid")));
			tour.setCategoryID(rs.getInt("fk_category_id"));
			tour.setName(rs.getString("tour"));
			tour.setBriefDescription(rs.getString("brief_desc"));
			tour.setDetailedDescription(rs.getString("detailed_desc"));
			tour.setPrice(Double.parseDouble(rs.getString("price")));
			tour.setSlots(Integer.parseInt(rs.getString("slots")));
			tour.setImage(rs.getString("tour_pic_url"));
			
			list.add(tour);
		}
		return list;
	}
	
	
	public static ArrayList<Tour> getTourByCategory(int category_id) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";

        Connection conn = DriverManager.getConnection(connURL); 
		
		String sqlStr = "SELECT * FROM tour WHERE fk_category_id =" + category_id + "";
		
		PreparedStatement ps = conn.prepareStatement(sqlStr);

		ResultSet rs = ps.executeQuery(sqlStr);
		
		ArrayList<Tour> list = new ArrayList<Tour>();
		while(rs.next()) {
			Tour tour = new Tour();
			
			tour.setId(Integer.parseInt(rs.getString("tourid")));
			tour.setName(rs.getString("tour"));
			tour.setBriefDescription(rs.getString("brief_desc"));
			tour.setDetailedDescription(rs.getString("detailed_desc"));
			tour.setPrice(Double.parseDouble(rs.getString("price")));
			tour.setSlots(Integer.parseInt(rs.getString("slots")));
			tour.setImage(rs.getString("tour_pic_url"));
			
			list.add(tour);
		}
		return list;
	}
	
	public static Tour getTour(int id) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
		
	    Connection conn = DriverManager.getConnection(connURL); 
	        
	    String sqlStr = "SELECT * FROM tour WHERE tourid =" + id + "";

	    PreparedStatement ps = conn.prepareStatement(sqlStr);
			
	    ResultSet rs = ps.executeQuery(sqlStr);
			
	    Tour tour = new Tour();
			
	    while(rs.next()) {
	    	tour.setId(Integer.parseInt(rs.getString("tourid")));
			tour.setName(rs.getString("tour"));
			tour.setBriefDescription(rs.getString("brief_desc"));
			tour.setDetailedDescription(rs.getString("detailed_desc"));
			tour.setPrice(Double.parseDouble(rs.getString("price")));
			tour.setSlots(Integer.parseInt(rs.getString("slots")));
			tour.setImage(rs.getString("tour_pic_url"));
			
			conn.close();
			return tour;
		}
			
		return null;
	}
	
	public static ArrayList<Tour> searchTour(String name) throws Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
		
	    Connection conn = DriverManager.getConnection(connURL); 
	    
	    String sqlStr = "SELECT * FROM tour WHERE tour LIKE ?;";
	    
	    PreparedStatement ps = conn.prepareStatement(sqlStr);
	    ps.setString(1, "%" + name + "%");
		
	    ResultSet rs = ps.executeQuery();
			
	    ArrayList<Tour> list = new ArrayList<Tour>();
		while(rs.next()) {
			Tour tour = new Tour();
			
			tour.setId(Integer.parseInt(rs.getString("tourid")));
			tour.setName(rs.getString("tour"));
			tour.setBriefDescription(rs.getString("brief_desc"));
			tour.setDetailedDescription(rs.getString("detailed_desc"));
			tour.setPrice(rs.getDouble("price"));
			tour.setSlots(rs.getInt("slots"));
			tour.setCategoryID(rs.getInt("fk_category_id"));
			tour.setImage(rs.getString("tour_pic_url"));
			list.add(tour);
		}
		return list;
	}
	
}
