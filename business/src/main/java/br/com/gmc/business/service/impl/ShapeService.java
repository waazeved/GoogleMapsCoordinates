package br.com.gmc.business.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import br.com.gmc.business.dto.ShapeDto;
import br.com.gmc.business.dto.convert.ShapeDtoConverter;
import br.com.gmc.business.repository.ShapeRepository;
import br.com.gmc.business.service.IShapeService;
import br.com.gmc.model.entities.Shape;

@Service
public class ShapeService extends AbstractDataService<Shape, Long> implements IShapeService {

	@Autowired
	private ShapeRepository shapeRepository;
	@Autowired
	private ShapeDtoConverter converter;

	@Override
	public JpaRepository<Shape, Long> getRepository() {
		return shapeRepository;
	}

	@Override
	public List<ShapeDto> findAllWithIdAndName() {
		List<Shape> shapes = this.findAll();
		return this.converter.toDtoListWithIdAndName(shapes);
	}

	
	
}
