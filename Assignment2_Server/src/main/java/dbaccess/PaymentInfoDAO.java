package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class PaymentInfoDAO {
	public ArrayList<PaymentInfo> listAllPayments() {
		ArrayList<PaymentInfo> payments = new ArrayList<PaymentInfo>();
		PaymentInfo p = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM payment";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				p = new PaymentInfo();
		
				p.setId(rs.getInt("payment_id"));
				p.setUserid(rs.getInt("fk_user_id"));
				p.setFullname(rs.getString("full_name"));
				p.setPhone(rs.getString("phone_number"));
				p.setAddress(rs.getString("address"));
				p.setZip(rs.getString("zip"));
				p.setPayment(rs.getDouble("payment"));
				
				payments.add(p);
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
		
		return payments;
	}
	
	public PaymentInfo findById(int userid) {
		PaymentInfo u = null;
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "SELECT * FROM payment WHERE fk_user_id = ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setInt(1, userid);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				u = new PaymentInfo();
		
				u.setId(rs.getInt("id"));
				u.setUserid(rs.getInt("fk_user_id"));
				u.setFullname(rs.getString("full_name"));
				u.setPhone(rs.getString("phone_number"));
				u.setZip(rs.getString("zip"));
				u.setAddress(rs.getString("address"));
				u.setPayment(rs.getDouble("payment"));
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
			
			String sqlStr = "SELECT * FROM payment WHERE address LIKE ?";
			
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			ps.setString(1, address + "%");
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				p = new PaymentInfo();
		
				p.setId(rs.getInt("payment_id"));
				p.setUserid(rs.getInt("fk_user_id"));
				p.setFullname(rs.getString("full_name"));
				p.setPhone(rs.getString("phone_number"));
				p.setZip(rs.getString("zip"));
				p.setAddress(rs.getString("address"));
				p.setPayment(rs.getDouble("payment"));
				
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
	
	public int insertPayment(int uid, String name, String phone, String address, String zip, double price) {
		Connection conn = null;
		int rowsAffected = -1;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "INSERT INTO payment (fk_user_id, full_name, phone_number, address, zip, payment) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			
			ps.setInt(1, uid);
			ps.setString(2, name);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, zip);
			ps.setDouble(6, price);
			
			rowsAffected = ps.executeUpdate();
		}  catch (Exception e) {
			System.out.print("Exception: " + e);
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
