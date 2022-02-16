package com.apparel.model.dao.user.address;

import com.apparel.model.entity.user.Address;
import com.apparel.model.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface AddressRepository extends JpaRepository<Address,Integer> {

    List<Address> findByUser(User user);
}
