package com.project.wood.promise.repository;

import java.util.ArrayList;

import lombok.Data;

@Data
public class PromiseDTO {
	
	private String promiseseq;
	private String writer;
	private String key;
	private String title;
	private String content;
	private String category;
	private String num;
	private String regdate;
	private String editdate;
	
	private String nickname;
	private String id;
	private String profile;
	
	private String promisehashseq;
	private String hashtagseq;


	private ArrayList<String> tag;
	
	private ArrayList<String> tags;
	
	
	private int adminnum;
	
	

}
