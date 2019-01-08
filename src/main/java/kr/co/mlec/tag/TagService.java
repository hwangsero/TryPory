package kr.co.mlec.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.vo.TagVO;

@Service
public class TagService implements TagServiceInter {

	@Autowired
	private TagDAO tagDAO;

	@Override
	public int insertTag(TagVO tag) {
		return tagDAO.insertTag(tag);
	}
	
}
