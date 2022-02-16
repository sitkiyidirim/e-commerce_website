package com.apparel.model.dao.catalog;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.apparel.model.entity.catalog.ProductModel;

@Transactional
public interface ProductRepository extends JpaRepository<ProductModel, Integer>, JpaSpecificationExecutor<ProductModel> {

	ProductModel findByCode(String code);

//	@Query("SELECT p FROM ProductModel pWHERE  e.id = p.type AND p.code =:variantType")
//	public List<ProductModel> findByCode(@Param("code") String code);
}
