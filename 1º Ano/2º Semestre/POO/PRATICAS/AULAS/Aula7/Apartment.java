package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2
*/

public class Apartment extends Accommodation {
	private int bedrooms, kitchens, livingrooms, wcs;
	
	//CONSTRUCTOR
	public Apartment(String code, String name, String local, int bedrooms, 
					int kitchens, int livingrooms, int wcs, double price, double ranking, boolean available) {
		super(code, name, local, price, ranking, available);
		this.bedrooms = bedrooms;
		this.kitchens = kitchens;
		this.livingrooms = livingrooms;
		this.wcs = wcs; }
	
	//GETTERS
	public int getBedrooms() { return bedrooms; }
	public int getKitchens() { return kitchens; }
	public int getLivingrooms() { return livingrooms; }
	public int getWcs() { return wcs; }
	//SETTERS
	public void setBedrooms(int bedrooms) { this.bedrooms = bedrooms; }
	public void setKitchens(int kitchens) { this.kitchens = kitchens; }
	public void setLivingrooms(int livingrooms) { this.livingrooms = livingrooms; }
	public void setWc(int wcs) { this.wcs = wcs; }

	@Override
	public String toString() {
		return "BL" + getCode() + " | Name: " + getName() + " | Address: " + getAddress() + 
		"\n |ROOMS: Bedrooms: " + bedrooms + " | Livingrooms: " + livingrooms + 
		" | Kitchens: " + kitchens + " | Bathrooms: " + wcs + " | Price per night: " + getPriceanight() +	
		"\n | Rating: " + getRating() + "* | Available: " + getAvailable(); }
	
}
