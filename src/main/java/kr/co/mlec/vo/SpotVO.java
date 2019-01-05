package kr.co.mlec.vo;

public class SpotVO {

	private int no;
	private String country;
	private String spotName;
	private String addr;
	private int count;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	@Override
	public String toString() {
		return "SpotVO [no=" + no + ", country=" + country + ", spotName=" + spotName + ", addr=" + addr + ", count="
				+ count + "]";
	}
	
	
	
}
