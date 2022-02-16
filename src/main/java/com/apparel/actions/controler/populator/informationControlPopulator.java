package com.apparel.actions.controler.populator;

import com.apparel.actions.controler.forms.InformationBean;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;

public class informationControlPopulator {

    public User getUser(InformationBean informationBean, UserService userService,int id){
        User user=userService.findById(id);
        user.setName(informationBean.getName());
        user.setSurname(informationBean.getSurname());
        user.setUsername(informationBean.getUsername());
        user.setMail(informationBean.getMail());
        user.setSex(informationBean.getSex());
        user.setMobilePhone(informationBean.getMobilePhone());
        user.setStaticPhone(informationBean.getStaticPhone());
        user.setAddress(informationBean.getAddress());
        return user;
    }

}
