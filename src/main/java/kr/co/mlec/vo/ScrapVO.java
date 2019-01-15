package kr.co.mlec.vo;

public class ScrapVO {

	private int diaryNo;
	private int userNo;
	
	public ScrapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "ScrapVO [diaryNo=" + diaryNo + ", userNo=" + userNo + "]";
	}
	
	
}
