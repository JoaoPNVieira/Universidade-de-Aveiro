package aula05;

public class User {
	private String name, course; 
	private int nMec;
	
	public User(String name, int nMec, String course) {
		this.name = name;
		this.nMec = nMec;
		this.course = course;
	}
	
	public String getName() { return name; }
	public String getCourse() {	return course; }
	public int getnMec() { return nMec; }
	
	public void setName(String name) { this.name = name; }
	public void setCourse(String course) { this.course = course; }
	public void setnMec(int nMec) { this.nMec = nMec; }
	
}