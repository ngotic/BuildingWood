package com.project.wood.sns.repository;

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
	private String cpic;
	
	
	private String snscommentseq;
	
	
}
