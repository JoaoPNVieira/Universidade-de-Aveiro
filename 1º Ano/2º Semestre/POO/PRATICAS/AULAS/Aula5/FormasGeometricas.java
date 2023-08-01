package Aula5;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.3.:

Implemente classes que permitam modelar as seguintes formas geométricas:
    • Círculo, caracterizado pelo seu raio;
    • Triângulo, caracterizado pela dimensão dos seus lados (lado1, lado2, lado3);
    • Retângulo, caracterizado por comprimento e altura.

    Garanta ainda as seguintes especificações:
        a) crie classes que representem cada uma das figuras geométricas, implementando
        construtores e métodos adequados para cada classe.

        b) adicione todos os métodos especiais importantes (toString(), equals(), get…(),
        set…(), ...);

        c) nos construtores e métodos modificadores (set...), verifique pré-condições adequadas:
            - raio e lados têm de ser valores positivos;
            - lados do triângulo têm de satisfazer a desigualdade triangular;

        d) implemente um método para calcular a área de cada tipo de figura (para triângulo, ver
        fórmula de Heron);
        
        e) implemente um método para calcular o perímetro de cada tipo de figura;

        f) implemente um programa que teste todas as classes e métodos criados; o programa
        deve criar um conjunto de figuras, especificadas pelo utilizador através de um menu,
        listá-las (o método toString() deve mostrar o tipo e características da figura), e
        comparar os pares de figuras do mesmo tipo (método equals()).
*/

public class FormasGeometricas {
    public static void main(String[] args) {
		
		//DEFINIR VARIAVEIS
		double x = 1.0;
		double y = 5.0;
		double w = 9.0;
		double z = 2.0; 
		
        //RETANGULO & TRIANGULO
        Retangulo r1 = new Retangulo(x,y);
		Triangulo t1 = new Triangulo((int)x, (int)y, (int)z);

        //CIRCULOS
        Ponto p1 = new Ponto(x,y);
		Ponto p2 = new Ponto(w, z);
		Circulo c1 = new Circulo(2.0, p1);
		Circulo c2 = new Circulo(5.0, p2);
		
		//TESTE DE FUNCIONALIDADE 
        
        System.out.println(p1.toString());
        System.out.println(p2.toString());
        System.out.println(p1.equals(p2));
		System.out.println(c1.getRaio());
        System.out.println(c1.equals(c2));
		System.out.printf("%.3f \n", c1.getPerimetro());
        System.out.println(c2.getRaio());
		System.out.printf("%.3f \n", c2.getPerimetro());
        System.out.println(c1.equals(c2));
        System.out.println(c1.toString());
        System.out.println(c2.toString());
		System.out.println(r1.getArea());
		System.out.println(r1.toString());
		System.out.println(t1.getPerimetro());
        System.out.println(t1.toString());
    }	
}
