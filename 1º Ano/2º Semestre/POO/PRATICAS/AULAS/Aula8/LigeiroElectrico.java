/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - LigeiroElectrico

*/


package Aula8;

import java.util.Objects;

public class LigeiroElectrico extends AutomovelLigeiro implements VeiculoEletrico {
    private int carga;

    //CONSTRUTOR DE VEICULO ELECTRICO
    public LigeiroElectrico(String marca, String modelo, String matricula, String numQuadro, int cv, int bagageira) {
        super(marca, modelo, matricula, numQuadro, cv, bagageira);
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
        if (!(o instanceof LigeiroElectrico)) {
            return false;
        }
        LigeiroElectrico ligeiroElectrico = (LigeiroElectrico) o;
        return carga == ligeiroElectrico.carga;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(carga);
    }

}
