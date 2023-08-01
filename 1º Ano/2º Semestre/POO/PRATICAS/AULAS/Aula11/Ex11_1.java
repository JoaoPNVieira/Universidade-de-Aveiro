/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº11 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 11.1.:
*/

package Aula11;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.TreeMap;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.Normalizer;
import java.io.FileWriter;


public class Ex11_1 {
    public static void main(String[] args) throws UnsupportedEncodingException {

		Scanner src = null;
		PrintWriter p = null;
		ArrayList<String> palavras = new ArrayList<String>();
        TreeMap<String, TreeMap<String, Integer>> resultado = new TreeMap<String, TreeMap<String,Integer>>();

        try {
			p = new PrintWriter(new FileWriter("outputs/aula11/novo.txt"));
		} catch(FileNotFoundException e) {
			e.printStackTrace(); //Throwable
		} catch(IOException e){
			e.printStackTrace(); 
		}
		try {
			src = new Scanner(new FileReader("resources/aula11/major.txt"));
			src.useDelimiter("[ \\p{Space}\\p{Blank}\\p{Punct}\\p{Sc}\\p{Digit}.;..?!\t,\n\r]+");  // Delete characters \\p{space} \\{Punt} CLASS Patern
		} catch(FileNotFoundException e){
			System.out.printf("Ficheiro %s não existe: Verifique o Path do ficheiro...", "major.txt");
		}
			
		// Ler ficheiro major.tx e adicionar numa array e Converter: LowerCase + Normalizar + UTF-8 (remover acentos e letras Máiusculas)
		while(src.hasNext()) {
			String palavra = src.next().toLowerCase();
			String normalisar = Normalizer.normalize(palavra, Normalizer.Form.NFD);
			palavra = normalisar.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
			byte[] conv = palavra.getBytes("ISO_8859_1"); // Conversão bytes ISO_8859_1
			String palConv = new String(conv, "UTF-8");  // Conversão UTF-8
            if(palConv.length()>=3) {
				palavras.add(palConv);
			}
		}
		
        //__________________________________________________________________________________________________________________________	
        //ORDENAR E ORGANIZAR - TREEMAPS
		
		for(int i = 0; i < (palavras.size() - 1); i++) {
				
			TreeMap<String,Integer> tree = new TreeMap<String, Integer>();
			resultado.put(palavras.get(i), tree);

			if(resultado.containsKey(palavras.get(i))) {
				tree.putAll(resultado.get(palavras.get(i)));
				
                if(tree.containsKey(palavras.get(i+1))) { tree.put(palavras.get(i+1), tree.get(palavras.get(i+1))+1); }
				else { tree.put(palavras.get(i+1), 1); }
			
            } else { tree.put(palavras.get(i+1), 1); }

		}

        //__________________________________________________________________________________________________________________________			
        //RESULTADO: Display
		System.out.println(resultado);
		//RESULTADO: PrintWriter
	    p.println(resultado);
        //Fechar PrintWriter e Scanner
        p.close ();  	
		src.close();
	}
}