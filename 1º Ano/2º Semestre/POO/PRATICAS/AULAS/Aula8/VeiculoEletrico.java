/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Interface - VeiculoElectrico

*/

package Aula8;

public interface VeiculoEletrico{
    int autonomia();                // devolve autonomia restante
    void carregar(int percentagem); // simula um carregamento até ‘percentagem’

}