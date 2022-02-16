package com.apparel.model.service.cart;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import com.apparel.model.dao.cart.CartRepository;
import com.apparel.model.entity.cart.CartModel;

@Service
@Transactional
public class CartServiceImpl implements CartService {

	@PersistenceContext
	private EntityManager em;

	@Resource
	private CartRepository dao;
	 
	@Override
	public CartModel save(CartModel CartModel){
		return dao.save(CartModel);
	}

	@Override
	public void delete(Integer id){
		dao.delete(id);
	}

	@Override
	public List<CartModel> findAll() {
		return dao.findAll();
	}

	@Override
	@Transactional
	public CartModel findById(Integer id){
		return dao.findOne(id);
	}

	@Override
	public void flush() {
		dao.flush();
	}

	@Override
	public CartModel update(CartModel CartModel){
		dao.save(CartModel);
		return CartModel;
	}


	@Override
	public Page<CartModel> search(PageRequest request, Specification<CartModel> search) {
		return dao.findAll(search, request);
	}
	
	
	@Override
	public Page<CartModel> search(PageRequest request) {
		Page<CartModel> list= dao.findAll(request);
		return list;
	}
	
	@Override
	public List<CartModel> search(Specification<CartModel> search) {
		return dao.findAll(search);
	}
 
	@Override
	@Transactional
	public void refresh(CartModel cart) {
		TransactionSynchronizationManager.setActualTransactionActive(Boolean.TRUE);
		em.refresh(cart);
		TransactionSynchronizationManager.setActualTransactionActive(Boolean.FALSE);
	}
}
