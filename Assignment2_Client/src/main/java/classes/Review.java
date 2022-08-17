package classes;

public class Review {
	private int id;
	private int userid;
	private int tourid;
	private String ReviewDesc;
	private int Rating;
	private String username;
	private String createdAt;
	
	public Review(int id, int userid, int tourid, String reviewDesc, int rating, String username, String createdAt) {
		super();
		this.id = id;
		this.userid = userid;
		this.tourid = tourid;
		ReviewDesc = reviewDesc;
		Rating = rating;
		this.username = username;
		this.createdAt = createdAt;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
