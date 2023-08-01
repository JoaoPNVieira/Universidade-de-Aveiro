/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº9 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 9.1.:
*/

package Aula9;

import java.util.Objects;

public abstract class DateAula7 {
    private int day, month, year;


    public DateAula7(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

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


    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof DateAula7)) {
            return false;
        }
        DateAula7 dateAula7 = (DateAula7) o;
        return day == dateAula7.day && month == dateAula7.month && year == dateAula7.year;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hash(day, month, year);
    }


}