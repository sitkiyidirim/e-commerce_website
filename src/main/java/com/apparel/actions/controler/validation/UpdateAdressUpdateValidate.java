package com.apparel.actions.controler.validation;

import com.apparel.actions.controler.forms.UpdateAddresesUpdateBean;
import com.apparel.actions.controler.forms.UpdateAdressBean;
import org.apache.commons.lang.StringUtils;

public class UpdateAdressUpdateValidate {
    public Boolean[] isValidate(UpdateAddresesUpdateBean updateAdressBean){
        Boolean[] isValid=new Boolean[16];
        Boolean iserror=false;

        if (StringUtils.isEmpty(updateAdressBean.getAddressTitle())){
            iserror=true;
            //adress başlığı boş olamaz
            isValid[0]=true;
        }

        if (StringUtils.isEmpty(updateAdressBean.getName())){
            iserror=true;
            //ad boş olamaz
            isValid[1]=true;
        }else if(updateAdressBean.getName().matches("[0-9]+")){
            iserror=true;
            //ad harflerden oluşmalı
            isValid[2]=true;
        }

        if (StringUtils.isEmpty(updateAdressBean.getSurname())){
            iserror=true;
            //soyad boş olamaz
            isValid[3]=true;
        }else if(updateAdressBean.getSurname().matches("[0-9]+")){
            iserror=true;
            //soyad harflerden oluşmalı
            isValid[4]=true;
        }

        if(StringUtils.isEmpty(updateAdressBean.getAddressline())){
            iserror=true;
            isValid[5]=true;
            //adres satırı boş olamaz
        }

        if(StringUtils.isEmpty(updateAdressBean.getCity())){
            iserror=true;
            isValid[6]=true;
            //il boş olamaz
        }

        if(StringUtils.isEmpty(updateAdressBean.getDistrict()) || updateAdressBean.getDistrict().equals("0")){
            iserror=true;
            isValid[7]=true;
            //ilçe boş olamaz
        }

        if(StringUtils.isEmpty(updateAdressBean.getCountry())){
            iserror=true;
            isValid[8]=true;
            //ülke boş olamaz
        }

        if(StringUtils.isEmpty(updateAdressBean.getPostcode())){

        }else if(!updateAdressBean.getPostcode().matches("[0-9]+")){
            iserror=true;
            isValid[9]=true;
            //sadece rakalmlardan oluşmalı
        }else if(updateAdressBean.getPostcode().length()!=5){
            iserror=true;
            isValid[10]=true;
            //uzunluk 5 rakam olmalı
        }

        if(iserror){
            isValid[15]=true;
            return isValid;
        }else {
            isValid[15]=false;
            return isValid;
        }
    }
}
