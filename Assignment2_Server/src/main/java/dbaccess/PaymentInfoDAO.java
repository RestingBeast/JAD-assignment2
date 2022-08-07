package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class PaymentInfoDAO {
	public PaymentInfo findById(int userid) {
		PaymentInfo u = null;
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
				u = new PaymentInfo();
		
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
	
	public ArrayList<PaymentInfo> findByAddress(String address) {
		ArrayList<PaymentInfo> pInfos = new ArrayList<PaymentInfo>();
		PaymentInfo p = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM paymentinfo WHERE residential_address LIKE ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, address + "%");
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				p = new PaymentInfo();
		
				p.setId(rs.getInt("id"));
				p.setUserid(rs.getInt("fk_user_id"));
				p.setFullname(rs.getString("fullname"));
				p.setPhone(rs.getString("phone"));
				p.setZip(rs.getString("zip"));
				p.setAddress(rs.getString("residential_address"));
				
				pInfos.add(p);
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
		return pInfos;
	}
}
