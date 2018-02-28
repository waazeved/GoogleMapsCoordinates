
package br.com.gmc.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import br.com.gmc.business.dto.ShapeDto;
import br.com.gmc.business.service.IShapeService;


@RestController
@RequestMapping(value = "/shape")
public class ShapeController {

	@Autowired
	private IShapeService shapeService;

	@RequestMapping(value = "/findAllWithIdAndName", method = RequestMethod.GET)
	public List<ShapeDto> findAllWithIdAndName(){
		return this.shapeService.findAllWithIdAndName();
	}

}