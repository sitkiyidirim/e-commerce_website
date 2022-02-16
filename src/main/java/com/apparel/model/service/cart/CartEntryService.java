package com.apparel.model.service.cart;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.apparel.model.entity.cart.CartEntryModel;

public interface CartEntryService {

	public void save(CartEntryModel CartEntry);
	
	public CartEntryModel update(CartEntryModel CartEntry);
 
	public void delete(Integer id);

	public List<CartEntryModel> findAll();
 
	public CartEntryModel findById(Integer id);

	public void flush();
 
	public Page<CartEntryModel> search(PageRequest request, Specification<CartEntryModel> search);
	
	public List<CartEntryModel> search(Specification<CartEntryModel> search);
	
	public Page<CartEntryModel> search(PageRequest request);
	
}