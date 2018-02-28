package br.com.gmc.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import br.com.gmc.business.dto.CoordinateDto;
import br.com.gmc.business.dto.convert.CoordinateDtoConverter;
import br.com.gmc.business.repository.CoordinateRepository;
import br.com.gmc.business.repository.ShapeRepository;
import br.com.gmc.business.service.ICoordinateService;
import br.com.gmc.model.entities.Coordinate;
import br.com.gmc.model.entities.Shape;

@Service
public class CoordinateService extends AbstractDataService<Coordinate, Long> implements ICoordinateService{

	@Autowired
	private CoordinateRepository coordinateRepository;
	@Autowired
	private ShapeRepository shapeRepository;
	@Autowired
	private CoordinateDtoConverter converter;

	@Override
	public JpaRepository<Coordinate, Long> getRepository() {
		return this.coordinateRepository;
	}

	@Override
	public List<CoordinateDto> findByShapeId(Long shapeId) {
		Shape shape = this.shapeRepository.findOne(shapeId);
		//List<Coordinate> coordinates = this.coordinateRepository.findByShapeId(shapeId);
		return this.converter.toDtoList(shape.getCoordinates());
	}

	
	

}
