package Aula7;

import java.util.Objects;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 7.2.: Classe DateYMD
*/

public class DateYMD extends Date {
    
    //DEFINIR VARIÁVEIS
    private int day, month, year;    
    private static int[] monthDays = {31,28,31,30,31,30,31,31,30,31,30,31};
    private static int[] monthDaysBis = {31,29,31,30,31,30,31,31,30,31,30,31};

    //CONSTRUTOR DE DATA
    public DateYMD(int d, int m, int y){this.day = d; this.month = m; this.year = y;}

    //GETTERS & SETTERS
    public void setDay(int nDay)        {day = nDay;}
    public void setMonth(int nMonth)    {month = nMonth;}
    public void setYear(int nYear)      {year = nYear;}
    public int getDay()                 {return day;}
    public int getMonth()               {return month;}
    public int getYear()                {return year;}
    
    //METODO toString() PARA DATA
    public String toString(){
        return "Data: " + super.toString(); }

    //METODO validMonth(int month)
    
    public boolean validMonth(int month){return month >= 1 && month <=12;}

    //METODO leapYear(int year)
    public boolean leapYear(int year){ return (year % 4 == 0 || ( year % 100 == 0 && year % 400 == 0)); }


    //METODO monthDays(int month, int year)
    public int monthDays(int month, int year){   
        int days;
        if(leapYear(year) == true) {
            days = monthDaysBis[month-1];
        }
        else {
            days = monthDays[month-1];
        }
        return days;
    }
    
    //METODO valid(int day, int month, int year)
    public boolean valid(int day, int month, int year){
        int days = monthDays(month, year);
        return (year != 0 && validMonth(month) && day <= days); 
    }
    
    //METODO decrement(int day, int month, int year)
    public DateYMD decrement(){
        if(day==1){ 
            day = monthDays(month, year);
            if(month==1){ year--; month=12; }
            else        { month--; } 
        }
        else{ day--; }

        DateYMD newDate = new DateYMD(day, month, year);
        return newDate;
    }
    
    //METODO increment(int day, int month, int year)
    public DateYMD increment(){
        if(day == monthDays(month,year)){
            day = 1;
            if(month==12)   { year++; month = 1;}
            else            { month++;}
        
        } else{ day++; } 
        
        DateYMD newDate = new DateYMD(day,month,year);
        return newDate;
    }    


    //EQUALS
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof DateYMD)) {
            return false;
        }
        DateYMD dateYMD = (DateYMD) o;
        return day == dateYMD.day && month == dateYMD.month && year == dateYMD.year;
    }

    //HASHCODE
    @Override
    public int hashCode() {
        return Objects.hash(day, month, year);
    }
    


}

