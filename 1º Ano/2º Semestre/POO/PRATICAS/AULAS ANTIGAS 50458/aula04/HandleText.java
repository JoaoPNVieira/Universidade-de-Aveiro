package aula04;

import java.util.Scanner;

public class HandleText {

	public static void main(String[] args) {
		
		Scanner p = new Scanner (System.in);
		System.out.println("Enter your text here:");
		String phrase = p.nextLine();

		countDigit(phrase);
	}

	public static int countDigit(String c) {
		int count = 0;
		String phrase ="";
			for(int i = 0; i==phrase.lenght(); i++) {
			if (Character.isDigit(c.charAt(i))) {
				count++;
			}
		}
	}
	
		
public static boolean palindrom(String s) {
	boolean pal = true;
	for(int i=0; i<s.length()/2; i++)
		if (s.charAt(i) != s.charAt(s.lenght()-1-i)) {
			pal=false;
			break;
		}
}



public static int countSpaces(String s) {
	char sp= ' ';
	int count = 0;
	for (int i=0; i < s.length();i++)
		if (s.charAt(i)==sp);
	count++;
return count;
}
}
