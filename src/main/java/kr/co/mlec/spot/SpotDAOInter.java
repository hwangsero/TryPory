package kr.co.mlec.spot;

import java.util.List;

import kr.co.mlec.vo.SpotVO;

public interface SpotDAOInter {

	public int insertSpot(SpotVO spot);

	public List<SpotVO> selectDiarySpot(int diary_no);

	List<SpotVO> selectUserSpot(int user_no);

}
