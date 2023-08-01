package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2
*/

public class Car {
	private String registration, brand, model, color, fuel, rank;
	private boolean available = true;
	private int seats;
	
	//CONSTRUCTOR:
	public Car(String registration, String brand, String model, 
			int seats, String color, String fuel, String rank, boolean available) {
		this.brand = brand;
		this.seats = seats;
		this.color = color;
		this.fuel = fuel;
		this.rank = rank; 
		this.setAvailable(available); }
	
	//GETTERS:
	public String getRegistration() { return registration; }
	public String getBrand() { return brand; }
	public String getModel() { return model; }
	public int getSeats() { return seats; }
	public String getColor() { return color; }
	public String getFuel() { return fuel; }
	public String getRank() { return rank; }
	public boolean isAvailable() { return available; }
	//SETTERS:
	public void setRegistration(String registration) { this.registration = registration; }
	public void setBrand(String brand) { this.brand = brand; }
	public void setModel(String model) { this.model = model; }
	public void setSeats(int seats) { this.seats = seats; }
	public void setColor(String color) { this.color = color; }
	public void setFuel(String fuel) { this.fuel = fuel; }	
	public void setRank(String rank) { this.rank = rank; }
	public void setAvailable(boolean available) { this.available = available; }	
	
	@Override
	public String toString() {
		return registration + " | " + brand + " " + model + " | Fuel: " + fuel + 
				" | Color: " + color + " | N� of Seats: " + seats + " | Class Rank: " + rank + "]"; }
	
}