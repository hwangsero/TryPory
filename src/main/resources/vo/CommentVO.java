package vo;

public class D_CommentVO {

	private int no;
	private int diary_no;
	private String writer;
	private String content;
	private String register_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
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
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
	
	@Override
	public String toString() {
		return "D_CommentVO [no=" + no + ", diary_no=" + diary_no + ", writer=" + writer + ", content=" + content
				+ ", register_date=" + register_date + "]";
	}
	
	
	
}
