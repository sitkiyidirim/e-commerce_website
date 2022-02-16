package com.apparel.model.service.user.address;

import com.apparel.model.entity.user.Address;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AddressService {
    @Transactional
    Address save(Address address);

    List<Address> findByAdress(HttpServletRequest request);

    void createAdres(Address address);

    void delete(int id);

    List<Address> findAll();

    @Transactional
    Address findById(int id);

    Address update(Address address);
}
