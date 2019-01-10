package kr.co.mlec.map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MapDAO implements MapDAOInter {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
