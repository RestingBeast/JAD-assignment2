package dbaccess;

public class Tour {
	private int id;
	private int categoryID;
	private String Name;
	private String DetailedDescription;
	private String BriefDescription;
	private double Price;
	private int Slots;
	private String Image;
	
	public Tour(int id, int categoryID, String name, String detailed_desc, String brief_desc, 
			double price, int slots, String image) {
		super();
		Name = name;
		DetailedDescription = detailed_desc;
		BriefDescription = brief_desc;
		Price = price;
		Slots = slots;
		Image = image;
	}
	
	public Tour() {
		// TODO Auto-generated constructor stub
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getCategoryID() {
		return categoryID;
	}
	
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDetailedDescription() {
		return DetailedDescription;
	}

	public void setDetailedDescription(String detailedDescription) {
		DetailedDescription = detailedDescription;
	}

	public String getBriefDescription() {
		return BriefDescription;
	}

	public void setBriefDescription(String briefDescription) {
		BriefDescription = briefDescription;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public int getSlots() {
		return Slots;
	}

	public void setSlots(int slots) {
		Slots = slots;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}
	
	
}
