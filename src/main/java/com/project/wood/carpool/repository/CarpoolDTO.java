package com.project.wood.carpool.repository;

import lombok.Data;

@Data
public class CarpoolDTO {

	private String carpoolseq;
	private String boardcategoryseq;
	private String driverseq;
	private String content;
	private String regdate;
	private String departtime;
	private String departures; 
	private String arrivals;
	private int fee;
	private String status;
	private String recruit;
	
	// 시/도 추가 필요		
	
	
	private String nickname;	//닉네임
	private String gender;		//성별
	
	private int score;		//평점(0.0 ~ 5.0)
	private int count;			//후기 수
	
	
}
