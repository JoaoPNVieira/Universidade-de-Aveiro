// Exercício 6.1 - Aula Prática Nº6 - Programação Orientada a Objectos 
package aula06;

public class Date {
	private boolean leap;
	private String error ="";
	private int day, month, year, actual = 2020;
	
	//DATE: CONSTRUCTOR
	public Date(int day, int month, int year) {
		this.day = day; day = day();
		this.month = month; month = month();
		this.year = year; year = year(); 
	}
	//DATE: GETTERS
	public int getDay() { return day; }
	public int getMonth() { return month; }
	public int getYear() { return year; }
	public int getActual() { return actual;}
	//DATE: SETTERS
	public void setDay(int day) { this.day = day; }
	public void setMonth(int month) { this.month = month; }
	public void setYear(int year) { this.year = year; }
	public void setActual(int actual) { this.actual = actual; }
	
	//DATE METHOD: year() 
	public int year() {
		if (year<1900 || year>2020 ) 
		{ error = " - ERROR: Year out of range."; }
	return year; }
	
	//DATE METHOD: month()
	public int month(){
		if (month<0 || month>12)
		{ error = " - ERROR: Month number out of range."; }
		switch(month) {
				case 1:
					break;
				case 2:
					leap = leapYear(leap);
					if (leap == true && day>29) 
					{ error = " - ERROR: Number of Days out of range."; } 
					else if (leap == false && day>28)
					{ error = " - ERROR: Number of Days out of range."; }
					break;
				case 3:
					break;
				case 4:
					if (day>30) 
					{ error = " - ERROR: Number of Days out of range."; }
					break;
				case 5:
					break;
				case 6:
					if (day>30) 
					{ error = " - ERROR: Number of Days out of range."; }
					break;
				case 7:
					break;
				case 8:
					break;
				case 9:
					if (day>30) 
					{ error = " - ERROR: Number of Days out of range."; }
					break;
				case 10:
					break;
				case 11:
					if (day>30) 
					{ error = " - ERROR: Number of Days out of range."; }
					break;
				case 12:
					break;
				default: break; }
	return month; }
	
	//METHOD: day()
	public int day() {
		if (day<0 || day>31) 
		{ error = " - ERROR: Number of Days out of range."; }
	return day;	}
	
	//METHOD: leapYear()
	public boolean leapYear(boolean leap) {	
		if ( year%400 == 0 || year%4 == 0 && year%100 != 0) 
		{ leap = true; }
		else 
		{ leap = false; }
		return leap; }
		
	@Override
	public String toString() {
	return day + "/" + month + "/" + year + error; }
	
}