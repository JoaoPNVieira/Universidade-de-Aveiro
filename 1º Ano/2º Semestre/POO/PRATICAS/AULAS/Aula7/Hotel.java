package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2
*/

public class Hotel extends Accommodation{
	private String roomtype;
	
	//CONSTRUCTOR
	public Hotel(String code, String name, String address, String roomtype,
			double priceanight, double rating, boolean available) {
		super(code, name, address, priceanight, rating, available);
		this.roomtype = roomtype; }


	//GETTERS & SETTERS
	public String getRoomtype() { return roomtype; }
	public void setRoomtype(String roomtype) { this.roomtype = roomtype; }


	@Override
	public String toString() {
		return "BL" + getCode() + " | Name: " + getName() + " | Address: " + getAddress() + 
				" | Room Type: " + roomtype + " | Price per night: " + getPriceanight() +	
				" | Rating: " + getRating() + "* | Available: " + getAvailable(); }
}
