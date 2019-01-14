package kr.co.mlec.admin;

import java.awt.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.admin.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	public AdminService adminService; 
	
	@GetMapping("/main/adminPage")
	public ModelAndView selectAll() {	
		
		ModelAndView mav = new ModelAndView(); 
		
		int cnt = adminService.selectAll();
		
		
		mav.addObject("cnt", cnt);
		
		mav.setViewName("main/adminPage");
		
		return mav;
	
	
	
	
	
	
	
	
	}
	
}
