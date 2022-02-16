package com.apparel.actions.controler.validation;

import com.apparel.actions.controler.forms.InformationPasswordBean;
import org.apache.commons.lang.StringUtils;

public class UserPasswordUpdateValidate {

    public Boolean[] updateValidate(InformationPasswordBean informationBean){

       Boolean[] isValidaeControl=new Boolean[5];
       Boolean isError=false;

        if(StringUtils.isEmpty(informationBean.getUpdatepassword())){
            isError=true;
            isValidaeControl[0]=true;
        }if(StringUtils.isEmpty(informationBean.getUpdatrepassword())){
            isError=true;
            isValidaeControl[1]=true;
        }else if(!informationBean.getUpdatepassword().equals(informationBean.getUpdatrepassword())){
            isError=true;
            isValidaeControl[2]=true;
        } else if(informationBean.getUpdatepassword().length()<6){
            isError=true;
            isValidaeControl[3]=true;
        }
        if(isError){
            isValidaeControl[4]=true;
            return isValidaeControl;
        }else {
            isValidaeControl[4]=false;
            return isValidaeControl;
        }
    }
}
