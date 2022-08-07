package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class UserDAO {
	public ArrayList<User> listAllUsers() {
		
		ArrayList<User> users = new ArrayList<User>();
		User u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment2?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM user";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				u = new User();
				
				u.setUserId(rs.getInt("userid"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setEmail(rs.getString("email"));
				u.setRole(rs.getString("role"));
				u.setProfile_Pic_Url("profile_pic_url");
				
				users.add(u);
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
		
		return users;
	}

	public User findById(int userID) {
		User u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM user WHERE userid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, userID);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				u = new User();
		
				u.setUserId(rs.getInt("userid"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setProfile_Pic_Url(rs.getString("profile_pic_url"));
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
		
		return u;
	}

	public int createUser(String name, String email, String pwd, String role, String pfp) {
		Connection conn = null;
		int rowsAffected = -1;
		try {
			if (role != null) {
				role = "Admin";
			} else {
				role = "Member";
			}
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "INSERT INTO user (username, email, password, role, profile_pic_url) VALUES (?, ?, ?, ?, ?)";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pwd);
			ps.setString(4, role);
			ps.setString(5, pfp);
			
			rowsAffected = ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("Exception :" + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return rowsAffected;
	}
	
	public int deleteUser(int uid) {
		Connection conn = null;
		int rowsAffected = -1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "DELETE FROM user WHERE userid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, uid);
			
			rowsAffected = ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("Exception :" + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return rowsAffected;
	}
	
	public int updateUser(int uid, String name, String email, String pwd, String role, String pfp) {
		Connection conn = null;
		int rowsAffected = -1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "UPDATE user SET username = ?, email = ?, password = ?, role = ?, "
					+ "profile_pic_url = ? WHERE userid = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, pwd);
			ps.setString(4, role);
			ps.setString(5, pfp);
			ps.setInt(6, uid);
			
			rowsAffected = ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("Exception :" + e);
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.out.println("Closing error :" + e);
			}
		}
		return rowsAffected;
	}
}
