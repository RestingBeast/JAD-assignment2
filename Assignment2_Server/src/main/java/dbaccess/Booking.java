package dbaccess;

public class Booking {
	private int bId;
	private int slotsTaken;
	private int userid;
	private int tourid;
	private double totalPrice;
	
	public Booking(int booking_id, int slots_taken, int fk_user_id, int fk_tour_id, double price) {
		booking_id = bId;
		slots_taken = slotsTaken;
		fk_user_id = userid;
		fk_tour_id = tourid;
		price = totalPrice;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getSlotsTaken() {
		return slotsTaken;
	}

	public void setSlotsTaken(int slotsTaken) {
		this.slotsTaken = slotsTaken;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getTourid() {
		return tourid;
	}

	public void setTourid(int tourid) {
		this.tourid = tourid;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	
}
