package kr.co.mlec.spot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.SpotVO;

@Controller
public class SpotService implements SpotServiceInter{

	@Autowired
	private SpotDAO spotDAO;

	@Override
	public int insertSpot(SpotVO spot) {
		return spotDAO.insertSpot(spot);
	}
	@Override
	public List<SpotVO> selectDiarySpot(int diary_no) {
		return spotDAO.selectDiarySpot(diary_no);
	}
	
	@Override
	public List<SpotVO> selectUserSpot(int user_no) {
		return spotDAO.selectUserSpot(user_no);
	}
}
