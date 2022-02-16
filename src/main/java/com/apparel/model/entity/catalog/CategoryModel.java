package com.apparel.model.entity.catalog;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.apparel.model.entity.BaseEntity;

@Entity
@Table(name = "categories")
public class CategoryModel extends BaseEntity implements java.io.Serializable{ 	
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "name")
	private String name;

	@ManyToOne
	@JoinColumn(name = "parent_id")
	private CategoryModel parent;

	@OneToMany(mappedBy = "parent", cascade = CascadeType.ALL)
	private List<CategoryModel> categories = new ArrayList<CategoryModel>();
 
  
    @ManyToMany
    @JoinTable(name = "product_category", 
      joinColumns = @JoinColumn(name = "category_id",referencedColumnName = "id"), 
      inverseJoinColumns = @JoinColumn(name = "product_id", referencedColumnName = "id"))
    private List<ProductModel> products;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CategoryModel getParent() {
		return parent;
	}

	public void setParent(CategoryModel parent) {
		this.parent = parent;
	}

	public List<CategoryModel> getCategories() {
		return categories;
	}

	public void setCategories(List<CategoryModel> categories) {
		this.categories = categories;
	}

	public List<ProductModel> getProducts() {
		return products;
	}

	public void setProducts(List<ProductModel> products) {
		this.products = products;
	}
	
}