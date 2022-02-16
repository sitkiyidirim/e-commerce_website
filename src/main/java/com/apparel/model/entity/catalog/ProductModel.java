package com.apparel.model.entity.catalog;

import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.apparel.model.entity.BaseEntity;

 
@Entity
@Table(name = "products")
public class ProductModel extends BaseEntity implements java.io.Serializable{
	
 
	@Column(name = "name")
	private String name;
 
    @ManyToMany
    @JoinTable(name = "product_category", 
    	       inverseJoinColumns = @JoinColumn(name = "category_id",referencedColumnName = "id"), 
    	    	joinColumns = @JoinColumn(name = "product_id", referencedColumnName = "id"))
    private List<CategoryModel> categories;
	
	@Column(name = "code")
	private String code;
 

	@Column(name = "price")
	private Double price;
	
	@Column(name = "description")
	private String description;
	
	@Transient
	private Integer image;


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public List<CategoryModel> getCategories() {
		return categories;
	}


	public void setCategories(List<CategoryModel> categories) {
		this.categories = categories;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public Integer getImage() {
		return new Random().nextInt(5) + 1;
	}


	public void setImage(Integer image) {
		this.image = image;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
}