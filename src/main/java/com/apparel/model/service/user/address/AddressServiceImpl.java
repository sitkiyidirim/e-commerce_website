package com.apparel.model.service.user.address;

import com.apparel.model.dao.user.address.AddressRepository;
import com.apparel.model.entity.user.Address;
import com.apparel.model.entity.user.User;
import com.apparel.model.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    AddressRepository addresDAO;

    @Autowired
    UserService userService;

    @Override
    public Address save(Address address){
        return addresDAO.save(address);
    }

    @Override
    public List<Address> findByAdress(HttpServletRequest request){
        String login_id =(String) request.getSession().getAttribute("id");
        int id=Integer.valueOf(login_id);

       User user= userService.findById(id);
     return  addresDAO.findByUser(user);
    }

    @Override
    public void createAdres(Address address){
        save(address);
    }


    @Override
    public void delete(int id){
        addresDAO.delete(id);
    }

    @Override
    public List<Address> findAll() {
        return addresDAO.findAll();
    }

    @Override
    @Transactional
    public Address findById(int id){
        return addresDAO.findOne(id);
    };

    @Override
    public Address update(Address address){
        addresDAO.save(address);
        return address;
    }

}
