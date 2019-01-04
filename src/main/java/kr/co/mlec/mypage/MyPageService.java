package kr.co.mlec.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.login.MemberVO;
import kr.co.mlec.notice.NoticeDAO;
import kr.co.mlec.notice.NoticeVO;

@Service
public class MyPageService implements MyPageServiceInter {

	@Autowired
	private MyPageDAO mypageDAO;
	
	@Override
	public void updateMember(MemberVO userVO) {
		mypageDAO.updateMember(userVO);
		
	}
}
