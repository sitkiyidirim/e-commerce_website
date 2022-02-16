package com.apparel.actions;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.apparel.actions.controler.BaseControl;
import com.apparel.actions.exception.CustomGenericException;

@Controller
public class ErrorController extends BaseControl{
 
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	private String error403(Model mode, HttpServletRequest servletRequest) {
		return "/error/403";
	}
 
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	private String error404(Model model, HttpServletRequest servletRequest) {
		return "/error/404";
	}
	
	@RequestMapping(value = "/405", method = RequestMethod.GET)
	private String error405(Model model, HttpServletRequest servletRequest) {
		return "/error/405";
	}
	
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	private String error500(Model model, HttpServletRequest servletRequest) {
		return "/error/500";
	}
	
	@RequestMapping(value = "/503", method = RequestMethod.GET)
	private String error503(Model model, HttpServletRequest servletRequest) {
		return  "/error/503";
	}
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	private String error(Model model, HttpServletRequest servletRequest) {
		return "/error/error";
	}
	
	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException ex) {
 
		ModelAndView model = new ModelAndView("/error/error");
		model.addObject("exception", ex);
		return model;
 
	}
 
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {
 
		ModelAndView model = new ModelAndView("/error/error");
		return model;
 
	}
 
	
}