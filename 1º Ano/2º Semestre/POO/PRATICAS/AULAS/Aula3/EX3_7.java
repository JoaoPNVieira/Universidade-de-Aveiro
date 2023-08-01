package Aula3;

import java.util.Random;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 3.7.:
->  O jogo AltoBaixo consiste em tentar adivinhar um número (inteiro) entre 1 e 100. O 
    programa escolhe um número aleatoriamente. Depois, o utilizador insere uma tentativa e o 
    programa indica se é demasiado alta, ou demasiado baixa. Isto é repetido até o utilizador 
    acertar no número. O jogo deve indicar quantas tentativas foram feitas e de seguida 
    perguntar: “Pretende continuar? Prima (S)im”. O programa termina caso a resposta seja
    diferente de “S” ou “Sim”. 
    
    Sugestão: para ler uma palavra utilize o método next: String resposta = sc.next();
*/
public class EX3_7 {
  
    public static void main(String[] args){
        
        //DEFINIR VARIÀVEIS
		int numbCerto, tentativa, contagem, r = 1;
		
        while(r==1){
            //VALORES
            Random rand = new Random();
            Scanner in = new Scanner(System.in);
            numbCerto = rand.nextInt(100) + 1;
            System.out.println("Advinhe o numero! (entre 0 e 100): ");
            tentativa = in.nextInt();	
            contagem = 1;
            
            //LOOPS DO WHILE PARA REGRAS
            do {
                if(tentativa > numbCerto) {
                    System.out.println("Demasiado alto.");
                    tentativa = in.nextInt(); }
                else{
                    System.out.println("Demasiado baixo.");
                    tentativa = in.nextInt(); }
                
                contagem++;
                if(tentativa == numbCerto) {
                    System.out.println("Correto! Levou " + contagem + " tentativas. \n");
                    
                    //RESTART

                    System.out.println("Pretende continuar? Prima (S)im");
                    Scanner inResp = new Scanner(System.in);
                    String resp = inResp.nextLine().toUpperCase();
                    if(resp.equals("S") || resp.equals("SIM")) { resp = "S"; }
                    else { resp = "N";}
                    switch(resp) {
                        case "S" : r = 1; System.out.println("Outra Jogada!"); break;
                        case "N" : r = 0; System.out.println("Foi um prazer jogar consigo. Até à próxima!"); inResp.close(); in.close(); break;
                        default  : r = 0; inResp.close(); in.close(); break;
                    }
                }
            }while(numbCerto != tentativa);	
        }
    }
}
