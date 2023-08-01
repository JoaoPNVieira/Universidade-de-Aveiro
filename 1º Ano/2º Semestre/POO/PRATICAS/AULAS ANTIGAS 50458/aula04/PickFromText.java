// Exercício 4.1 - Aula Prática Nº4 - Programação Orientada a Objectos
package aula04;

import java.util.Scanner;
public class PickFromText {

	public static void main(String[] args) {
		System.out.println("Welcome to Pick From Text!" + "\n");
		
		String cont ="yes";
		while (cont.equals("yes")) {
			String textUser, c3; char tc; String choice;
			System.out.print("Please enter your text here:");
			Scanner t = new Scanner (System.in);
			textUser = "";
			if(t.hasNextLine()) {
				textUser = t.nextLine();
				}
			choice = makeChoice();
			
		switch (choice) {
			case "1":
				System.out.println("Your Text: " + textUser);
				break;
			case "2":
				System.out.println("Conversion: "+ textUser.toUpperCase());
				break;
			case "3":
				System.out.println("Conversion: "+ textUser.toLowerCase());
				break;
			case "4":
				tc = textUser.charAt(0);
				System.out.println("First Character is: " + tc);
				break;
			case "5":
				tc = textUser.charAt(textUser.length()-1);
				System.out.println("Last Character is: " + tc);
				break;
			case "6":
				if (textUser.length()>2) {
					c3 = textUser.substring(0, 3);
					System.out.println("The First 3 Characters are: " + c3);
					break;
					}
			case "7":
				System.out.println("Program Terminated...Good Bye");
				cont ="no";
				break;
			default:
				break;
			}}
		}

	public static void menu() {
		System.out.println("\n" + "What whoud you like to do with your text?" + "\n");
		System.out.println("Option: 1 - Read Text.");
		System.out.println("Option: 2 - Convert Text to Uppercase.");
		System.out.println("Option: 3 - Convert Text to Lowercase.");
		System.out.println("Option: 4 - Read the Last Character in the Text.");
		System.out.println("Option: 5 - Read the First Character in the Text.");
		System.out.println("Option: 6 - Read the First 3 Character in the Text");
		System.out.println("Option: 7 - Shut Down Program" + "\n");
	}

	public static String makeChoice() {
		menu();
		System.out.print("Select Option:");
		Scanner ch = new Scanner (System.in);
		String choice = "";
		if(ch.hasNextLine()) {
			choice = ch.nextLine();
		}
	return choice;
    }
}