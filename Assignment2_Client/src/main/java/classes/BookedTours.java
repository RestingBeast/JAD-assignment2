package classes;

public class BookedTours {
	private int tourid;
	private String tour;
	private String brief_desc;
	private double totalSale;
	private int slotsAvailable;
	private int categoryid;
	private String pic_url;
	
	public BookedTours() {
		
	}
	
	public BookedTours(int tourid, String tour, String brief_desc, double totalSale, int slotsAvailable,
			int categoryid, String pic_url) {
		super();
		this.tourid = tourid;
		this.tour = tour;
		this.brief_desc = brief_desc;
		this.totalSale = totalSale;
		this.slotsAvailable = slotsAvailable;
		this.categoryid = categoryid;
		this.pic_url = pic_url;
	}

	public int getTourid() {
		return tourid;
	}

	public void setTourid(int tourid) {
		this.tourid = tourid;
	}

	public String getBrief_desc() {
		return brief_desc;
	}

	public void setBrief_desc(String brief_desc) {
		this.brief_desc = brief_desc;
	}

	public String getTour() {
		return tour;
	}

	public void setTour(String tour) {
		this.tour = tour;
	}

	public double getTotalSale() {
		return totalSale;
	}

	public void setTotalSale(double totalSale) {
		this.totalSale = totalSale;
	}


	public int getSlotsAvailable() {
		return slotsAvailable;
	}

	public void setSlotsAvailable(int slotsAvailable) {
		this.slotsAvailable = slotsAvailable;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getPic_url() {
		return pic_url;
	}

	public void setPic_url(String pic_url) {
		this.pic_url = pic_url;
	}
}
