package vo;

public class D_NoticeVO {

	private int no;
	private String title;
	private String content;
	private int view_cnt;
	private String register_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
	
	@Override
	public String toString() {
		return "D_NoticeVO [no=" + no + ", title=" + title + ", content=" + content + ", view_cnt=" + view_cnt
				+ ", register_date=" + register_date + "]";
	}
	
	
	
	
}
