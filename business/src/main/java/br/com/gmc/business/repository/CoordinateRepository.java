package br.com.gmc.business.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.gmc.model.entities.Coordinate;

public interface CoordinateRepository extends JpaRepository<Coordinate, Long> {
	
	
}
