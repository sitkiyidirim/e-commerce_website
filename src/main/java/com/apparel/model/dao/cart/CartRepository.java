package com.apparel.model.dao.cart;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.entity.cart.CartModel;

@Transactional
public interface CartRepository extends JpaRepository<CartModel, Integer>, JpaSpecificationExecutor<CartModel>{


	
}
