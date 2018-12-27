package vo;

public class MemberVO {
	
	private String email;
	private String name;
	private String password;
	private String userType;
	private String registerDate;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	
	
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", userType=" + userType
				+ ", registerDate=" + registerDate + "]";
	}
	
	
	
}
