/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº10 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 10.1.:
*/

package Aula10;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.SortedMap;
import java.util.TreeMap;


public class Termos {
    public static void main(String[] args) {

        HashMap<String, String> termos = new HashMap<String, String>();
        termos.put("Branco","Cor da neve");
        termos.put("Azul","Cor do céu");
        termos.put("Vermelho","Cor do fogo");
        termos.put("Amarelo","Cor do sol");
        termos.put("Preto","Cor do escuro");
        termos.put("Rosa","Cor das rosas");
        System.out.println(termos.size());
        termos.remove("Rosa");
        System.out.println(termos.size());
        System.out.println(termos.get("Azul"));
        System.out.println(termos.get("Cor do céu"));

        String termosMap = termos.toString();
        String termosKey = termos.keySet().toString();
        String termosVal = termos.values().toString();

        System.out.println("Mapa: " + termosMap + "\n");
        System.out.println("Keys: " + termosKey + "\n");
        System.out.println("Vals: " + termosVal + "\n");

        SortedMap<String, ArrayList<String>> termosTree = new TreeMap<String, ArrayList<String>>();

    }
}