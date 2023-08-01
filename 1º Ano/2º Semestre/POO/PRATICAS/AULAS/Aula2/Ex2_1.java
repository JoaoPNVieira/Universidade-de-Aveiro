package Aula2;
import java.util.Scanner;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº2 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 2.1.:
->  Escreva um programa que lê um valor real que representa uma distância em quilómetros,
    converte-o para milhas e imprime o resultado. A fórmula de conversão é a seguinte: Milhas =
    Quilómetros / 1.609.
*/

public class Ex2_1 {
    public static void main(String[] args) {
    //DEFINIÇÃO DE VARIAVEIS:
    String s, op = ""; Double km, miles = 0.0; int retry = 2;
    
    //CICLO WHILE PARA CORRER CÓDIGO ATÉ retry != 2
    while(retry == 2){
        System.out.println("Conversor de distância: Quilómetros para Milhas"); 
        Scanner input = new Scanner(System.in);                     
        km = -1.0; //----------------------------------------------------------------------------> Distância negativa apenas para efeitos Debug
            while(km < 0) { //-------------------------------------------------------------------> Distância não são negativas
                System.out.print("Distancia a converter: ");
                s =  input.nextLine();                                  
                
                try  { 
                    km = Double.valueOf(s); 
                    miles = (km / 1.609); //-----------------------------------------------------> Fórmula de conversão
                    System.out.println(km + " Quilómetros = " + miles + " Milhas"); } //---------> Mensagem de resultado obtido
                catch (NumberFormatException e) {  //--------------------------------------------> Caso valor de entrada não ser número, faz catch do erro e colta a fazer o ciclo while anterior
                    km = -1.0;
                    System.out.println("ERRO: Valor de entrada não é um número"); }        
            }  
        
        //CICLO WHILE PARA ESCOLHA DO USER: CORRER NOMAMENTE O PROGRAMA:
        retry = 3; //----------------------------------------------------------------------------> Variàvel retry a 3 para opção inválida de retry
        while(retry == 3){
            System.out.print("Deseja converter novamente? (Y/N): ");
            Scanner r = new Scanner(System.in);
            op = r.nextLine().toUpperCase(); 
            
            switch(op){
                case "N" :  retry = 1; System.out.println("Até à próxima!"); r.close(); input.close(); break; 
                case "Y" :  retry = 2; System.out.println("Iniciando outra tentativa: "); break; 
                default:    retry = 3; System.out.println("ERRO: Opção inválida!"); break;
            }
        }
    }
    }
}