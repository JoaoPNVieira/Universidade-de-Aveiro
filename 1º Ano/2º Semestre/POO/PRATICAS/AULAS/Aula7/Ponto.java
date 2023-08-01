package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.1.: PONTO (PARA CIRCULO)
*/

public class Ponto {
    
    //DEFINIR VARIÀVEIS
    private double x; //Coordenada: Eixo X
	private double y; //Coordenada: Eixo Y
	
	//CONSTRUTOR DO PONTO NO ESPAÇO 2D
	public Ponto(double x, double y) {
        this.x = x; 
        this.y = y;
    }
	
	//GETTERS & SETTERS
	public double getX() {return x;}
	public double getY() {return y;}

    void setX(double tX) {x = tX;}
	void setY(double tY) {y = tY;}
	
	
	//METODO toString()
	public String toString() {return("Coordenadas: (" + getX() + " | " + getY() + ")");}

    //METODO hasCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(x);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(y);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

    //METODO equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Ponto other = (Ponto) obj;
        if (Double.doubleToLongBits(x) != Double.doubleToLongBits(other.x))
            return false;
        if (Double.doubleToLongBits(y) != Double.doubleToLongBits(other.y))
            return false;
        return true;
    }
}

