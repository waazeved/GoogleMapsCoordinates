package br.com.gmc.business.dto;

import lombok.Data;

@Data
public class CoordinateDto {

	private Long id;
	private String name;
	private Double latitude;
	private Double longitude;
}
