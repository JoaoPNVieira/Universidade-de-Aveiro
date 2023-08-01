package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.1.: CLASS ABSTRACT - FORMA
*/

public abstract class Forma {
    public abstract double area();
    public abstract double perimetro();
    public abstract String toString();
    public String cor;
    public Forma(String cor) {this.cor = cor;}
    
}
