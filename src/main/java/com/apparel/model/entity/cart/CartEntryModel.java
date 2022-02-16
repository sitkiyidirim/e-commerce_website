package com.apparel.model.entity.cart;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.apparel.model.entity.BaseEntity;

@Entity
@Table(name = "cart_entries")
public class CartEntryModel extends BaseEntity implements java.io.Serializable{ 	
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity=CartModel.class)
	@JoinColumn(name = "cart_id")
	private CartModel cart;
	
	public CartModel getCart() {
		return cart;
	}
	
	public void setCart(CartModel cart) {
		this.cart = cart;
	}
   
	
	 
}