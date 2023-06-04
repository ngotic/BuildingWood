package com.project.wood.carpool.repository;

import lombok.Data;

@Data
public class CarpoolDTO {

	private String carpoolseq;
	private String boardcategoryseq;
	private String driverseq;
	private String content;
	private String regdate;
	private String arrivals;
	private String departures; 
	private int fee;
	private String status;
	private String recruit;
	
}
