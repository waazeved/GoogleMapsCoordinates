package br.com.gmc.business.service;

import java.util.List;

import br.com.gmc.business.dto.ShapeDto;
import br.com.gmc.model.entities.Shape;

public interface IShapeService extends IDataService<Shape, Long>{

	List<ShapeDto> findAllWithIdAndName();


}
