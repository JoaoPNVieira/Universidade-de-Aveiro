/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº9 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 9.1.:
*/

package Aula9;

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





for(String key:map.keySet()) {
    ArrayList<String> n = new ArrayList<>();
    n.add(map.get(key));
    sortL.put(key, n);
}

System.out.println(sortL.toString());
sortL.get("key1").add("descri��o 11");
sortL.get("key1").add("descri��o 111");
System.out.println(sortL.toString());