package vo;

public class D_SpotVO {

	private int no;
	private String country;
	private String spot_name;
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
	public String getSpot_name() {
		return spot_name;
	}
	public void setSpot_name(String spot_name) {
		this.spot_name = spot_name;
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
		return "D_SpotVO [no=" + no + ", country=" + country + ", spot_name=" + spot_name + ", addr=" + addr
				+ ", count=" + count + "]";
	}
	
	
	
	
	
}
