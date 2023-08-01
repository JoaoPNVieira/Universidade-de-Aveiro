/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº9 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 9.2.:
*/

package Aula9;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.TreeSet;

public class CollectionTester {
    public static void main(String[] args) {
        int DIM = 5000;
		Collection<Integer> col0 = new ArrayList<>();
		checkPerformance(col0, DIM);
        Collection<Integer> col1 = new LinkedList<>();
		checkPerformance(col1, DIM);
        Collection<Integer> col2 = new TreeSet<>();
		checkPerformance(col2, DIM);
        Collection<Integer> col3 = new HashSet<>();
		checkPerformance(col3, DIM);
	}

    //METODO CHECK PERFORMANCE
    public static void checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop, delta; 
        
        //_______________________________________________________________________________________________________
        //ADD:
        start = System.nanoTime(); // Clock snapshot before

        for(int i=0; i<DIM;i++) { col.add(i); }

        stop =System.nanoTime(); // Clock snapshot after
        delta = (stop - start)/1e6; // Convert to millisecounds: 1E6 = 1x10^6

        System.out.printf("%s %12s \n%s \n%s %19.2f %s", "Collection", col.size(), col.getClass().getSimpleName(), "Add",  delta, "ms \n");

        //_______________________________________________________________________________________________________
        //SEARCH:
        start = System.nanoTime(); // Clock snapshot before
        
        for(int i=0; i<DIM;i++) { 
            int n = (int) (Math.random()*DIM); 
            if(!col.contains(n)) { 
                System.out.println("Not found???" + n); 
            }
        }

        stop =System.nanoTime(); // Clock snapshot after
        delta = (stop - start)/1e6; // Convert to millisecounds: 1E6 = 1x10^6

        System.out.printf("%s %16.4s %s", "Search",  delta, "ms \n");

        //_______________________________________________________________________________________________________
        //REMOVE:
        start = System.nanoTime(); // Clock snapshot before
        Iterator<Integer> iterator = col.iterator();

        while(iterator.hasNext()) {
            iterator.next();
            iterator.remove();    
        }

        stop =System.nanoTime(); // Clock snapshot after
        delta = (stop - start)/1e6; // Convert to millisecounds: 1E6 = 1x10^6
        
        System.out.printf("%s %16.4s %s", "Remove",  delta, "ms \n");

        //_______________________________________________________________________________________________________
        //END
    }
}