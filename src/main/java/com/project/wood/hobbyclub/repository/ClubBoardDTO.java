package com.project.wood.hobbyclub.repository;

import lombok.Data;

@Data
public class ClubBoardDTO {
	private String hobbyclubseq;
	private String clubseq;
	private String recruits;
	private String regdate;
	private String editdate;
	private String openregdate;
	private String closeregdate;
	private String content;
	// 아래는 조인으로 가져온 것 
	private String id;
	private String name;
	private String buildingname;
	private String opendate;
	private String amount;
	
	private String status;   // 신청중 가입중 
	private String nickname; // 
	private String clubpic;      // 동호회 사진
	
}
