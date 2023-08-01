package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.1.: CIRCULO
*/

public class Circulo extends Forma {
        private double raio; 
        private Ponto ponto;
        private double perimetro;
        private double area;
        private String cor;

        //CONSTRUTOR DE CIRCULO
        public Circulo(String cor, double raio, Ponto ponto) {
            super(cor);
            this.raio = raio;
            this.ponto = ponto;
        }
                
        //GETTERS & SETTERS        
    
        public double getPerimetro()    { return perimetro; }
        public double getArea()         { return area; }
        public String getCor()          { return cor; }

        //METODO PARA OBTER AREA
        public double area() {
            area = raio*raio*Math.PI; 
            return area;
        }

        //METODO PARA OBTER PERIMETRO
        public double perimetro() {
            perimetro = raio * 2 * Math.PI; 
            return perimetro;
        }
    
        //METODO toString
        public String toString() {
            return("Circulo: [ Perimetro: " + getPerimetro() + " | Area: " + getArea() + " | Cor: " +  getCor() + " ]" );
        }

        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            long temp;
            temp = Double.doubleToLongBits(area);
            result = prime * result + (int) (temp ^ (temp >>> 32));
            result = prime * result + ((cor == null) ? 0 : cor.hashCode());
            temp = Double.doubleToLongBits(perimetro);
            result = prime * result + (int) (temp ^ (temp >>> 32));
            result = prime * result + ((ponto == null) ? 0 : ponto.hashCode());
            temp = Double.doubleToLongBits(raio);
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
            Circulo other = (Circulo) obj;
            if (Double.doubleToLongBits(area) != Double.doubleToLongBits(other.area))
                return false;
            if (cor == null) {
                if (other.cor != null)
                    return false;
            } else if (!cor.equals(other.cor))
                return false;
            if (Double.doubleToLongBits(perimetro) != Double.doubleToLongBits(other.perimetro))
                return false;
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
