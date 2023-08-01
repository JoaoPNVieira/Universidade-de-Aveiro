package Aula5;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.3.: CÍRCULO
*/

public class Circulo {
    private double raio; 
	private Ponto ponto; 
	
	//CONSTRUTOR DE CIRCULO
	public Circulo(double raio, Ponto ponto) {
        this.raio = raio; 
        this.ponto = ponto;
    }
    
    
    //GETTERS & SETTERS
    public double getRaio() {return raio;}
    public Ponto getPonto() {return ponto;}

    public void setRaio(double raio) {this.raio = raio;}
    public void setPonto(Ponto ponto) {this.ponto = ponto;}


    //METODO PARA OBTER PERIMETRO

    //METODO PARA OBTER AREA
    public double getArea() {
        double area = raio*raio*Math.PI; 
        return area;
    }
	
	//METODO PARA OBTER PERIMETRO
	public double getPerimetro() {
        double perimetro = raio * 2 * Math.PI; 
        return perimetro;
    }

	//METODO toString
	public String toString() {
        return("[ Perimetro: " + getPerimetro() + " | Area: " + getArea() + " ]");
    }

    //hashCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((ponto == null) ? 0 : ponto.hashCode());
        long temp;
        temp = Double.doubleToLongBits(raio);
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
        Circulo other = (Circulo) obj;
        if (ponto == null) {
            if (other.ponto != null)
                return false;
        } else if (!ponto.equals(other.ponto))
            return false;
        if (Double.doubleToLongBits(raio) != Double.doubleToLongBits(other.raio))
            return false;
        return true;
    }

    
}
