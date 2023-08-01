/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe - Empresa

*/

package Aula8;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class Empresa {
    private String nome, codigoPostal, email;
    private Set<Veiculo> setVeiculos = new HashSet<>();
    

    public Empresa(String nome, String codigoPostal, String email) {
        this.nome = nome;
        this.codigoPostal = codigoPostal;
        this.email = email;
    }

    //EMPRESA - GETTERS:
    public String getNome() { return this.nome; }
    public String getCodigoPostal() { return this.codigoPostal; }
    public String getEmail() { return this.email; }
    public Set<Veiculo> getSetVeiculos() { return setVeiculos; }

    //EMPRESA - SETTERS:
    public void setNome(String nome) { this.nome = nome; }
    public void setCodigoPostal(String codigoPostal) { this.codigoPostal = codigoPostal; }
    public void setEmail(String email) { this.email = email; }
    public void setSetVeiculos(Set<Veiculo> setVeiculos) { this.setVeiculos = setVeiculos; }

    //METODO ADD VEICULO
    public void addVeiculos(Veiculo v) {setVeiculos.add(v);}

    //toString
    @Override
    public String toString() {
        return "{ EMPRESA: " + "Nome: " + getNome() + ", Codigo Postal: " + getCodigoPostal() + ", Email: " + getEmail() + " }";
    }

    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Empresa)) {
            return false;
        }
        Empresa empresa = (Empresa) o;
        return Objects.equals(nome, empresa.nome) && Objects.equals(codigoPostal, empresa.codigoPostal) && Objects.equals(email, empresa.email) && Objects.equals(setVeiculos, empresa.setVeiculos);
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hash(nome, codigoPostal, email, setVeiculos);
    }
}
