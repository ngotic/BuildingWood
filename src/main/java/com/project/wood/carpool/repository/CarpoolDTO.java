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
	private String recruitstatus;
	private String recruit;
	
	private String recruitcount;//신청 완료(승인)된 모집인원 수
	
	//tblDriver
	private String id;
	private double score;		//평점(0.0 ~ 5.0)
	private String count;		//후기 수
	
	
	//tblCarpoolApply
	private String carpoolapplyseq;
	private String applyid;			//신청하는 회원의 아이디(로그인 중인 아이디)
	private String applystatus;		//신청 상태
	
	private String applynickname;	//신청한 회원의 닉네임
	private String applygender;		//신청한 회원의 성별
	
	//tblMember
	private String profile;
	private String nickname;	//닉네임
	private String gender;		//성별
	
	
	
}
