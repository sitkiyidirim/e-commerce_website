package com.apparel.actions.exception;


public enum EErrorCode {
 
	AUTHENTICATION_ERROR("AUTHENTICATION_ERROR", "Giriş yapmalısınız.");
 
	private String code;
	private String msg;
	
	private EErrorCode(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
 
}