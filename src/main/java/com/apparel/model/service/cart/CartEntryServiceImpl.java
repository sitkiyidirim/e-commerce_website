package com.apparel.model.service.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.dao.cart.CartEntryRepository;
import com.apparel.model.entity.cart.CartEntryModel;

@Service
@Transactional
public class CartEntryServiceImpl implements CartEntryService {

	@Resource
	private CartEntryRepository dao;
	 
	@Override
	public void save(CartEntryModel CartEntryModel){
		dao.save(CartEntryModel);
	}

	@Override
	public void delete(Integer id){
		dao.delete(id);
	}

	@Override
	public List<CartEntryModel> findAll() {
		return dao.findAll();
	}

	@Override
	@Transactional
	public CartEntryModel findById(Integer id){
		return dao.findOne(id);
	}

	@Override
	public void flush() {
		dao.flush();
	}

	@Override
	public CartEntryModel update(CartEntryModel CartEntryModel){
		dao.save(CartEntryModel);
		return CartEntryModel;
	}


	@Override
	public Page<CartEntryModel> search(PageRequest request, Specification<CartEntryModel> search) {
		return dao.findAll(search, request);
	}
	
	
	@Override
	public Page<CartEntryModel> search(PageRequest request) {
		Page<CartEntryModel> list= dao.findAll(request);
		return list;
	}
	
	@Override
	public List<CartEntryModel> search(Specification<CartEntryModel> search) {
		return dao.findAll(search);
	}

}
