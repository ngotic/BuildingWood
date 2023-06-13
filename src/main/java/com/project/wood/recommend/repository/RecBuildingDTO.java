package com.project.wood.recommend.repository;

import lombok.Data;

@Data
public class RecBuildingDTO {
	private String buildingseq;
	private String name;
	private String address;
	private String lat;
	private String lng;
}
