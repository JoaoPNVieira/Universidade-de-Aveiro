/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Taxi

Taxi: (marca, modelo, matricula, cv, numQuadro, bagageira(volume), licença)

*/

package Aula8;

import java.util.Objects;

public class Taxi extends AutomovelLigeiro {
    private String licenca;

    //CONSTRUTOR DE TAXI
    public Taxi(String marca, String modelo, String matricula, String numQuadro, int cv, int bagageira, String licenca) {
        super(marca, modelo, matricula, numQuadro, cv, bagageira);
        this.licenca = licenca;
    }

    //LICENCA: GETTER E SETTER
    public String getLicenca()              { return this.licenca; }
    public void setLicenca(String licenca)  { this.licenca = licenca; }

    //toString
    @Override
    public String toString() {
        return "{ TAXI: " + super.toString() + "Número de Licença: " + getLicenca() + " }" ;
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Taxi)) {
            return false;
        }
        Taxi taxi = (Taxi) o;
        return Objects.equals(licenca, taxi.licenca);
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(licenca);
    }   
}
