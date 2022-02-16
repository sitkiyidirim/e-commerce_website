package com.apparel.model.service.catalog;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.apparel.model.entity.catalog.ProductModel;

public interface ProductService {

	public void save(ProductModel Product);
	
	public ProductModel update(ProductModel Product);
 
	public void delete(Integer id);

	public List<ProductModel> findAll();
	
	public ProductModel findById(Integer id);
	
	public ProductModel findByCode(String code);

	public void flush();
 
	public Page<ProductModel> search(PageRequest request, Specification<ProductModel> search);
	
	public List<ProductModel> search(Specification<ProductModel> search);
	
	public Page<ProductModel> search(PageRequest request);
	
}