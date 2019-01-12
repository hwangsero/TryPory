package kr.co.mlec.vo;

public class SearchVO {
	private String value;
	private int count;
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "SearchVO [value=" + value + ", count=" + count + "]";
	}
}
