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
	public String geoJsonByShapeId(Long shapeId) {
		List<CoordinateDto> coordinates = findByShapeId(shapeId);
		String geoJson = "{" + 
				"  \"type\": \"FeatureCollection\"," + 
				"  \"features\": [" + 
				"    {\r\n" + 
				"      \"type\": \"Feature\"," + 
				"      \"properties\": {" + 
				"        \"letter\": \"G\"," + 
				"        \"color\": \"blue\"," + 
				"        \"rank\": \"7\"," + 
				"        \"ascii\": \"71\"" + 
				"      },\r\n" + 
				"      \"geometry\": {" + 
				"        \"type\": \"MultiPolygon\"," + 
				"        \"coordinates\": [" + 
				"          [" + 
				"            <COORDINATES>" + 
				"          ]" + 
				"        ]" + 
				"      }" + 
				"    }]}";
		
		String coordinatesGeoJson = "";
		for (CoordinateDto coordinateDto : coordinates) {
			coordinatesGeoJson += "[" + coordinateDto.getLatitude() + "," + coordinateDto.getLongitude() + "],";
		}
		
		geoJson = geoJson.replace("<COORDINATES>", coordinatesGeoJson);
		
		return geoJson;
		
	}

	@Override
	public List<CoordinateDto> findByShapeId(Long shapeId) {
		Shape shape = this.shapeRepository.findOne(shapeId);
		return this.converter.toDtoList(shape.getCoordinates());
	}

	
	

}
