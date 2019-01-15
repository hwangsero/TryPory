package kr.co.mlec.spot;

import java.util.List;

import kr.co.mlec.vo.SpotVO;

public interface SpotServiceInter {

	public int insertSpot(SpotVO spot);

	public List<SpotVO> selectDiarySpot(int diary_no);

	List<SpotVO> selectUserSpot(int useer_no);

}
