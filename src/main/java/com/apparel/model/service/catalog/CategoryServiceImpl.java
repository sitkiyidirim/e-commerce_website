package com.apparel.model.service.catalog;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.dao.catalog.CategoryRepository;
import com.apparel.model.entity.catalog.CategoryModel;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Resource
	private CategoryRepository dao;
	 
	@Override
	public void save(CategoryModel CategoryModel){
		dao.save(CategoryModel);
	}

	@Override
	public void delete(Integer id){
		dao.delete(id);
	}

	@Override
	public List<CategoryModel> findAll() {
		return dao.findAll();
	}

	@Override
	@Transactional
	public CategoryModel findById(Integer id){
		return dao.findOne(id);
	}

	@Override
	public void flush() {
		dao.flush();
	}

	@Override
	public CategoryModel update(CategoryModel CategoryModel){
		dao.save(CategoryModel);
		return CategoryModel;
	}


	@Override
	public Page<CategoryModel> search(PageRequest request, Specification<CategoryModel> search) {
		return dao.findAll(search, request);
	}
	
	
	@Override
	public Page<CategoryModel> search(PageRequest request) {
		Page<CategoryModel> list= dao.findAll(request);
		return list;
	}
	
	@Override
	public List<CategoryModel> search(Specification<CategoryModel> search) {
		return dao.findAll(search);
	}
	
}
