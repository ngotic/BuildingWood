package com.project.wood.promise.repository;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private String promisereplyseq;
	private String promiseseq;
	private String id;
	private String content;
	private String regdate;
	private String accept;
	
	private String nickname;
	
	
	private ArrayList<String> acceptnickname;

}
