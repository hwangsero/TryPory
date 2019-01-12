package kr.co.mlec.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public int selectAll() {
	
		return sqlSession.selectOne("kr.co.mlec.admin.selectAll");
	}
}
