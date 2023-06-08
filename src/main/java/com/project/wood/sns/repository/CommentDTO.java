package com.project.wood.sns.repository;

import lombok.Data;

@Data
public class CommentDTO {
	private String snscommentseq;
	private String snsboardseq;
	private String id;
	private String content;
	private String writedate;
	private String editdate;
}
