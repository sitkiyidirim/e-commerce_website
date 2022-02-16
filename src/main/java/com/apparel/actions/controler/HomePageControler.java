  package com.apparel.actions.controler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@EnableAsync
public class HomePageControler extends BaseControl{
	 

	@RequestMapping(value = { "/" })
	public String mainPage(Model model, HttpServletRequest servletRequest) {
		model.addAttribute("title", "Anasayfa");
		
		return "/index";
	}

 
	
	@RequestMapping(value = "/iletisim")
	public String iletisim(Model model) {  
		return "/iletisim";
	}
	
	 
}