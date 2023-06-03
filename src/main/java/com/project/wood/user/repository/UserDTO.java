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
}

/*
id   varchar2(100)       NOT NULL,
password   varchar2(50)  NOT NULL,
name   varchar2(50)      NOT NULL,
nickname   varchar2(50)  NOT NULL,
birth   date             NOT NULL,
gender   varchar2(10)    NOT NULL,
email   varchar2(100)    NOT NULL,
tel   varchar2(20)       NOT NULL,
lv   char(1)   DEFAULT 1 NOT NULL,
profile   varchar2(100) default 'profile.jpg' NULL,
ban   char(1)   default 'n'   NULL,
point   number  default 0  NULL,
*/