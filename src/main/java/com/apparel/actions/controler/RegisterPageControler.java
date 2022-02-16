package com.apparel.actions.controler;
import com.apparel.actions.config.JwtTokenUtil;
import com.apparel.actions.controler.forms.RegisterBean;
import com.apparel.actions.controler.validation.RegisterPageValidate;
import com.apparel.model.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@EnableAsync
@RequestMapping("/userregister")
public class RegisterPageControler {

    @Autowired
    UserService userService;

    @Autowired
    JwtTokenUtil jwtTokenUtil;


    @RequestMapping(value = { "/register" })
    public String mainPage(Model model, HttpServletRequest servletRequest) {
        model.addAttribute("title", "Register");

        return "/register";
    }

    @RequestMapping(value = "registerControl",method = RequestMethod.POST)
    public String submit(Model model, @ModelAttribute("registerBean") RegisterBean registerBean ,
                         BindingResult result, HttpServletRequest request, HttpServletResponse response) {

        RegisterPageValidate registerPageValidate=new RegisterPageValidate();
     Boolean[] status=   registerPageValidate.isValidateAndRegister(registerBean,userService,request,jwtTokenUtil);

     if(!status[20]){
         return "redirect:/";
     }else {
         model.addAttribute("error", status);
            return "/register";
     }

    }
}
