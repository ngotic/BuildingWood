package com.project.wood.recommend.repository;

import lombok.Data;

@Data
public class RecommendDTO {
	private String recommendseq;
	private String restaurantseq;
	private String boardseq;
	private String title;
	private String regdate;
	private String editdate;
	private String content;
	private String image;
	private String score;
	private String love;
	
	private String fulladdress;	//식당 전체 주소
	private String category;	//식당 or 카페
	private String area; 		//지역(서울시 ~구)
	private String ccnt; 		//글에 달린 개수
	private String avgscore;		//평균 별점
	
	private String lat;		//위도
	private String lng;		//경도
}
