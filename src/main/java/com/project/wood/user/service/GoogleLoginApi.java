package com.project.wood.user.service;

public class GoogleLoginApi {
	private String googleUrl;
	private String client_id;
	private String redirect_uri;
	private String scope;
	
	public GoogleLoginApi(){
		this.googleUrl = "https://accounts.google.com/o/oauth2/auth";
		this.client_id = "88525227840-rf14e1hho5gpbk9lhu862dsubd5mb1i0.apps.googleusercontent.com";
		this.redirect_uri = "http://localhost:8090/wood/logincallbackg.do";
		this.scope="https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";
		
	}
	public String getGoogleLoginUrl() {
		return  this.googleUrl+"?client_id="+this.client_id+
		        "&redirect_uri="+ this.redirect_uri+
		        "&response_type=code&scope=" + this.scope
		        +"&approval_prompt=force&access_type=offline";
	}
	
	
}