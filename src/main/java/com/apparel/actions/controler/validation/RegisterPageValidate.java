package com.apparel.actions.controler.validation;

import com.apparel.actions.config.JwtTokenUtil;
import com.apparel.actions.controler.forms.RegisterBean;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;
import org.apache.commons.lang.StringUtils;
import org.hsqldb.lib.StringUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

public class RegisterPageValidate {
    public Boolean[] isValidateAndRegister(RegisterBean registerBean, UserService userService,
                                        HttpServletRequest request, JwtTokenUtil jwtTokenUtil){

        Boolean[] isValidate=new Boolean[21];

        User user=new User();

        if(registerBean !=null ){

            Boolean isError=false;

            if(StringUtils.isEmpty(registerBean.getUsername())){
                isError=true;
                isValidate[0]=true;
            } else if(userService.findByUsername(registerBean.getUsername()) !=null){
                isError=true;
                isValidate[1]=true;
            } else if(registerBean.getUsername().length()>60){
                isError=true;
                isValidate[2]=true;
            } else {
                user.setUsername(registerBean.getUsername());
            }

            if(StringUtils.isEmpty(registerBean.getPassword())){
                isError=true;
                isValidate[3]=true;
            } else if(registerBean.getPassword().length()<6){
                isError=true;
                isValidate[4]=true;
            } else {
                user.setPassword(userService.bcryptEncryptor(registerBean.getPassword()));
            }

            if(StringUtils.isEmpty(registerBean.getName())){
                isError=true;
                isValidate[5]=true;
            } else if(registerBean.getName().length()>50){
                isError=true;
                isValidate[6]=true;
            } else {
                user.setName(registerBean.getName());
            }

            if(StringUtils.isEmpty(registerBean.getSurname())){
                isError=true;
                isValidate[7]=true;
            } else if(registerBean.getSurname().length()>150){
                isError=true;
                isValidate[8]=true;
            } else {
                user.setSurname(registerBean.getSurname());
            }

            //mail dogrulama start


            if(StringUtils.isEmpty(registerBean.getMail())){
                isError=true;
                isValidate[9]=true;
            } else if(registerBean.getMail().length()>60){
                isError=true;
                isValidate[10]=true;
            }else if(userService.findByEmailUser(registerBean.getMail()) != null ){
                isError=true;
                isValidate[11]=true;
            }else {
                user.setMail(registerBean.getMail());
            }

            //mail dogrulama finish

            if (StringUtils.isEmpty(registerBean.getSex())) {
                user.setSex(null);
            }else {
                user.setSex(registerBean.getSex());
            }

            if (StringUtils.isEmpty(registerBean.getMobilePhone())){
                user.setMobilePhone(null);
            }else if(!registerBean.getMobilePhone().matches("[0-9]+")){
                isError=true;
                isValidate[12]=true;
            }else if (registerBean.getMobilePhone().length() != 11){
                isError=true;
                isValidate[13]=true;
            }else if (userService.findByMobilPhone(registerBean.getMobilePhone())!=null){
                isError=true;
                isValidate[14]=true;
            } else {
                user.setMobilePhone(registerBean.getMobilePhone());
            }

            if (StringUtils.isEmpty(registerBean.getStaticPhone())){
                user.setStaticPhone(null);
            }else if(!registerBean.getStaticPhone().matches("[0-9]+")){
                isError=true;
                isValidate[15]=true;
            }else if (registerBean.getStaticPhone().length() != 11){
                isError=true;
                isValidate[16]=true;
            }else {
                user.setStaticPhone(registerBean.getStaticPhone());
            }

            if(StringUtils.isEmpty(registerBean.getAddress())){
                user.setAddress(null);
            } else if(registerBean.getAddress().length()>150){
                isError=true;
                isValidate[17]=true;
            } else {
                user.setAddress(registerBean.getAddress());
            }

            if(isError){
                isValidate[20]=true;

                return isValidate;
            }else {


                Date last_login_date=new Date();
                Timestamp tsLast_login_date = new Timestamp(last_login_date.getTime());
                user.setLastLogin(tsLast_login_date);

                String lastIp = userService.getIpAddr(request);
                user.setLastIp(lastIp);

                String lastSessionId=request.getRequestedSessionId();
                user.setLastSesionId(lastSessionId);

                user.setEnabled(true);
                user.setBanned(0);


                String token=  jwtTokenUtil.generateToken(user.getUsername());
                user.setToken(token);

                Date token_expiration=jwtTokenUtil.getExpirationDateFromToken(token);
                Timestamp tsToken_expiration = new Timestamp(token_expiration.getTime());
                user.setTokenExpiration(tsToken_expiration);

                userService.createSocialUser(user);

                User userRegister=userService.findByUsername(user.getUsername());


                HttpSession session = request.getSession();
                session.setAttribute("id",userRegister.getId().toString());
                session.setAttribute("name",userRegister.getName());
                session.setAttribute("surname",userRegister.getSurname());

                 isValidate[20]=false;
                return isValidate;
            }

        }else {

            isValidate[18]=true;
            return isValidate;
        }
    }
}
