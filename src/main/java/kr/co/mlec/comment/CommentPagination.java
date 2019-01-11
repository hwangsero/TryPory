package kr.co.mlec.comment;


public class CommentPagination {
	private int pageCnt; //전체 페이지 수
	private int listCnt; //총 게시물 수 
	private int pageSize = 10; //한페이지에 게시물 수 
	private int rangeSize = 5; //한번에 보여줄 페이징 수 
	private int rangeCnt; //전체 블록 수 
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private int prevPage; //이전 블록
	private int nextPage; //다음 블록
	private int curPage; //현재페이지
	private int curRange; //블록 시작 페이지
	
	public CommentPagination(int listCnt, int curPage) {
		
		setListCnt(listCnt);
		setCurPage(curPage);
		
		setPageCnt(listCnt);
		
		setRangeCnt(pageCnt);
		
		rangeSetting(curPage);
		
		
	}
	
	//전체 페이징수
	public void setPageCnt(int listCnt) {
		this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
	}
	
	//전체 블록수
	public void setRangeCnt(int pageCnt) {
		this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
	}
	
	//블록 시작 페이지
	public void setCurRange(int curPage) {
		this.curRange = (int)((curPage-1)/rangeSize) + 1;
	}
	
	//블록 세팅
	public void rangeSetting(int curPage) {
		setCurRange(curPage);
		this.startPage = (curRange - 1)*rangeSize + 1;
		this.endPage = startPage + rangeSize -1;
		
		if(endPage > pageCnt) {
			this.endPage = pageCnt;
		}
		
		this.prevPage = curPage - 1;
		this.nextPage = curPage + 1;
		
	}
	


	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public int getCurRange() {
		return curRange;
	}
	@Override
	public String toString() {
		return "Pagination [pageCnt=" + pageCnt + ", listCnt=" + listCnt + ", pageSize=" + pageSize + ", rangeSize="
				+ rangeSize + ", rangeCnt=" + rangeCnt + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", curPage=" + curPage + ", curRange="
				+ curRange + "]";
	}
}
