package vo;

public class D_DiaryVO {

	private int no;
	private String title;
	private String content;
	private String cover_image;
	private String is_share;
	private String end_date;
	private String start_date;
	private String tag_1;
	private String tag_2;
	private String tag_3;
	private String tag_4;
	private String tag_5;
	private int view_cnt;
	private int like_cnt;
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
	public String getCover_image() {
		return cover_image;
	}
	public void setCover_image(String cover_image) {
		this.cover_image = cover_image;
	}
	public String getIs_share() {
		return is_share;
	}
	public void setIs_share(String is_share) {
		this.is_share = is_share;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getTag_1() {
		return tag_1;
	}
	public void setTag_1(String tag_1) {
		this.tag_1 = tag_1;
	}
	public String getTag_2() {
		return tag_2;
	}
	public void setTag_2(String tag_2) {
		this.tag_2 = tag_2;
	}
	public String getTag_3() {
		return tag_3;
	}
	public void setTag_3(String tag_3) {
		this.tag_3 = tag_3;
	}
	public String getTag_4() {
		return tag_4;
	}
	public void setTag_4(String tag_4) {
		this.tag_4 = tag_4;
	}
	public String getTag_5() {
		return tag_5;
	}
	public void setTag_5(String tag_5) {
		this.tag_5 = tag_5;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
	
	@Override
	public String toString() {
		return "D_DiaryVO [no=" + no + ", title=" + title + ", content=" + content + ", cover_image=" + cover_image
				+ ", is_share=" + is_share + ", end_date=" + end_date + ", start_date=" + start_date + ", tag_1="
				+ tag_1 + ", tag_2=" + tag_2 + ", tag_3=" + tag_3 + ", tag_4=" + tag_4 + ", tag_5=" + tag_5
				+ ", view_cnt=" + view_cnt + ", like_cnt=" + like_cnt + ", register_date=" + register_date + "]";
	}
	
	
	
}
