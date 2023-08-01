// Exercício 6.1 - Aula Prática Nº6 - Programação Orientada a Objectos
package aula06;

public class Scholarship extends Student {
	private double svalue;
	
	//SCHOLARSHIP: CONSTRUCTOR
	public Scholarship(String name, int cc, Date birthday, Date entrydate) {
		super(name, cc, birthday, entrydate);
	}
	//SCHOLARSHIP: GETTER & SETTER
	public double getSvalue() { return svalue; }
	public void setSvalue(double svalue) { this.svalue = svalue; }

	@Override
	public String toString() { 
		return "Name: " + getName() + " | NMec: " + getMec() + " | Date of Birth: " + getBirthday() + 
				" | Entry Date: " + getEntry() + " | Scholarship Value: " + svalue + "€"; }

}