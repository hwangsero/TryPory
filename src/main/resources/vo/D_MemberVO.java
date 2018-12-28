package vo;

public class D_MemberVO {
	
	private String email;
	private String name;
	private String password;
	private String user_type;
	private String register_date;
	
	
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
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
	
	@Override
	public String toString() {
		return "D_MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", user_type=" + user_type
				+ ", register_date=" + register_date + "]";
	}
	
	
	
	
}
