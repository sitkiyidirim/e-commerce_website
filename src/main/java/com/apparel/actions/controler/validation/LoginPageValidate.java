package com.apparel.actions.controler.validation;

import com.apparel.actions.controler.forms.LoginBean;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginPageValidate {

    public String isLogin(UserService userService, LoginBean loginBean, HttpServletRequest request){

        User user= userService.findByUsername(loginBean.getUserName());
        String errormessage="";

       if(loginBean.getUserName()==null || loginBean.getUserName().equals("")){
           return "Please enter a valid username!";
       }else if(loginBean.getPassword()==null || loginBean.getPassword().equals("")){
           return "Please enter your password";
       }else if(user ==null){
           return "Username and/or password are wrong !";
       }else {
           Boolean isTruePassword= userService.doPasswordsMatch(loginBean.getPassword(),user.getPassword());

           if (loginBean.getUserName().equals(user.getUsername()) && isTruePassword ) {


               HttpSession session = request.getSession();
               session.setAttribute("id",user.getId().toString());
               session.setAttribute("name",user.getName());
               session.setAttribute("surname",user.getSurname());

               return "successfully";
           }else {
               return "Username and/or password are wrong !";
           }
       }

    }
}
