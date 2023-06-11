package com.project.wood.suggest.repository;

import lombok.Data;

@Data
public class SuggestDTO {
	private String suggestseq;
	private String id;
	private String boardcategoryseq;
	private String title;
	private String content;
	private String regdate;
	private String editdate;
	private String category;
	private String readcount;
	
	private String nickname;
	private double isnew; //최신글 확인용 시간
}
