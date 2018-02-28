package br.com.gmc.business.dto.convert;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.gmc.business.dto.CoordinateDto;
import br.com.gmc.business.dto.ShapeDto;
import br.com.gmc.model.entities.Shape;

@Component
public class ShapeDtoConverter extends DtoConverter<Shape, ShapeDto> {
	
	@Autowired
	private CoordinateDtoConverter coordinateDtoConverter;


	public List<ShapeDto> toDtoList(Iterable<Shape> entityList){
		return super.toDtoList(entityList, this::toDto);
	}

	public ShapeDto toDto(Shape shape) {
		ShapeDto dto = toDtoWithIdAndName(shape);
		List<CoordinateDto> coordinateDtos = this.coordinateDtoConverter.toDtoList(shape.getCoordinates());
		dto.setCoordinates(coordinateDtos);
		return dto;
	}
	
	public List<ShapeDto> toDtoListWithIdAndName(Iterable<Shape> entityList){
		return super.toDtoList(entityList, this::toDtoWithIdAndName);
	}
	
	public ShapeDto toDtoWithIdAndName(Shape shape) {
		ShapeDto dto = new ShapeDto();
		dto.setId(shape.getId());
		dto.setName(shape.getName());
		return dto;
	}

	public List<Shape> toShapeList(Iterable<ShapeDto> dtoList){
		return super.toEntityList(dtoList, this::toShape);
	}

	public Shape toShape(ShapeDto dto) {
		Shape shape = new Shape();
		shape.setId(dto.getId());
		shape.setName(dto.getName());
		return shape;
	}

}