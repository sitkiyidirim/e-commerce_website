package com.apparel.model.entity.user;

public enum EUserType {
 
	ADMIN(1), STANDART(2);
	
	private EUserType(Integer id) {
		this.id = id;
	}

	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
