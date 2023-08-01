package Aula5;
import java.util.InputMismatchException;
/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.5.:
-> Utilizando as classes desenvolvidas no exercício anterior, implemente um programa que
    permita gerir os utilizadores e empréstimos numa biblioteca. Comece por construir, de uma
    forma interativa, o seguinte menu:
        1 - inscrever utilizador
        2 - remover utilizador
        3 - imprimir lista de utilizadores
        4 - registar um novo livro
        5 - imprimir lista de livros
        6 - emprestar
        7 - devolver
        8 - sair
    Condições adicionais:
        a) Recomenda-se que as operações de empréstimo e devolução sejam efetuadas com
        base no ID do livro e no número mecanográfico do aluno.
        b) Cada aluno só poderá requisitar simultaneamente um máximo de 3 livros. Deve
        modificar a classe utilizador para poder guardar os IDs dos livros requisitados, bem
        como a classe livro para indicar a sua disponibilidade.
        c) Para simplificar, considere que apenas existe uma cópia de cada livro e que os livros
        com tipo de empréstimo CONDICIONAL não podem ser requisitados.
        d) Para guardar o catálogo de livros e a lista de alunos, utilize vetores, considerando que
        no máximo a biblioteca pode ter 100 livros e 100 utilizadores.
*/
import java.util.Scanner;

public class Sistema {
    public static int nMec, nLivros, nUsers, op = 9;
    public static String nome, curso;
    public static Utilizador listaUser[] = new Utilizador[100];
    public static Livro catalogo[] = new Livro[100];
    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        while(op!=8){
        
            try {
                
                while(op<0 || op>8){
                    System.out.println( "Operações de Biblioteca            \n " + 
                                        "1 - inscrever utilizador           \n " +
                                        "2 - remover utilizador             \n " + 
                                        "3 - imprimir lista de utilizadores \n " + 
                                        "4 - registar um novo livro         \n " + 
                                        "5 - imprimir lista de livros       \n " +
                                        "6 - emprestar                      \n " +
                                        "7 - devolver                       \n " +
                                        "8 - sair                           \n " ); 
                    System.out.print("Operação: ");op = in.nextInt();
               
                    switch(op){
                        case 1: 
                            Utilizador user = new Utilizador(nome, nMec, curso);
                            listaUser[nUsers] = user;
                            nUsers++;

                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                        case 7:
                        case 8:
                        default:
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
