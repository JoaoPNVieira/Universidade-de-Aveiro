package aula03;

import java.util.Scanner;
public class HighLow {
	public static void main(String[] args) {
		System.out.println("HighLow! Guess a Number between 1 and 100.");
		int random = 1 + (int)(Math.random()*101);
		int number = 0;
		Scanner n = new Scanner(System.in);
		while (number != random) {
		System.out.print("Take a guess:");
		number = n.nextInt();
			if (number > random) {
				System.out.println("High"); 
			}
			else if (number < random) {
				System.out.println("Low");
			}
		}
System.out.print("Game Over: You Win!");
n.close();		
	}
}
