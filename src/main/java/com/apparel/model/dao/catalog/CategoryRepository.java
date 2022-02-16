package com.apparel.model.dao.catalog;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.entity.catalog.CategoryModel;

@Transactional
public interface CategoryRepository extends JpaRepository<CategoryModel, Integer>, JpaSpecificationExecutor<CategoryModel>{

 
}
