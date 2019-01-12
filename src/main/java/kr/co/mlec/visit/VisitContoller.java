package kr.co.mlec.visit;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class VisitContoller implements HttpSessionListener{

	@Autowired
	private VisitDAO visitDAO;
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {

		
		if(sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
	}
	
	private void execute(HttpSessionEvent sessionEve)
	{
		try {
			visitDAO.visitCntUp();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
