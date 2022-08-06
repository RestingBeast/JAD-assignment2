package dbaccess; 

import java.sql.*;
import java.util.ArrayList;

public class TourDAO {
	public ArrayList<Tour> getAll(){
		ArrayList<Tour> tours = new ArrayList<Tour>();
		Tour t = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "SELECT * FROM tour";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				t = new Tour();			
				t.setId(rs.getInt("tourid"));
				t.setName(rs.getString("tour"));
				t.setBriefDescription(rs.getString("brief_desc"));
				t.setDetailedDescription(rs.getString("detailed_desc"));
				t.setPrice(rs.getDouble("price"));
				t.setSlots(rs.getInt("slots"));
				t.setCategoryID(rs.getInt("fk_category_id"));
				t.setImage(rs.getString("tour_pic_url"));	
				tours.add(t);
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			}
			catch(Exception e) {
				System.out.println("Closing error :" + e);
			}
		}	
		return tours;
	}
	
	public ArrayList<Tour> getByCategoryId(int catid){
		ArrayList<Tour> tours = new ArrayList<Tour>();
		Tour t = null;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
			conn = DriverManager.getConnection(connURL);		
			String sqlStr = "SELECT * FROM tour WHERE fk_category_id = ?;";		
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, catid);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				t = new Tour();		
				t.setId(rs.getInt("tourid"));
				t.setName(rs.getString("tour"));
				t.setBriefDescription(rs.getString("brief_desc"));
				t.setDetailedDescription(rs.getString("detailed_desc"));
				t.setPrice(rs.getDouble("price"));
				t.setSlots(rs.getInt("slots"));
				t.setCategoryID(rs.getInt("fk_category_id"));
				t.setImage(rs.getString("tour_pic_url"));			
				tours.add(t);
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			}
			catch(Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return tours;
	}
	
	public Tour getById(int id) {
		Tour t = null;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
			conn = DriverManager.getConnection(connURL);		
			String sqlStr = "SELECT * FROM tour WHERE tourid = ?;";		
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				t = new Tour();
				t.setId(rs.getInt("tourid"));
				t.setName(rs.getString("tour"));
				t.setBriefDescription(rs.getString("brief_desc"));
				t.setDetailedDescription(rs.getString("detailed_desc"));
				t.setPrice(rs.getDouble("price"));
				t.setSlots(rs.getInt("slots"));
				t.setCategoryID(rs.getInt("fk_category_id"));
				t.setImage(rs.getString("tour_pic_url"));
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			}
			catch(Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return t;
	}
	
	public ArrayList<Tour> getTourByName(String name){
		ArrayList<Tour> tours = new ArrayList<Tour>();
		name= name + "%";
		Tour t = null;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";		
			conn = DriverManager.getConnection(connURL);		
			String sqlStr = "SELECT * FROM tour WHERE tour LIKE ?;";		
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				t = new Tour();		
				t.setId(rs.getInt("tourid"));
				t.setName(rs.getString("tour"));
				t.setBriefDescription(rs.getString("brief_desc"));
				t.setDetailedDescription(rs.getString("detailed_desc"));
				t.setPrice(rs.getDouble("price"));
				t.setSlots(rs.getInt("slots"));
				t.setCategoryID(rs.getInt("fk_category_id"));
				t.setImage(rs.getString("tour_pic_url"));			
				tours.add(t);
			}
		} catch (Exception e) {
			System.out.print("Exception: " + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			}
			catch(Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return tours;
	}
}
