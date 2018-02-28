package br.com.gmc.business.dto;

import java.util.List;

import lombok.Data;

@Data
public class ShapeDto {

	private Long id;
	private String name;
	private List<CoordinateDto> coordinates;
}
