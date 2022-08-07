package dbaccess;

public class PaymentInfo {
	private int id;
	private int userid;
	private String fullname;
	private String phone;
	private String address;
	private String zip;
	private double payment;
	
	public PaymentInfo() {
		
	}
	
	public PaymentInfo(int id, int userid, String fullname, String phone, String address, String zip, double payment) {
		super();
		this.id = id;
		this.userid = userid;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.zip = zip;
		this.payment = payment;
	}

	public int getUserid() {
		return userid;
	}
	
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getZip() {
		return zip;
	}
	
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public double getPayment() {
		return payment;
	}
	
	public void setPayment(double payment) {
		this.payment = payment;
	}
}
