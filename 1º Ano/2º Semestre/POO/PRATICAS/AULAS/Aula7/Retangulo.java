package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.1.: RETÂNGULO
*/

public class Retangulo extends Forma{
    
    //DEFINIR VARIÀVEIS
    private double altura, comprimento, area, perimetro;
    private String cor;
	//CONSTRUTOR DE RETANGULO
	
    public Retangulo(String cor, double altura, double comprimento) {
        super(cor);
        this.altura = Math.abs(altura); 
        this.comprimento = Math.abs(comprimento);
    }
	
	//GETTERS AND SETTERS

    public double getArea() { return area; }
    public double getPerimetro() { return perimetro; }
    public String getCor() { return cor; }
    
    //METODO PARA OBTER PERIMETRO
    public double perimetro() {
        double perimetro = 2*comprimento + 2*altura; 
        return perimetro;
    }
    
    //METODO PARA OBTER AREA
	public double area() {
        double area = comprimento * altura; 
        return area;
    }
	
    //METODO toString()
    public String toString() {
        return("Rectângulo: [ Perimetro: " + getPerimetro() + " | Area: " + getArea() + " | Cor: " +  getCor() + " ]");
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(altura);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(area);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(comprimento);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        result = prime * result + ((cor == null) ? 0 : cor.hashCode());
        temp = Double.doubleToLongBits(perimetro);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        return result;
    }

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
        if (Double.doubleToLongBits(area) != Double.doubleToLongBits(other.area))
            return false;
        if (Double.doubleToLongBits(comprimento) != Double.doubleToLongBits(other.comprimento))
            return false;
        if (cor == null) {
            if (other.cor != null)
                return false;
        } else if (!cor.equals(other.cor))
            return false;
        if (Double.doubleToLongBits(perimetro) != Double.doubleToLongBits(other.perimetro))
            return false;
        return true;
    }

    

}
