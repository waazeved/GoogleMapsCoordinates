package br.com.gmc.business.service;

import java.util.List;

import br.com.gmc.business.dto.CoordinateDto;
import br.com.gmc.model.entities.Coordinate;


public interface ICoordinateService extends IDataService<Coordinate, Long> {

	List<CoordinateDto> findByShapeId(Long shapeId);

	String geoJsonByShapeId(Long shapeId);
}
