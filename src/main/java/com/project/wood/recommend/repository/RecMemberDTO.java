package com.project.wood.recommend.repository;

import lombok.Data;

@Data
public class RecMemberDTO {
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
