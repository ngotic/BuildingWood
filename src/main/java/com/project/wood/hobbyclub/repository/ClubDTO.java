package com.project.wood.hobbyclub.repository;


import lombok.Data;

// 개설동호회 DTO
@Data
public class ClubDTO {
	private String clubseq;
	private String id;
	private String name;
	private String intro;
	private String amount;
	private String pic;
	private String opendate;
	private String approve;
	
	// no DB variable
	private String buildingname;
	private String nickname;     // 
}
