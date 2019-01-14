package kr.co.mlec.vo;

public class DiaryVO {

	private int no;
	private String title;
	private String content;
	private String map_content;
	private String writer;
	private String cover_image;
	private String is_share;
	private String end_date;
	private String start_date;
	private String tag;
	private String addr;
	private int viewCnt;
	private int likeCnt;
	private int comment_cnt;
	private String registerDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMap_content() {
		return map_content;
	}
	public void setMap_content(String map_content) {
		this.map_content = map_content;
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	@Override
	public String toString() {
		return "DiaryVO [no=" + no + ", title=" + title + ", content=" + content + ", map_content=" + map_content
				+ ", writer=" + writer + ", cover_image=" + cover_image + ", is_share=" + is_share + ", end_date="
				+ end_date + ", start_date=" + start_date + ", tag=" + tag + ", addr=" + addr + ", viewCnt=" + viewCnt
				+ ", likeCnt=" + likeCnt + ", comment_cnt=" + comment_cnt + ", registerDate=" + registerDate + "]";
	}
}
