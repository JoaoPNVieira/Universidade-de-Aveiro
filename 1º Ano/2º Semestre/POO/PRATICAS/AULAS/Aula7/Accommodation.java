package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2
*/

public class Accommodation {
	private String code, name, address;
	private double priceanight, rating;
	private boolean available = true;
	
	//CONSTRUCTOR
	public Accommodation(String code, String name, String address, 
			double priceanight, double rating, boolean available) {
		this.code = code;
		this.name = name;
		this.address = address;
		this.priceanight = priceanight;
		this.rating = rating;
		this.available = available; }
	
	//GETTERS
	public String getCode() { return code; }
	public String getName() { return name; }
	public String getAddress() { return address; }
	public double getPriceanight() { return priceanight; }
	public double getRating() { return rating; }
	public boolean getAvailable() { return available; }
	
	//SETTERS
	public void setCode(String code) { this.code = code; }
	public void setName(String name) { this.name = name; }
	public void setAddress(String address) { this.address = address; }
	public void setPriceanight(double priceanight) { this.priceanight = priceanight; }
	public void setRating(double rating) { this.rating = rating; }
	public void setAvailable(boolean available) { this.available = available; }
	
	@Override
	public String toString() {
		return "BL" + code + " | Name: " + name + " | Address: " + address + " | Price per night: " + priceanight + 
				" | Rating: " + rating + "* | Available: " + available + "]"; }
		
}
