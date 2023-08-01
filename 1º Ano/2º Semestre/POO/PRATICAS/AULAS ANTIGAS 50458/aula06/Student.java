// Exercício 6.1 - Aula Prática Nº6 - Programação Orientada a Objectos
package aula06;

public class Student extends Person {
	private int mec = 100;
	private static int count = 0;
	private Date entrydate;
	
	//STUDENT: CONSTRUTOR
	public Student(String name, int cc, Date birthday, Date entrydate) {
		super(name, cc, birthday); 
		this.mec = mec + count; count++;
		this.entrydate = entrydate; }
	
	//STUDENT: GETTERS
	public int getMec() { return mec; }
	public Date getEntry() { return entrydate; }
	//STUDENT: SETTERS
	public void setMec(int nmec) {	this.mec = nmec; }
	public void setEntrydate(Date entrydate) { this.entrydate = entrydate; }
	
	@Override
	public String toString() { 
		return "Name: " + getName() + " | Student ID: " + mec + 
				" | Date of Birth: " + getBirthday() + " | Entry Date:" + entrydate; }
}
