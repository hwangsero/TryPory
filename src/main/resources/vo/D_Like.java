package vo;

public class D_Like {

	private String diary_no;
	private String user_email;
	
	public String getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(String diary_no) {
		this.diary_no = diary_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "D_Like [diary_no=" + diary_no + ", user_email=" + user_email + "]";
	}
	
	
}
