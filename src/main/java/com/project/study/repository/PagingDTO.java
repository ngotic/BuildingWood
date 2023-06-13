package com.project.study.repository;

import lombok.Data;

@Data
public class PagingDTO {
	private final int maxBorad = 5; //화면에 출력하는 게시글 개수
	private final int maxBoardPagingnumber = 10; //화면에 출력하는 페이지 번호 최대개수 ex [ 1, 2, 3 ... 9, 10]  ex [5,6,7 .... 13,14]
	
	private int maxContent; //최대 게시글개수
	private int maxPage ; //최대페이지개수
	private int startListpageNumber =1;
	private int endtListpageNumber =10;
	
	
	private int starPage =1;
	
	
	
	private int startNumber =0; //페이지시작숫자
	private int endNumber =4; 	 //페이지마지막숫자
	private int endBordNumber; //리스트의 마지막 게시글 숫자	
	private int pageNumber =1; //현재 클릭한 페이지 번호 초기값 1
	private int pageNumber2 = 1; // 페이지 앞번호
	private String clicknumber = "1"; //클릭받은 페이지 번호
	
	private int lastupdatepagenumber = 0;
	
	
	
}
