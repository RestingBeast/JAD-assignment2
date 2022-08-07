package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class UserInfoDAO {
	public UserInfo findById(int userid) {
		UserInfo u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM userdetails WHERE fk_user_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, userid);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				u = new UserInfo();
		
				u.setId(rs.getInt("id"));
				u.setUserid(rs.getInt("fk_user_id"));
				u.setFullname(rs.getString("fullname"));
				u.setPhone(rs.getString("phone"));
				u.setZip(rs.getString("zip"));
				u.setAddress(rs.getString("residential_addressm"));
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
	
	public int updateUserInfo(int userid, String fullname, String phone, String zip, String address) {
		Connection conn = null;
		int rowsAffected = -1;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "UPDATE userdetails SET fullname = ?, phone = ?, zip = ?, residential_address = ? WHERE fk_user_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, fullname);
			ps.setString(2, phone);
			ps.setString(3, zip);
			ps.setString(4, address);
			ps.setInt(5, userid);
			
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
	
	public ArrayList<UserInfo> getAll(){
		ArrayList<UserInfo> users = new ArrayList<UserInfo>();
		UserInfo u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			String sqlStr = "SELECT * FROM userdetails";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				u = new UserInfo();			
				u.setId(rs.getInt("id"));
				u.setUserid(rs.getInt("fk_user_id"));
				u.setFullname(rs.getString("fullname"));
				u.setPhone(rs.getString("phone"));
				u.setZip(rs.getString("zip"));
				u.setAddress(rs.getString("residential_address"));
				
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
}
