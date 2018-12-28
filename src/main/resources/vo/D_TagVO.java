package vo;

public class D_TagVO {
	
    private String tag_name;
	private int view_cnt;
	
	
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
	
	
	@Override
	public String toString() {
		return "D_TagVO [tag_name=" + tag_name + ", view_cnt=" + view_cnt + "]";
	}
	
	
}
