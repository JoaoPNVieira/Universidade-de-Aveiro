/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - PesadoDeMercadorias

Veiculo Pesado de Mercadorias: (marca, modelo, matricula, cv, numQuadro, peso, cargaMax)

*/

package Aula8;

import java.util.Objects;

public class PesadoDeMercadorias extends Pesado {
    private int cargaMax; //Unidades: Quilogramas (Kg) - Nota: Não vamos usar toneladas pois Quilogramas torna as medidas mais flexiveis para valores inferiores a 1 Tonelada

    //CONSTRUTOR DE PESADO DE MERCADORIAS
    public PesadoDeMercadorias(String marca, String modelo, String matricula, String numQuadro, int cv, int peso, int cargaMax) {
        super(marca, modelo, matricula, numQuadro, cv, peso);
        this.cargaMax = cargaMax;
    }

    //CARGA MÁXIMA: GETTER E SETTER
    public int getCargaMax() { return this.cargaMax; }
    public void setCargaMax(int cargaMax) { this.cargaMax = cargaMax; }


    //toString
    @Override
    public String toString() {
        return "{ PESADO DE MERCADORIAS: " + super.toString() + "Carga Máxima: " + getCargaMax() + " }" ;
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof PesadoDeMercadorias)) {
            return false;
        }
        PesadoDeMercadorias pesadoDeMercadorias = (PesadoDeMercadorias) o;
        return cargaMax == pesadoDeMercadorias.cargaMax;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hashCode(cargaMax);
    }
}
