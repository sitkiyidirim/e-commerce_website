package com.apparel.actions.controler.validation;

import com.apparel.actions.controler.forms.InformationBean;
import com.apparel.model.service.user.UserService;
import org.apache.commons.lang.StringUtils;


public class UserUpdateValidate {

    public Boolean[] updateValidate(InformationBean informationBean,UserService userService, int id){


            Boolean[] isValidControl=new Boolean[21];
            Boolean isError=false;




            if(StringUtils.isEmpty(informationBean.getUsername())){
                isError=true;
                isValidControl[0]=true;
            } else if(userService.findByUsername(informationBean.getUsername()) !=null && Integer.valueOf(userService.findByUsername(informationBean.getUsername()).getId())!=id){
                isError=true;
                isValidControl[1]=true;
            } else if(informationBean.getUsername().length()>60){
                isError=true;
                isValidControl[2]=true;
            }

            if(StringUtils.isEmpty(informationBean.getName())){
                isError=true;
                isValidControl[3]=true;
            } else if(informationBean.getName().length()>50){
                isError=true;
                isValidControl[4]=true;
            }

            if(StringUtils.isEmpty(informationBean.getSurname())){
                isError=true;
                isValidControl[5]=true;
            } else if(informationBean.getSurname().length()>150){
                isError=true;
                isValidControl[6]=true;
            }

            //mail dogrulama start


            if(StringUtils.isEmpty(informationBean.getMail())){
                isError=true;
                isValidControl[7]=true;
            } else if(informationBean.getMail().length()>60){
                isError=true;
                isValidControl[8]=true;
            }else if(userService.findByEmailUser(informationBean.getMail()) != null && Integer.valueOf(userService.findByEmailUser(informationBean.getMail()).getId())!=id ){
                isError=true;
                isValidControl[9]=true;
            }




            if (StringUtils.isEmpty(informationBean.getMobilePhone())){

            }else if(!informationBean.getMobilePhone().matches("[0-9]+")){
                isError=true;
                isValidControl[10]=true;
            }else if (informationBean.getMobilePhone().length() != 11){
                isError=true;
                isValidControl[11]=true;
            } if (userService.findByMobilPhone(informationBean.getMobilePhone())!=null && Integer.valueOf(userService.findByMobilPhone(informationBean.getMobilePhone()).getId())!=id){
            isError=true;
            isValidControl[12]=true;
             }

            if (StringUtils.isEmpty(informationBean.getStaticPhone())){

            }else if(!informationBean.getStaticPhone().matches("[0-9]+")){
                isError=true;
                isValidControl[13]=true;
            }else if (informationBean.getStaticPhone().length() != 11){
                isError=true;
                isValidControl[14]=true;
            }

            if(StringUtils.isEmpty(informationBean.getAddress())){
            } else if(informationBean.getAddress().length()>150){
                isError=true;
                isValidControl[15]=true;
            }

            if(isError){
                isValidControl[20]=true;
                return isValidControl;
            }else {
                isValidControl[20]=false;
                return isValidControl;
            }


    }
}
