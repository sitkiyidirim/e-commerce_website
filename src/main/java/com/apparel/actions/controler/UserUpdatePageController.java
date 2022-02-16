package com.apparel.actions.controler;


import com.apparel.actions.controler.forms.InformationBean;
import com.apparel.actions.controler.forms.InformationPasswordBean;
import com.apparel.actions.controler.forms.UpdateAddresesUpdateBean;
import com.apparel.actions.controler.forms.UpdateAdressBean;
import com.apparel.actions.controler.populator.UpdateAddressUpdatePopulator;
import com.apparel.actions.controler.populator.UpdateAdressPopulator;
import com.apparel.actions.controler.populator.informationControlPopulator;
import com.apparel.actions.controler.validation.UpdateAddressValidate;
import com.apparel.actions.controler.validation.UpdateAdressUpdateValidate;
import com.apparel.actions.controler.validation.UserPasswordUpdateValidate;
import com.apparel.actions.controler.validation.UserUpdateValidate;
import com.apparel.model.entity.user.Address;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;
import com.apparel.model.service.user.address.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@EnableAsync
@RequestMapping("/user")
public class UserUpdatePageController {


    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;

    @RequestMapping(value = { "/information" })
    public ModelAndView information(Model model, HttpServletRequest request, @ModelAttribute("information") InformationBean informationBean) {

        String login_id =(String) request.getSession().getAttribute("id");
        int id=Integer.valueOf(login_id);
        User user=userService.findById(id);

        ModelAndView mdv=new ModelAndView();
        mdv.addObject("user",user);
        model.addAttribute("isValid",false);
        mdv.setViewName("/information");
        return mdv;
    }




    @RequestMapping(value = { "/updateAdressControl" },method = RequestMethod.POST)
    public ModelAndView updateAdress(Model model,HttpServletRequest request,@ModelAttribute("updateadresscontrol") UpdateAdressBean updateAdressBean) {

        UpdateAddressValidate updateAddressValidate=new UpdateAddressValidate();
        Boolean[] isValid=  updateAddressValidate.isValidate(updateAdressBean);

        if(isValid[15]){
            ModelAndView mdv=new ModelAndView();
            model.addAttribute("isValid",true);
            model.addAttribute("isValidAddres",true);
            model.addAttribute("updateAdressErrorForm3",isValid);
            mdv.setViewName("/information");
            return mdv;
        }else {
            UpdateAdressPopulator updateAdressPopulator=new UpdateAdressPopulator();
            Address address=updateAdressPopulator.getAdress(updateAdressBean,request,userService);

            try {
                addressService.createAdres(address);
            }catch (Exception e){
                e.printStackTrace();
            }
            ModelAndView mdv=new ModelAndView();
            mdv.setViewName("redirect:/");
            return mdv;
        }
    }

    @RequestMapping(value = { "/updateAdressControlUpdateAdress" })
    public ModelAndView updateAdressControlUpdateAdress(Model model,HttpServletRequest request,@ModelAttribute("updateAddresesUpdateBean") UpdateAddresesUpdateBean updateAddresesUpdateBean) {

        UpdateAdressUpdateValidate updateAdressUpdateValidate=new UpdateAdressUpdateValidate();
        Boolean[] isvaliupdate=updateAdressUpdateValidate.isValidate(updateAddresesUpdateBean);
        UpdateAddressUpdatePopulator updateAddressUpdatePopulator=new UpdateAddressUpdatePopulator();
        Address address=updateAddressUpdatePopulator.getAdress(updateAddresesUpdateBean,request,userService);

        if (isvaliupdate[15]){
            ModelAndView mdv=new ModelAndView();
            model.addAttribute("isValid",true);
            model.addAttribute("isValidAddres",true);
            model.addAttribute("isValidAdressUpdate",true);
            model.addAttribute("form4UpdateAdressErrorFormValidate",isvaliupdate);//form hata mesajları
            model.addAttribute("adressErrorFormValues",updateAddresesUpdateBean);//hatalı form değerleri
            model.addAttribute("adressErrorFormValuesCity",address.getCity());//hatalı formdaki şehir değeri
            mdv.setViewName("/information");
            return mdv;
        } else {
            addressService.update(address);
            ModelAndView mdv=new ModelAndView();;
            mdv.setViewName("redirect:/");
            return mdv;
        }

    }

    @RequestMapping(value = { "/informationControlPassword" })
    public ModelAndView informationControlPassword(Model model,HttpServletRequest request,@ModelAttribute("InformationPasswordBean") InformationPasswordBean informationPasswordBean) {

        String login_id = (String) request.getSession().getAttribute("id");
        int id = Integer.valueOf(login_id);
        User user=userService.findById(id);
        UserPasswordUpdateValidate userPasswordUpdateValidate=new UserPasswordUpdateValidate();
        Boolean[] status= userPasswordUpdateValidate.updateValidate(informationPasswordBean);

        if(!status[4]){
            user.setPassword(userService.bcryptEncryptor(informationPasswordBean.getUpdatepassword()));
            userService.update(user);
            ModelAndView mdv=new ModelAndView();
            mdv.setViewName("redirect:/");
            return mdv;
        } else {
            model.addAttribute("errorform2",status);
            User user1=userService.findById(id);
            ModelAndView mdv=new ModelAndView();
            mdv.addObject("user",user1);
            model.addAttribute("isValid",true);
            model.addAttribute("isValidAddres",false);
            mdv.setViewName("/information");
            return mdv;
        }

    }

    @RequestMapping(value = { "/updateAdressControlDeleteAdress" },method = RequestMethod.GET)
    public String updateAdressDeleteupdate(@RequestParam String id) {
        addressService.delete(Integer.valueOf(id));
        return "";
    }

    @RequestMapping(value = { "/updateAdressControlgetAdress" },method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> updateAdressgetUPdate(Model model, HttpServletRequest request, @ModelAttribute("updateadresscontrol") UpdateAdressBean updateAdressBean) {
        List<Address> addresses= addressService.findByAdress(request);
        return   ResponseEntity.ok(addresses.toString());
    }

    @RequestMapping(value = { "/informationControl" })
    public ModelAndView informationControl(Model model,HttpServletRequest request,@ModelAttribute("information") InformationBean informationBean) {

        String login_id =(String) request.getSession().getAttribute("id");
        int id=Integer.valueOf(login_id);
        UserUpdateValidate userUpdateValidate=new UserUpdateValidate();
        Boolean[] status= userUpdateValidate.updateValidate(informationBean,userService,id);

        if (!status[20]){
            User user=new informationControlPopulator().getUser(informationBean,userService,id);
            userService.update(user);
            ModelAndView mdv=new ModelAndView();
            mdv.setViewName("redirect:/");
            return mdv;
        }else {
            model.addAttribute("error",status);
            User user=userService.findById(id);
            ModelAndView mdv=new ModelAndView();
            mdv.addObject("user",user);
            mdv.setViewName("/information");
            return mdv;
        }
    }
}
