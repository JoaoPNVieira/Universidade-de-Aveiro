/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Pesado

Veiculo Pesado: Comum a todos: (marca, modelo, matricula, cv, numQuadro, peso)

*/

package Aula8;

import java.util.Objects;

public class Pesado extends Veiculo {
    private int peso;

    //CONSTRUTOR DE VEICULO PESADO
    public Pesado(String marca, String modelo, String matricula, String numQuadro, int cv, int peso) {
        super(marca, modelo, matricula, numQuadro, cv);
        this.peso = peso; //Unidades: Quilogramas (Kg)
    }

    //PESO: GETTER E SETTER
    public int getPeso()            { return this.peso; }
    public void setPeso(int peso)   { this.peso = peso; }

    //toString
    @Override
    public String toString() {
        return super.toString() + "Peso: " + getPeso() + "Kg, " ;
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Pesado)) {
            return false;
        }
        Pesado pesado = (Pesado) o;
        return peso == pesado.peso;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(peso);
    }
}
