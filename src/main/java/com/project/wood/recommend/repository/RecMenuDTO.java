package com.project.wood.recommend.repository;

import lombok.Data;

@Data
public class RecMenuDTO {
	private String menuseq;
	private String restaurantseq;
	private String menu;
	private String price;
	
	private String mcnt;//메뉴 갯수(count)
}
