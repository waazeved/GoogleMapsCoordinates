
package br.com.gmc.business.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.gmc.model.entities.Shape;

public interface ShapeRepository extends JpaRepository<Shape, Long> {

	

}
