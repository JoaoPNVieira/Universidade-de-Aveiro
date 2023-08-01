package Aula5;
import java.util.concurrent.atomic.AtomicInteger;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.4.: LIVRO
*/

public class Livro {
    
    //DEFINIR VARIAVEIS
    private String titulo, emprestimo;
    private int numId; 	
    //VARIÁVEIL ID DO LIVRO INCREMENTAL (AtomicInteger)
	private static AtomicInteger nextId = new AtomicInteger(99); 
	  
	//contrutores do livro
    public Livro(String titulo) {
        this.titulo = titulo;
        emprestimo = "NORMAL";
        numId = getNovoId();
    }

    //CONSTRUTOR DE LIVRO - TÍTULO + TIPO DE EMPRESTIMO 
    public Livro(String titulo, String emprestimo) {
        this.titulo = titulo;
        this.emprestimo = emprestimo;
        numId = getNovoId();
    }

    //CONSTRUTOR COMPLETO FINAL - TÍTULO + EMPRESTIMO + ID
	public Livro(String titulo, String emprestimo, int numId) {
        this.titulo = titulo;
        this.emprestimo = emprestimo;
        this.numId = numId;
    }

    //GETTERS & SETTERS
    public String getTitulo() {return titulo;}
    public String getTipoEmprestimo() {return emprestimo;}
    public int getId() {return numId;}
    public static AtomicInteger getNextId() {return nextId;}
    
    public void setTitulo(String titulo) {this.titulo = titulo;}
    public void setTipoEmprestimo(String emprestimo) {this.emprestimo = emprestimo;}
    public void setId(int numId) {this.numId = numId;}
    public static void setNextId(AtomicInteger nextId) {Livro.nextId = nextId;}

    //METODO PARA OBTER NOVO ID INCREMENTAL
    private static int getNovoId() {return (int)nextId.incrementAndGet();}

    //METODO toString()
   	public String toString() {return("Livro " + numId + "; " + titulo + "; " + emprestimo);}

    //hasCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((emprestimo == null) ? 0 : emprestimo.hashCode());
        result = prime * result + numId;
        result = prime * result + ((titulo == null) ? 0 : titulo.hashCode());
        return result;
    }

    //equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Livro other = (Livro) obj;
        if (emprestimo == null) {
            if (other.emprestimo != null)
                return false;
        } else if (!emprestimo.equals(other.emprestimo))
            return false;
        if (numId != other.numId)
            return false;
        if (titulo == null) {
            if (other.titulo != null)
                return false;
        } else if (!titulo.equals(other.titulo))
            return false;
        return true;
    }







}
