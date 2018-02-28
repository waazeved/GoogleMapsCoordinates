
package br.com.gmc.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.gmc.business.dto.CoordinateDto;
import br.com.gmc.business.service.ICoordinateService;


@RestController
@RequestMapping(value = "/coordinate")
public class CoordinateController {

	@Autowired
	private ICoordinateService coordinateService;

	@RequestMapping(value = "/findByShapeId/{shapeId}", method = RequestMethod.GET)
	public List<CoordinateDto> findByShapeId(@PathVariable("shapeId") Long shapeId){
		return this.coordinateService.findByShapeId(shapeId);
	}

}