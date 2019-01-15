package kr.co.mlec.vo;

public class SpotVO {

	private int no;
	private int diary_no;
	private String country;
	private String spot_name;
	private String addr;
	private Double lat;
	private Double lng;
	private int date_cnt;
	private int date_index;
	private int user_no;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
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
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public int getDate_cnt() {
		return date_cnt;
	}
	public void setDate_cnt(int date_cnt) {
		this.date_cnt = date_cnt;
	}
	public int getDate_index() {
		return date_index;
	}
	public void setDate_index(int date_index) {
		this.date_index = date_index;
	}
	@Override
	public String toString() {
		return "SpotVO [no=" + no + ", diary_no=" + diary_no + ", country=" + country + ", spot_name=" + spot_name
				+ ", addr=" + addr + ", lat=" + lat + ", lng=" + lng + ", date_cnt=" + date_cnt + ", date_index="
				+ date_index + ", user_no=" + user_no + "]";
	}
}
