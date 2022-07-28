package classes;

import java.sql.*;
import java.util.*;

public class CategoryUtils {
	public static ArrayList<Category> listCategories() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";

        Connection conn = DriverManager.getConnection(connURL); 
		
		String sqlStr = "SELECT * FROM category";
		
		PreparedStatement ps = conn.prepareStatement(sqlStr);

		ResultSet rs = ps.executeQuery(sqlStr);
		
		ArrayList<Category> list = new ArrayList<Category>();
		while(rs.next()) {
			Category cat = new Category();
			
			cat.setCategoryID(Integer.parseInt(rs.getString("categoryid")));
			cat.setName(rs.getString("category"));
			cat.setDescription(rs.getString("description"));
			
			list.add(cat);
		}
		return list;
	}
	public static String getCategoryName(int i) throws Exception {
		String name = "";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";

        Connection conn = DriverManager.getConnection(connURL); 
		
		String sqlStr = "SELECT * FROM category WHERE categoryid = ?";
		
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ps.setInt(1, i);

		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			name = rs.getString("category");
		}
		return name;
	}
}
