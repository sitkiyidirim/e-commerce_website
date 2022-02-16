package com.apparel.model.service.catalog;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.dao.catalog.CategoryRepository;
import com.apparel.model.dao.catalog.ProductRepository;
import com.apparel.model.entity.catalog.ProductModel;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductRepository dao;

	@Resource
	private CategoryRepository categoryRepository;

	@Override
	public void save(ProductModel ProductModel) {
		dao.save(ProductModel);
	}

	@Override
	public void delete(Integer id) {
		dao.delete(id);
	}

	@Override
	public List<ProductModel> findAll() {
		return dao.findAll();
	}

	@Override
	@Transactional
	public ProductModel findById(Integer id) {
		return dao.findOne(id);
	}

	@Override
	public void flush() {
		dao.flush();
	}

	@Override
	public ProductModel update(ProductModel product) {
		return dao.save(product);
	}

	@Override
	public Page<ProductModel> search(PageRequest request, Specification<ProductModel> search) {
		return dao.findAll(search, request);
	}

	@Override
	public Page<ProductModel> search(PageRequest request) {
		Page<ProductModel> list = dao.findAll(request);
		return list;
	}

	@Override
	public List<ProductModel> search(Specification<ProductModel> search) {
		return dao.findAll(search);
	}

	@Override
	public ProductModel findByCode(String code) {
		return dao.findByCode(code);
	}


}
