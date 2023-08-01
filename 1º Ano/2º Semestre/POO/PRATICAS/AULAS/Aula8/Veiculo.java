/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Veiculo

VEICULOS 
LIGEIROS: POR OMISSÃO/DEFAULT: 
    Comum a todas as Classes derivadas: (marca, modelo, matricula, cv, numQuadro)

    [ NOTA: Todos os veiculos têm número do quadro pelo que não faz sentido a moto não o ter no seu construtor. ]
    
    2 rodas:    Motociclo:          (marca, modelo, matricula, cv, numQuadro, tipo)
    4 rodas:    AutomovelLigeiro:   (marca, modelo, matricula, cv, numQuadro, bagageira(volume))
                Taxi:               (marca, modelo, matricula, cv, numQuadro, bagageira(volume), licença)
        
PESADOS:
    Comum: (marca, modelo, matricula, cv, numQuadro, peso)
    4 rodas:    de Mercadoria:  (marca, modelo, matricula, cv, numQuadro, peso, cargaMax)
                de Passageiros: (marca, modelo, matricula, cv, numQuadro, peso, passMax)
*/

package Aula8;

import java.util.Objects;
import java.util.Vector;

public class Veiculo implements KmPercorridosInterface{
    private String marca, modelo, matricula, numQuadro;
    private int cv; //Potência - Unidades: Cavalos vapor
 
    private Vector<Integer> dist = new Vector<Integer>();
    private int resultado;

    public Veiculo(String marca, String modelo, String matricula, String numQuadro, int cv){
        this.marca = marca;
        this.modelo = modelo;
        this.matricula = matricula;
        this.numQuadro = numQuadro;
        this.cv = cv;
    }

    //VEICULO - GETTERS:
    public String getMarca()        { return this.marca; }
    public String getModelo()       { return this.modelo; }
    public String getMatricula()    { return this.matricula; }
    public String getNumQuadro()    { return this.numQuadro; }
    public int getCv()              { return this.cv; }
    
    //VEICULO - SETTERS:
    public void setMarca(String marca)          { this.marca = marca; }
    public void setModelo(String modelo)        { this.modelo = modelo; }
    public void setMatricula(String matricula)  { this.matricula = matricula; }
    public void setNumQuadro(String numQuadro)  { this.numQuadro = numQuadro; }
    public void setCv(int cv)                   { this.cv = cv; }
    
    //toString:
    @Override
    public String toString() {
        return "Marca: " + getMarca() + ", Modelo: " + getModelo() + ", Matrícula: " + getMatricula() 
                    + ", Número do Quadro: " + getNumQuadro() + ", Potência: " + getCv() + "Cv, ";
    }

    //EQUALS:
    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Veiculo)) {
            return false;
        }
        Veiculo veiculo = (Veiculo) o;
        return Objects.equals(marca, veiculo.marca) && Objects.equals(modelo, veiculo.modelo) && Objects.equals(matricula, veiculo.matricula) && Objects.equals(numQuadro, veiculo.numQuadro) && cv == veiculo.cv;
    }

    //HASHCODE:
    @Override
    public int hashCode() {
        return Objects.hash(marca, modelo, matricula, numQuadro, cv);
    }

    //IMPLEMENTAÇÃO DOS MÉTODOS DA INTERFACE

    @Override
    public void trajeto(int quilometros) {
        dist.add(quilometros);
    }

    @Override
    public int ultimoTrajeto() {     
        return dist.lastElement(); 
    }

    @Override
    public int distanciaTotal() {
        for (int element: dist) {
            resultado += element; 
        }
        return resultado;
    }
}
