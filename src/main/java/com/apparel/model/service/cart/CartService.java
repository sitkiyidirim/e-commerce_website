package com.apparel.model.service.cart;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.apparel.model.entity.cart.CartModel;

public interface CartService {

	public CartModel save(CartModel Cart);
	
	public CartModel update(CartModel Cart);
 
	public void delete(Integer id);

	public List<CartModel> findAll();
 
	public CartModel findById(Integer id);
 
	public void flush();
 
	public Page<CartModel> search(PageRequest request, Specification<CartModel> search);
	
	public List<CartModel> search(Specification<CartModel> search);
	
	public Page<CartModel> search(PageRequest request);

	void refresh(CartModel cart);
	
}