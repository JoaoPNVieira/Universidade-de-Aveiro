/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº9 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 9.1.:
*/

package Aula9;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;


public class ALDemo {
    public static void main(String[] args) {
        ArrayList<Integer> c1 = new ArrayList<>();
        for (int i = 10; i <= 100; i+=10){
            c1.add(i);
            System.out.println("Size: " + c1.size());
        }
        for (int i = 0; i < c1.size(); i++){
            System.out.println("Elemento: " + c1.get(i));
        }

        ArrayList<String> c2 = new ArrayList<>();
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");
        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);
        c2.remove("Frio");
        c2.remove(0);
        System.out.println(c2);
        System.out.println("______________________");
        System.out.println(c2.contains("Chuva"));
        System.out.println(c2.contains("Neve"));
        c2.add("Neve");
        System.out.println(c2.contains("Neve"));
        System.out.println(c2.indexOf("Chuva"));
        c2.add("Chuva");
        System.out.println(c2);
        System.out.println(c2.lastIndexOf("Chuva"));
        System.out.println(c2.subList(1, 4)); //não conta o ultimo index, ie, não existe index 4 neste caso mas se colocarmos index 4 apanha o index 3 sendo o 4 descartado (range).
        c2.set(3,"Lava");
        System.out.println(c2);

        //Ex9_1 - Alinea B
        //NOTA: nas classes Pessoa e Date existiam erros (Pessoa falta o toString e Date tem erro no metodo getToday() -> fazer upload de novo ficheiro da aula com correcção para este exercício)
        
        Set<Pessoa> c3 = new HashSet<>();
        c3.add(new Pessoa("João",50458,(new Date(20, 4, 1991))));
        c3.add(new Pessoa("João",50458,(new Date(20, 4, 1991)))); //Elemento repetido não é adicionado
        c3.add(new Pessoa("Joaquim",76982,(new Date(19, 12, 1974))));
        c3.add(new Pessoa("Catarina",98765,(new Date(04, 9, 1996))));
        c3.add(new Pessoa("Bruna",78124,(new Date(25, 1, 1981))));
        c3.add(new Pessoa("Armando",12498,(new Date(12, 7, 1929))));

        System.out.print(c3); //A Ordem de insereção está ordenada por ordem alfabética ou ordem numérica, ou por datas

        //Ex9_1 - Alinea C
        Set<DateYMD> c4 = new TreeSet<>();
        c4.add(new DateYMD(10,5,1952));
        c4.add(new DateYMD(8,8,1942));
        c4.add(new DateYMD(21,11,1916));
        c4.add(new DateYMD(1,9,1979));
        c4.add(new DateYMD(1,10,1995));


        System.out.println(c4);
    }
}