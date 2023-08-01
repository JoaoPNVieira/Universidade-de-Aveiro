/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Pesado de Passageiros Electrico

*/


package Aula8;

import java.util.Objects;

public class PesadoDePassageirosElectrico extends PesadoDePassageiros implements VeiculoEletrico {
    private int carga;

    //CONSTRUTOR DE PESADO DE PASSAGEIROS ELECTRICO
    public PesadoDePassageirosElectrico(String marca, String modelo, String matricula, String numQuadro, int cv, int peso, int passMax) {
        super(marca, modelo, matricula, numQuadro, cv, peso, passMax);
    }

    //CARGA - GETTER E SETTER
    public int getCarga() { return this.carga; }
    public void setCarga(int carga) { this.carga = carga; }


    //IMPLEMENTAÇÃO DE METODOS INTERFACE
    @Override
    public int autonomia() { 
        carga = getCarga(); 
        return carga; 
    }

    @Override
    public void carregar(int percentagem) { 
        while(carga<100){ carga++; }
     }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof PesadoDePassageirosElectrico)) {
            return false;
        }
        PesadoDePassageirosElectrico pesadoDePassageirosElectrico = (PesadoDePassageirosElectrico) o;
        return carga == pesadoDePassageirosElectrico.carga;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(carga);
    }
}
