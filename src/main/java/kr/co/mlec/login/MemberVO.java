package kr.co.mlec.login;

public class MemberVO {
	private String email;
	private String name;
	private String password;
	private String userType;
	private String registerDate;
	private String intro; 
	private String domain; 
	private String phone1;
	private String phone2;
	private String phone3;
	
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public MemberVO(String email, String name, String password, String userType, String registerDate, String intro,
			String domain, String phone1, String phone2, String phone3) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.userType = userType;
		this.registerDate = registerDate;
		this.intro = intro;
		this.domain = domain;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
	}



	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

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
				+ ", registerDate=" + registerDate + ", intro=" + intro + ", domain=" + domain + ", phone1=" + phone1
				+ ", phone2=" + phone2 + ", phone3=" + phone3 + "]";
	}

	

	
	
}
