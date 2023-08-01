/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Motociclo

Motociclo: (marca, modelo, matricula, cv, numQuadro, tipo)

*/

package Aula8;

import java.util.Objects;

public class Motociclo extends Veiculo {
    private String tipo;

    //CONSTRUTOR DE MOTOCICLO
    public Motociclo(String marca, String modelo, String matricula, String numQuadro, int cv, String tipo) {
        super(marca, modelo, matricula, numQuadro, cv);
        this.tipo = tipo;
    }

    //TIPO: GETTER E SETTER
    public String getTipo()             { return this.tipo; }
    public void setTipo(String tipo)    { this.tipo = tipo; }

    //toString
    @Override
    public String toString() {
        return "{ MOTOCICLO: " + super.toString() + "Tipo: " + getTipo() + " }" ;
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Motociclo)) {
            return false;
        }
        Motociclo motociclo = (Motociclo) o;
        return Objects.equals(tipo, motociclo.tipo);
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(tipo);
    }   
}
