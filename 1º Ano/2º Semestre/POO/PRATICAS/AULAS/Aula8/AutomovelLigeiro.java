/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - AutomóvelLigeiro

Automovel Ligeiro: (marca, modelo, matricula, cv, numQuadro, bagageira(volume))

*/

package Aula8;

import java.util.Objects;

public class AutomovelLigeiro extends Veiculo {
    private int bagageira; //(Unidades: Litros)
    
    //CONSTRUTOR DE AUTOMÓVEL LIGEIRO 
    public AutomovelLigeiro(String marca, String modelo, String matricula, String numQuadro, int cv, int bagageira) {
        super(marca, modelo, matricula, numQuadro, cv);
        this.bagageira = bagageira;
    }


    //BAGAGEIRA: GETTER E SETTER
    public int getBagageira()               { return this.bagageira; }
    public void setBagageira(int bagageira) { this.bagageira = bagageira; }

    //toString
    @Override
    public String toString() {
        return "{ AUTOMÓVEL LIGEIRO: " + super.toString() + "Volume de Bagageira: " + getBagageira() + " Litros }" ;
    }


    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof AutomovelLigeiro)) {
            return false;
        }
        AutomovelLigeiro automovelLigeiro = (AutomovelLigeiro) o;
        return bagageira == automovelLigeiro.bagageira;
    }

    //HASHCODE
    @Override
    public int hashCode() { return Objects.hashCode(bagageira); }
}
