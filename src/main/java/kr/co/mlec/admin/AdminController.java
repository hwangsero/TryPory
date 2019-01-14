package kr.co.mlec.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	public AdminService adminService; 
	
	
	public ModelAndView selectAll() {	
		
		ModelAndView mav = new ModelAndView(); 
		
		int cnt = adminService.selectAll();
		
		mav.addObject("cnt", cnt);
		
		mav.setViewName("main/adminPage");
		
		return mav;
	}
	
}
