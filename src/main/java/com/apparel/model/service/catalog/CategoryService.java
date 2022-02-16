package com.apparel.model.service.catalog;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;

import com.apparel.model.entity.catalog.CategoryModel;

public interface CategoryService {

	public void save(CategoryModel Category);
	
	public CategoryModel update(CategoryModel Category);
 
	public void delete(Integer id);

	public List<CategoryModel> findAll();
 
	public CategoryModel findById(Integer id);

	public void flush();
 
	public Page<CategoryModel> search(PageRequest request, Specification<CategoryModel> search);
	
	public List<CategoryModel> search(Specification<CategoryModel> search);
	
	public Page<CategoryModel> search(PageRequest request);
	
}