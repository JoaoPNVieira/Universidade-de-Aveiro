package Aula5;

import java.util.InputMismatchException;
import java.util.Scanner;




/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.1. - Testar Class Data:
->  Para testar a Classe Data, crie um programa de teste, com o seguinte menu (DateTest.java):
        Date operations:
        1 - create new date
        2 - show current date
        3 - increment date
        4 - decrement date
        0 - exit
*/
public class DateTest extends Date {
    public DateTest(int d, int m, int y) { super(d, m, y); }

    public static int d, m, y, op = -1;
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        Date date = new Date(0, 0, 0);
        while(op!=0){
        
            try {
                
                while(op<0 || op>5){
                    System.out.println( "Date Operations:       \n " + 
                                        "1 - Create new date    \n " +
                                        "2 - Show current date  \n " + 
                                        "3 - Increment date     \n " + 
                                        "4 - Decrement date     \n " + 
                                        "0 - Exit               \n"  ); 
                    System.out.print("Operation: ");op = in.nextInt();
               
                    switch(op){
                        case 1: 
                            System.out.print("Insira o dia: "); d = in.nextInt();
                            System.out.print("Insira o mês: "); m = in.nextInt();
                            System.out.print("Insira o ano: "); y = in.nextInt();
                            date = new Date(d,m,y); op = 6; break;
                        case 2:
                            System.out.println(date.toString()); op = 6; break;
                        case 3:
                            date = date.increment(); op = 6; break; //não grava valor e volta a incrementar
                        case 4:
                            date = date.decrement(); op = 6; break;
                        case 0:
                            System.out.println("Goodbye..."); break;
                        default:
                            op = 6; System.out.println("Operation does not exist! Try again: "); break;
                    }
                }
            } 
            catch (InputMismatchException e) { 
                System.out.println("ERROR: Insert a numéric integer operation value!"); 
            }

            in.close();
        }
        
    }
        
}
    

