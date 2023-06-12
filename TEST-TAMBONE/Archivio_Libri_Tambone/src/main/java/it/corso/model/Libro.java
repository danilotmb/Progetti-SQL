package it.corso.model;

import java.util.ArrayList;
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
import javax.persistence.Table;

@Entity
@Table(name = "libri")
public class Libro 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "titolo")
	private String titolo;
	
	@Column(name = "copertina")
	private String copertina;
	
	@Column(name = "trama")
	private String trama;
	
	@ManyToMany
	(
		cascade = CascadeType.REFRESH,
		fetch = FetchType.EAGER
		
	)
	@JoinTable
	(
			name = "libri_autori",
			joinColumns = @JoinColumn( name = "id_autore", referencedColumnName = "id"),
			inverseJoinColumns = @JoinColumn(name = "id_libro", referencedColumnName = "id")		
	)
	private List<Libro> libri = new ArrayList<>();
	

	public List<Libro> getLibri() {
		return libri;
	}

	public void setLibri(List<Libro> libri) {
		this.libri = libri;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getCopertina() {
		return copertina;
	}

	public void setCopertina(String copertina) {
		this.copertina = copertina;
	}

	public String getTrama() {
		return trama;
	}

	public void setTrama(String trama) {
		this.trama = trama;
	}
	
	
	
	
	
	
}
