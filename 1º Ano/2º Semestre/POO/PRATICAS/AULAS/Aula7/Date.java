package Aula7;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2.: Classe abstracta Date 
*/

public abstract class Date {
    private int day, month, year;

    //METODOS ABSTRACTOS
    public abstract boolean validMonth(int month);
    public abstract boolean leapYear(int year);
    public abstract int monthDays(int month, int year);
    public abstract boolean valid(int day, int month, int year);

    //GETTERS & SETTERS
    public int getYear() {
        return year;
    }
    public void setYear(int year) {
        this.year = year;
    }
    public int getMonth() {
        return month;
    }
    public void setMonth(int month) {
        this.month = month;
    }
    public int getDay() {
        return day;
    }
    public void setDay(int day) {
        this.day = day;
    }


    //METODO toString()
    @Override
    public String toString() { return getDay() + "/" + getMonth() + "/" + getYear(); }


    //HASHCODE
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + day;
        result = prime * result + month;
        result = prime * result + year;
        return result;
    }

    //EQUALS
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Date other = (Date) obj;
        if (day != other.day)
            return false;
        if (month != other.month)
            return false;
        if (year != other.year)
            return false;
        return true;
    }
}