package com.project.wood.recommend.repository;

import lombok.Data;

@Data
public class RecCommentDTO {
	private String rcseq;
	private String recommendseq;
	private String id;
	private String content;
	private String writedate;
	private String editdate;
	private String commentscore;
	
	private String nickname; //댓글 쓴 사람의 닉네임
	private String profile;	 //댓글 쓴 사람의 프로필
	
}
