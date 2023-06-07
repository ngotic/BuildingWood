package com.project.wood.user.repository;

import lombok.Data;


// tblMember 테이블에 대한 객체를 만듬 
@Data
public class UserDTO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String birth;
	private String gender;
	private String email;
	private String tel;
	private String lv;
	private String profile;
	private String ban;
	private String point;
	
	private String buildseq;
}