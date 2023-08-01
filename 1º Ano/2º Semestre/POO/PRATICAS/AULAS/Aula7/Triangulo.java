package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.1.: TRIANGULO
*/

public class Triangulo extends Forma {
    
    //DEFINIR VARIÀVEIS
    private double lado1, lado2, lado3, perimetro;
    private double area;
    private String cor;
    
    //CONSTRUTOR DE TRIANGULO
    public Triangulo(String cor, double lado1, double lado2, double lado3) {
        super(cor);
        this.lado1 = Math.abs(lado1);
        this.lado2 = Math.abs(lado2);
        this.lado3 = Math.abs(lado3);
    }

    //GETTERS & SETTERS
    public double getPerimetro() { return perimetro; }
    public double getArea() { return area; }
    public String getCor() { return cor; }

    //METODO PARA OBTER PERIMETRO
    public double perimetro(){
        perimetro = lado1 + lado2 + lado3;
        return perimetro;
    }
    
    //METODO PARA OBTER AREA (formula de Heron)
	public double area(){
        area = Math.sqrt((perimetro/2)*((perimetro/2)* lado1)*((perimetro/2)*lado2)*((perimetro/2)*lado3)); //Formula de Heron
        return area;
    }

    //METODO toString
    public String toString() {
        return("Triângulo: [ Perimetro: " + getPerimetro() + " | Area: " + getArea() + " | Cor: " +  getCor() + " ]" );
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits(area);
        result = prime * result + (int) (temp ^ (temp >>> 32));
        result = prime * result + ((cor == null) ? 0 : cor.hashCode());
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

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Triangulo other = (Triangulo) obj;
        if (Double.doubleToLongBits(area) != Double.doubleToLongBits(other.area))
            return false;
        if (cor == null) {
            if (other.cor != null)
                return false;
        } else if (!cor.equals(other.cor))
            return false;
        if (Double.doubleToLongBits(lado1) != Double.doubleToLongBits(other.lado1))
            return false;
        if (Double.doubleToLongBits(lado2) != Double.doubleToLongBits(other.lado2))
            return false;
        if (Double.doubleToLongBits(lado3) != Double.doubleToLongBits(other.lado3))
            return false;
        if (Double.doubleToLongBits(perimetro) != Double.doubleToLongBits(other.perimetro))
            return false;
        return true;
    }
    
    


}
