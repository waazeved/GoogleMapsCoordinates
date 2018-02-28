package br.com.gmc.model.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "GMC_COORDINATE")
public class Coordinate {

	@Id
	@SequenceGenerator(name="SEQ_COORDINATE_ID", sequenceName="SEQ_COORDINATE_ID", allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="SEQ_COORDINATE_ID")
	@Column(name = "COORDINATE_ID")
	private long id;

	@Column(name = "COORDINATE_NAME")
	private String name;
	
	@Column(name = "COORDINATE_LATI")
	private Double latitude;
	
	@Column(name = "COORDINATE_LONG")
	private Double longitude;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "GCM_SHAPE_COORDINATE", joinColumns = @JoinColumn(name = "COORDINATE_ID"), inverseJoinColumns = @JoinColumn(name = "SHAPE_ID"))
    private List<Shape> shapes;
	
}
