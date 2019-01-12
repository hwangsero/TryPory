package kr.co.mlec.visit;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VisitDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void visitCntUp() {
		sqlSession.insert("kr.co.mlec.visit.visitCntUp");
	}

}
