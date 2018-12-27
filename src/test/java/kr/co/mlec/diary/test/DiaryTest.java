package kr.co.mlec.diary.test;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.diary.DiaryDAO;
import kr.co.mlec.diary.DiaryService;
import kr.co.mlec.diary.DiaryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/**/*.xml"})
public class DiaryTest {
	
	@Autowired
	private DiaryDAO diaryDAO;
	
	@Autowired
	private DiaryService diaryService;
	
//	@Ignore
//	@Test
//	public void 다이어리리스트테스트 throws Exception {
//		List<DiaryVO> diaryList = diaryService.selectAllDiary();
//		for(DiaryVO diary : diaryList ) {
//			System.out.println(diary);
//		}
//	}
//	
//	@Ignore
//	@Test
//	public void 다이어리서치리스트테스트 throws Exception {
//		List<DiaryVO> diaryList = diaryService.selectSearchDiary("1");
//		for(DiaryVO diary : diaryList ) {
//			System.out.println(diary);
//		}
//	}

}
