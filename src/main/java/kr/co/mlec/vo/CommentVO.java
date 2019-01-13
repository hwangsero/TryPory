package kr.co.mlec.vo;

public class CommentVO {

	private int no;
	private int diaryNo;
	private String email;
	private String writer;
	private String content;
	private String registerDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", diaryNo=" + diaryNo + ", email=" + email + ", writer=" + writer + ", content="
				+ content + ", registerDate=" + registerDate + "]";
	}
	
}
