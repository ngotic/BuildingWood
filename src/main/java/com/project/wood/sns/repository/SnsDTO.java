package com.project.wood.sns.repository;

import java.util.List;

import lombok.Data;

@Data
public class SnsDTO {

	private String snsboardseq;
	private String id;
	private String boardcategoryseq;
	private String buildingseq;
	private String content;
	private String regdate;
	private String editdate;
	
	private String nickname;
	private String profile;
	private String clike;
	private String pic;
	private String pic2;
	private String pic3;
	private String cpic;
	
	boolean liked;
	
	private String snslikeseq;
	private String snscommentseq;

	private List<String> likelist;

	
}
