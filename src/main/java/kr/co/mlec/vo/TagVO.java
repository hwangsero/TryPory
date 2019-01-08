package kr.co.mlec.vo;

public class TagVO {
	
	private int tag_no;
    private String tag_name;
	private int view_cnt;
	private int diary_no;
	public int getTag_no() {
		return tag_no;
	}
	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}
	@Override
	public String toString() {
		return "TagVO [tag_no=" + tag_no + ", tag_name=" + tag_name + ", view_cnt=" + view_cnt + ", diary_no="
				+ diary_no + "]";
	}
}
