package kr.co.mlec.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public int selectAll() {
		return adminDAO.selectAll();
	}

}
