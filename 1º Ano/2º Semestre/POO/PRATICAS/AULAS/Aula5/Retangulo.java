package Aula5;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.3.: RETÂNGULO
*/

public class Retangulo {
    
    //DEFINIR VARIÀVEIS
    private double altura, comprimento; 
	
	//CONSTRUTOR DE RETANGULO
	public Retangulo(double altura, double comprimento) {
        this.altura = Math.abs(altura); 
        this.comprimento = Math.abs(comprimento);
    }
	
	//GETTERS AND SETTERS
    public double getComprimento() {return comprimento;}
	public double getAltura() {return altura;}
    
    public void setComprimento(double tCom) {comprimento = tCom;}
	public void setAltura(double tAlt) {altura = tAlt;}
		
	
    //METODO PARA OBTER PERIMETRO
	public double getPerimeter() {
        double perimetro = 2*comprimento + 2*altura; 
        return perimetro;
    }
    
    //METODO PARA OBTER AREA
	public double getArea() {
        double area = comprimento * altura; 
        return area;
    }
	
    //METODO toString()
    public String toString() {
        return("[ Altura: " + getAltura() + " | Comprimento: "+ getComprimento() + " ]");}


    //hasCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(altura);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(comprimento);
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
        Retangulo other = (Retangulo) obj;
        if (Double.doubleToLongBits(altura) != Double.doubleToLongBits(other.altura))
            return false;
        if (Double.doubleToLongBits(comprimento) != Double.doubleToLongBits(other.comprimento))
            return false;
        return true;
    }
}
