package Aula6;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº6 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 6.1.:

->  Construa a classe Pessoa que é caraterizada pelo nome, número do cartão do cidadão e data de
    nascimento. Comece com as definições seguintes e defina novos métodos a incluir na
    interface pública da classe. Reutilize a classe Date criada na aula anterior.

->  Crie métodos adequados para permitir a inicialização dos seus atributos no momento de
    criação de cada objeto, garantindo que não é possível criar objetos com estado (valores dos
    atributos) inválido
*/

public class Pessoa {

    private String nome;
    private int cc;
    private Date dataNasc;

    //CONSTRUTOR
    public Pessoa(String nome, int cc, Date dataNasc) {
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = dataNasc;
    }

    //GETTERS & SETTERS
    public String getNome() { return nome; }
    public int getCc() { return cc; }
    public Date getDataNasc() { return dataNasc; }

    /*
    public void setNome(String nome) { this.nome = nome; }
    public void setCc(int cc) { this.cc = cc; }
    public void setDataNasc(Date dataNasc) { this.dataNasc = dataNasc; }
    */    


    @Override
    public String toString() {
        return "{ Nome: " + getNome() + " , " +
            " CC: " + getCc() + " , " +
            " Data de Nascimento: " + getDataNasc() + " }";
    }


    //HASHCODE && EQUALS - Apenas para número CC (Pessoas diferentes podem ter: Nomes ou datas de dascimento iguais. CC nunca é igual).
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + cc;
        return result;
    }

    
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Pessoa other = (Pessoa) obj;
        if (cc != other.cc)
            return false;
        return true;
    }
}
