package dbaccess;

public class UserInfo {
	private int id;
	private int userid;
	private String fullname;
	private String phone;
	private String zip;
	private String address;
	
	public UserInfo() {
		
	}
	
	public UserInfo(int id, int userid, String fullname, String phone, String zip, String address) {
		super();
		this.id = id;
		this.userid = userid;
		this.fullname = fullname;
		this.phone = phone;
		this.zip = zip;
		this.address = address;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
