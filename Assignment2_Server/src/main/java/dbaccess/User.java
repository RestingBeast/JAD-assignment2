package dbaccess;

public class User {
	private int userid;
	private String username;
	private String email;
	private String password;
	private String role;
	private String profile_pic_url;
	
	public int getUserId() {
		return this.userid;
	}
	
	public void setUserId(int userid) {
		this.userid = userid;
	}
	
	public String getUsername() {
		return this.username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void set(String email) {
		this.email = email;
	}
	
	public String getRole() {
		return this.role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getProfile_Pic_Url() {
		return this.profile_pic_url;
	}
	
	public void setProfile_Pic_Url(String profile_pic_url) {
		this.profile_pic_url = profile_pic_url;
	}
	
	public User() {
		
	}
	
}
