package aula05;

import java.util.ArrayList;
import java.util.Scanner;

public class UsersAndLoans {
	
	public static void main(String[] args) {
		
	//INICIO DE METODO DE SELEÇÃO DE OPÇÃO
	
	Book catalog [] = new Book[100]; 
	ArrayList<User> students = new ArrayList<>();	
	
	String cont ="yes";
	while (cont.equals("yes")) {
		
		String choice = makeChoice();
		
	switch (choice) {
		case "1":
			Scanner name = new Scanner(System.in);
			System.out.print("Students Name: ");
			String st = name.nextLine();
			Scanner n = new Scanner(System.in);
			System.out.print("Students Mechanographic Number: ");
			int numb = n.nextInt();
			Scanner c = new Scanner(System.in);
			System.out.print("Students Course: ");
			String cour = c.nextLine();
			students.add(new User(st, numb, cour));
			System.out.println("Student Registred! \n");
			break;
		case "2":
			students.remove(1);
			break;
		case "3":
			for (User u : students) {
				System.out.println(u);
			}
			break;
		case "4":
			Scanner bt = new Scanner(System.in);
			System.out.print("Book Title: ");
			String btitle = bt.nextLine();
			Scanner l = new Scanner(System.in);
			System.out.print("Type of Loan: ");
			String ltype = l.nextLine();
			Scanner s = new Scanner(System.in);
			System.out.print("Enter shelf number: ");
			int shelf = s.nextInt();
			catalog[shelf] = new Book(btitle, ltype);
			System.out.println("Book Registred \n!");
			break;
		case "5":
			for (int i = 0; i < catalog.length; i++) {
				if (catalog[i] != null) {
					System.out.println(catalog[i]);
				}
			}
			break;
		case "6":
			break;
		case "7":
			break;
		case "8":
			System.out.println("");
			cont ="no";
			break;
		default:
			break;
		}
	}
}


public static void menu() {
	System.out.println("\n" + "MENU" + "\n");
	System.out.println("Option: 1 - Register User.");
	System.out.println("Option: 2 - Remove User.");
	System.out.println("Option: 3 - Print Users List.");
	System.out.println("Option: 4 - Register new Book.");
	System.out.println("Option: 5 - Print Books List.");
	System.out.println("Option: 6 - Loan Book.");
	System.out.println("Option: 7 - Book Return.");
	System.out.println("Option: 8 - Quit." + "\n");
	}
public static String makeChoice() {
	menu();
	System.out.print("Select an Option: ");
	Scanner ch = new Scanner (System.in);
	String choice = "";
	if(ch.hasNextLine()) {
		choice = ch.nextLine();
	}
return choice;
}


}
