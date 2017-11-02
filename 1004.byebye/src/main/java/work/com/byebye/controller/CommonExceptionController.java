package work.com.byebye.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionController {
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionController.class);
	
	@ExceptionHandler
	public ModelAndView commonException(Exception e) {
		logger.info("\n##### exception : ");
		logger.info(e.getClass().getName());
		logger.info(e.getMessage());
		
		ModelAndView mnv = new ModelAndView("error/errorPage");
		mnv.addObject("message", "잘못된 페이지 요청입니다.");
		return mnv;
	}
	
}
