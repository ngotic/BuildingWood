package com.project.wood.admin.repository;

import lombok.Data;

@Data
public class MemberInBuildingDTO {
	private String id;
	private String nickname;
	private String email;
	private String tel;
	private String birth;
	private String profile;
	private String replycnt;
	private String boardcnt;
}
