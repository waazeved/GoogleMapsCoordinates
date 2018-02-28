package br.com.gmc.business.dto.convert;

import java.util.List;

import org.springframework.stereotype.Component;

import br.com.gmc.business.dto.CoordinateDto;
import br.com.gmc.model.entities.Coordinate;

@Component
public class CoordinateDtoConverter extends DtoConverter<Coordinate, CoordinateDto> {


	public List<CoordinateDto> toDtoList(Iterable<Coordinate> entityList){
		return super.toDtoList(entityList, this::toDto);
	}

	public CoordinateDto toDto(Coordinate coordinate) {
		CoordinateDto dto = new CoordinateDto();
		dto.setId(coordinate.getId());
		dto.setName(coordinate.getName());
		dto.setLatitude(coordinate.getLatitude());
		dto.setLongitude(coordinate.getLongitude());
		return dto;
	}

	public List<Coordinate> toCoordinateList(Iterable<CoordinateDto> dtoList){
		return super.toEntityList(dtoList, this::toCoordinate);
	}

	public Coordinate toCoordinate(CoordinateDto dto) {
		Coordinate coordinate = new Coordinate();
		coordinate.setId(dto.getId());
		coordinate.setName(dto.getName());
		coordinate.setLatitude(dto.getLatitude());
		coordinate.setLongitude(dto.getLongitude());
		return coordinate;
	}

}