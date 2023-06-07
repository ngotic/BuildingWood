package com.project.wood.carpool.repository;

import lombok.Data;

@Data
public class CarpoolDTO {

	//tblCarpool
	private String carpoolseq;
	private String boardcategoryseq;
	private String driverseq;
	
	private String content;
	
	private String regdate;
	private String ttime;
	
	private String departurescity;
	private String departures; 
	private String arrivalscity;
	private String arrivals;
	
	private String fee;
	private String status;
	private String recruit;
	
	
	//tblDriver
	private String id;
	private double score;		//평점(0.0 ~ 5.0)
	private String count;			//후기 수
	
	
	//tblMember
	private String nickname;	//닉네임
	private String gender;		//성별
	
	
	
}
