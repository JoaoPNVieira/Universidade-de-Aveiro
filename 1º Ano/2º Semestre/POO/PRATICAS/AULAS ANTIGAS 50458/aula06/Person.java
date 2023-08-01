// Exercício 6.1 - Aula Prática Nº6 - Programação Orientada a Objectos
package aula06;

public class Person {
	private String name;
	private int cc;
	private Date birthday;
	
	//PERSON: CONSTRUCTOR
	public Person(String name, int cc, Date birthday) {
		this.name = name;
		this.birthday = birthday;
		this.cc = cc;
	}
	//PERSON: GETTERS
	public String getName() { return name; }
	public int getCc() { return cc; }
	public Date getBirthday() {	return birthday; }
	//PERSON: SETTERS
	public void setName(String name) { this.name = name; }
	public void setCc(int cc) {	this.cc = cc; }
	public void setBirthday(Date birthday) { this.birthday = birthday; }
	
	@Override
	public String toString() {
		return "PERSON | Name: " + name + " | CC Number: " + cc + " | Date of Birth: " + birthday + "]"; }
	
}
