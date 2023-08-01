package aula05;

public class Book {
	private int id = 100;
	private String title, loanType;
	
	public Book(String title) {
		this.id = id++;
		this.title = title;

	}
	public Book(String title, String loanType) {
		this.id = id++;
		this.title = title;
		this.loanType = loanType;;
	}
	
	public int getId() { return id;	}
	public String getTitle() { return title; }
	public String getLoanType() { return loanType; }
	
	public void setId(int id) { this.id = id; }
	public void setTitle(String title) { this.title = title; }
	public void setLoanType(String loanType) { this.loanType = loanType; }

}
