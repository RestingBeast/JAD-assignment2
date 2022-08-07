package classes;

public class BookedTours {
	private int tourid;
	private String tour;
	private String brief_desc;
	private double totalSale;
	private int slotsAvailable;
	private int maxSlots;
	private int categoryid;
	private String pic_url;
	
	public BookedTours() {
		
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

	public int getMaxSlots() {
		return maxSlots;
	}

	public void setMaxSlots(int maxSlots) {
		this.maxSlots = maxSlots;
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
