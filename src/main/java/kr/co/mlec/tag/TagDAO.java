package kr.co.mlec.tag;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.mlec.vo.TagVO;

@Controller
public class TagDAO implements TagDAOInter{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertTag(TagVO tag) {
		return sqlSession.insert("kr.co.mlec.tag.insertTag", tag);
	}
}
