package vo;

public class D_PictureVO {
	
	private int no;
	private String file_ori_name;
	private String file_save_name;
	private String diary_no;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFile_ori_name() {
		return file_ori_name;
	}
	public void setFile_ori_name(String file_ori_name) {
		this.file_ori_name = file_ori_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public String getDiary_no() {
		return diary_no;
	}
	public void setDiary_no(String diary_no) {
		this.diary_no = diary_no;
	}
	
	@Override
	public String toString() {
		return "D_PictureVO [no=" + no + ", file_ori_name=" + file_ori_name + ", file_save_name=" + file_save_name
				+ ", diary_no=" + diary_no + "]";
	}
	
	
}
