/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - PesadoDePassageiros

Veiculo Pesado de Passageiros: (marca, modelo, matricula, cv, numQuadro, peso, passMax)

*/

package Aula8;

import java.util.Objects;

public class PesadoDePassageiros extends Pesado{
    private int passMax; //Número máximo de passageiros

    public PesadoDePassageiros(String marca, String modelo, String matricula, String numQuadro, int cv, int peso, int passMax) {
        super(marca, modelo, matricula, numQuadro, cv, peso);
        this.passMax = passMax;
    }

    //Nº MAXIMO DE PASSAGEIROS: GETTER E SETTER
    public int getPassMax() { return this.passMax; }
    public void setPassMax(int passMax) { this.passMax = passMax; }

    //toString
    @Override
    public String toString() {
        return "{ PESADO DE PASSAGEIROS: " + super.toString() + "Número Máximo de Passageiros: " + getPassMax() + " }" ;
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof PesadoDePassageiros)) {
            return false;
        }
        PesadoDePassageiros pesadoDePassageiros = (PesadoDePassageiros) o;
        return passMax == pesadoDePassageiros.passMax;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(passMax);
    }


    
}
