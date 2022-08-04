package classes;

public class Review {
	private int id;
	private int userid;
	private int tourid;
	private String ReviewDesc;
	private int Rating;
	
	public Review(int id, int userid, int tourid, String reviewDesc, int rating) {
		super();
		
		ReviewDesc = reviewDesc;
		Rating = rating;
	}
	
	public Review() {
		super();
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public String getReviewDesc() {
		return ReviewDesc;
	}
	
	public void setReviewDesc(String reviewDesc) {
		ReviewDesc = reviewDesc;
	}
	
	public int getRating() {
		return Rating;
	}
	
	public void setRating(int rating) {
		Rating = rating;
	}
	
	
}
