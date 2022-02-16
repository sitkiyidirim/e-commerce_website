package com.apparel.actions.controler.populator;

import com.apparel.actions.controler.forms.UpdateAddresesUpdateBean;
import com.apparel.actions.controler.forms.UpdateAdressBean;
import com.apparel.model.entity.user.Address;
import com.apparel.model.service.user.UserService;

import javax.servlet.http.HttpServletRequest;

public class UpdateAddressUpdatePopulator {

    public Address getAdress(UpdateAddresesUpdateBean updateAdressBean, HttpServletRequest request, UserService userService){

        String login_id = (String) request.getSession().getAttribute("id");
        int id = Integer.valueOf(login_id);

        Address address=new Address();
        address.setId(Integer.valueOf(updateAdressBean.getAddressId()));
        address.setUser(userService.findById(id));
        address.setTitle_address(updateAdressBean.getAddressTitle());
        address.setName(updateAdressBean.getName());
        address.setSurname(updateAdressBean.getSurname());
        address.setAddressline(updateAdressBean.getAddressline());
        address.setCity(sehirler[Integer.valueOf(updateAdressBean.getCity())-1]);
        address.setDistrict(updateAdressBean.getDistrict());
        address.setCountry(updateAdressBean.getCountry());
        address.setPostcode(updateAdressBean.getPostcode());


        return address;
    }

    String[] sehirler ={"Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
            "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
            "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
            "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
            "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
            "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
            "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
            "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
            "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"};
}
