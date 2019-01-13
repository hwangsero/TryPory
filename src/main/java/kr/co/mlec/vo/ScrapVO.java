package kr.co.mlec.vo;

public class ScrapVO {

	private String diaryNo;
	private String userEmail;
	
	public String getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(String diaryNo) {
		this.diaryNo = diaryNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	@Override
	public String toString() {
		return "Like [diaryNo=" + diaryNo + ", userEmail=" + userEmail + "]";
	}

}
