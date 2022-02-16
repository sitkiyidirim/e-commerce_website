package com.apparel.actions.controler;

import com.apparel.actions.controler.forms.*;
import com.apparel.actions.controler.validation.*;
import com.apparel.model.service.user.UserService;
import com.apparel.model.service.user.address.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@EnableAsync
@RequestMapping("/user")
public class LoginPageControler {


    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;


    @RequestMapping(value = { "/login" })
    public String mainPage(Model model, HttpServletRequest request) {
        model.addAttribute("title", "Login");
        String id =(String) request.getSession().getAttribute("id");
        if(id==null)
        return "/login";
        else return "redirect:/";
    }

    @RequestMapping(value = { "/logout" })
    public String logout(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("id",null);
        session.setAttribute("name",null);
        session.setAttribute("surname",null);

        return "redirect:/";
    }


    @RequestMapping(value = "userControl",method = RequestMethod.POST)
    public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean,
                         HttpServletRequest request, HttpServletResponse response) throws IOException {

        LoginPageValidate loginPageValidate=new LoginPageValidate();
        String status=loginPageValidate.isLogin(userService,loginBean,request);

        if(status=="successfully"){
            return "redirect:/";
        }else {
            model.addAttribute("error", status);
            model.addAttribute("iserrorLogin",true);
           return "login";
        }
    }

}
