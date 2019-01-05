package vo;

public class PictureVO {
	
	private int no;
	private String fileOriName;
	private String fileSaveName;
	private String diaryNo;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFileOriName() {
		return fileOriName;
	}
	public void setFileOriName(String fileOriName) {
		this.fileOriName = fileOriName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public String getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(String diaryNo) {
		this.diaryNo = diaryNo;
	}
	
	
	@Override
	public String toString() {
		return "PictureVO [no=" + no + ", fileOriName=" + fileOriName + ", fileSaveName=" + fileSaveName + ", diaryNo="
				+ diaryNo + "]";
	}
	
	
	
}
