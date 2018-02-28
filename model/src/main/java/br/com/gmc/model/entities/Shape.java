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
@Table(name = "GMC_SHAPE")
public class Shape {

	@Id
	@SequenceGenerator(name="SEQ_SHAPE_ID", sequenceName="SEQ_SHAPE_ID", allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="SEQ_SHAPE_ID")
	@Column(name = "SHAPE_ID")
	private long id;

	@Column(name = "SHAPE_NAME")
	private String name;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "GCM_SHAPE_COORDINATE", joinColumns = @JoinColumn(name = "SHAPE_ID"), inverseJoinColumns = @JoinColumn(name = "COORDINATE_ID"))
    private List<Coordinate> coordinates;
}
