package Aula6;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº6 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 6.1.:
*/

import java.time.LocalDate;
import java.util.concurrent.atomic.AtomicInteger;


public class Aluno extends Pessoa {
    private String nome;
    private int cc, nMec;
    private Date dataNasc;
    private Date dataInsc;
    private static AtomicInteger nextId = new AtomicInteger(99);
    

    //CONSTRUCTOR
    public Aluno(String nome, int cc, Date dataNasc, Date dataInsc) {
        super(nome, cc, dataNasc);
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
        this.dataInsc = dataInsc;
        nMec = (int)getNextId();
    }
    
    public Aluno(String nome, int cc, Date dataNasc) {
        super(nome, cc, dataNasc);
        this.dataInsc = getToday(); //ALTERAR
        
    }

    //METODO PARA OBTER & GERAR NºMec
    private static int getNextId() {
	    return (int)nextId.incrementAndGet();
	}


    //GETTERS & SETTERS
    public String getNome()     { return nome; }
    public int getCc()          { return cc; }
    public int getnMec()        { return nMec; }
    public Date getDataNasc()   { return dataNasc; }
    public Date getDataInsc()   { return dataInsc; }

    public void setNome(String nome)        { this.nome = nome;  }
    public void setCc(int cc)               { this.cc = cc; }
    public void setDataNasc(Date dataNasc)  { this.dataNasc = dataNasc; }
    public void setDataInsc(Date dataInsc)  { this.dataInsc = dataInsc; }
    

    //METODO toString()
	public String toString() {
		return "Data de Incrição=" + iDataInsc + ", nMec=" + nMec + ",Nome =" + getNome() + ",Cc =" + getCc()
				+ ", Data de Nascimento=" + getDataNasc();
	}
    
    //HASHMAP
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((iDataInsc == null) ? 0 : iDataInsc.hashCode());
        result = prime * result + nMec;
        return result;
    }

    //EQUALS
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (!super.equals(obj))
            return false;
        if (getClass() != obj.getClass())
            return false;
        Aluno other = (Aluno) obj;
        if (iDataInsc == null) {
            if (other.iDataInsc != null)
                return false;
        } else if (!iDataInsc.equals(other.iDataInsc))
            return false;
        if (nMec != other.nMec)
            return false;
        return true;
}


