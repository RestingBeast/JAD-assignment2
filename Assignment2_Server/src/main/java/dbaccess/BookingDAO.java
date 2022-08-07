package dbaccess;

import java.sql.*;
import java.util.ArrayList;

public class BookingDAO {
	public ArrayList<Booking> listAllBookings() {
		ArrayList<Booking> bookArr = new ArrayList<>();
		
		// logic here
		
		return bookArr;
	}
	
	public int createBooking(int slots, int uid, int tid, int pid, double price) {
		Connection conn = null;
		int rowsAffected = -1;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String connURL = "jdbc:mysql://localhost:3306/assignment1?user=root&password=Root1234-&serverTimezone=UTC";
			conn = DriverManager.getConnection(connURL);
			
			String sqlStr = "INSERT INTO booking (slots_taken, fk_user_id, fk_tour_id, fk_payment_id, price) "
					+ "VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sqlStr);
			
			ps.setInt(1, slots);
			ps.setInt(2, uid);
			ps.setInt(3, tid);
			ps.setInt(4, pid);
			ps.setDouble(5, price);
			
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
