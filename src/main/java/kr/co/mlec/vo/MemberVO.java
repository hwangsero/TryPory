package kr.co.mlec.vo;

public class MemberVO {
	
	private String email;
	private String email_domain;
	private String name;
	private String password;
	private String userType;
	private String registerDate;
	private String intro; 
	private String phone1;
	private String phone2;
	private String phone3;
	private String auth_key;
	private String is_auth;

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
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
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}
	public String getIs_auth() {
		return is_auth;
	}
	public void setIs_auth(String is_auth) {
		this.is_auth = is_auth;
	}
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", name=" + name + ", password=" + password + ", userType=" + userType
				+ ", registerDate=" + registerDate + ", intro=" + intro + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", auth_key=" + auth_key + ", is_auth=" + is_auth + "]";
	}
}
