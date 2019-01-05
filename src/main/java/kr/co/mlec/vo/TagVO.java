package kr.co.mlec.vo;

public class TagVO {
	
    private String tagName;
	private int viewCnt;
	
	
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	
	@Override
	public String toString() {
		return "TagVO [tagName=" + tagName + ", viewCnt=" + viewCnt + "]";
	}
	
}
