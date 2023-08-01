package Aula5;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.3.: TRIANGULO
*/


public class Triangulo {
    
    //DEFINIR VARIÀVEIS
    private double lado1, lado2, lado3, perimetro;
    
    //CONSTRUTOR DE TRIANGULO
    public Triangulo(double lado1, double lado2, double lado3) {
        this.lado1 = Math.abs(lado1);
        this.lado2 = Math.abs(lado2);
        this.lado3 = Math.abs(lado3);
    }

    //GETTERS & SETTERS
    public double getLado1() {return lado1;}
    public double getLado2() {return lado2;}
    public double getLado3() {return lado3;}

    public void setLado1(double lado1) {this.lado1 = lado1;}
    public void setLado2(double lado2) {this.lado2 = lado2;}
    public void setLado3(double lado3) {this.lado3 = lado3;}
    
    //METODO PARA OBTER PERIMETRO
	public double getPerimetro() {
        perimetro = lado1 + lado2 + lado3; 
        return perimetro;
    }
    
    //METODO PARA OBTER AREA (formula de Heron)
	public double getArea() {
        double area = Math.sqrt((perimetro/2)*((perimetro/2)* lado1)*((perimetro/2)*lado2)*((perimetro/2)*lado3)); //Formula de Heron
        return area;
    }
	
    //METODO toString()
	public String toString() {
        return("[ LadoNº1: " + getLado1() + " | Lado Nº2: " + getLado2() + "; Lado Nº3: " + getLado3() + " ]"); 
    }

    //hasCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(lado1);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(lado2);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(lado3);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(perimetro);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    //equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Triangulo other = (Triangulo) obj;
        if (Double.doubleToLongBits(lado1) != Double.doubleToLongBits(other.lado1))
            return false;
        if (Double.doubleToLongBits(lado2) != Double.doubleToLongBits(other.lado2))
            return false;
        if (Double.doubleToLongBits(lado3) != Double.doubleToLongBits(other.lado3))
            return false;
        if (Double.doubleToLongBits(perimetro) != Double.doubleToLongBits(other.perimetro))
            return false; 
        
        return true; //Se restantes falhares então equals() == True
    }
}
