package com.apparel.model.dao.cart;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.entity.cart.CartEntryModel;

@Transactional
public interface CartEntryRepository extends JpaRepository<CartEntryModel, Integer>, JpaSpecificationExecutor<CartEntryModel>{

}
