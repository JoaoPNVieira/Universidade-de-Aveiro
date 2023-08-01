/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº9 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 9.1.:
*/

package Aula9;

public class Date {
    
    //DEFINIR VARIÁVEIS
    private int day, month, year;    
    private static int[] monthDays = {31,28,31,30,31,30,31,31,30,31,30,31};
    private static int[] monthDaysBis = {31,29,31,30,31,30,31,31,30,31,30,31};

    //CONSTRUTOR DE DATA
    public Date(int d, int m, int y){this.day = d; this.month = m; this.year = y;}

    //GETTERS & SETTERS
    public void setDay(int nDay)        {day = nDay;}
    public void setMonth(int nMonth)    {month = nMonth;}
    public void setYear(int nYear)      {year = nYear;}
    public int getDay()                 {return day;}
    public int getMonth()               {return month;}
    public int getYear()                {return year;}
    
    //METODO toString() PARA DATA
    public String toString(){
        return "Data: " + getDay() +"/"+ getMonth() +"/"+ getYear(); }

    //METODO validMonth(int month)
    public boolean validMonth(int month){return month >= 1 && month <=12;}

    //METODO leapYear(int year)
    public static boolean leapYear(int year){ return (year % 4 == 0 || ( year % 100 == 0 && year % 400 == 0)); }

    //METODO monthDays(int month, int year)
    public static int monthDays(int month, int year){   
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
    public Date decrement(){
        if(day==1){ 
            day = monthDays(month, year);
            if(month==1){ year--; month=12; }
            else        { month--; } 
        }
        else{ day--; }

        Date newDate = new Date(day, month, year);
        return newDate;
    }
    
    //METODO increment(int day, int month, int year)
    public Date increment(){
        if(day == monthDays(month,year)){
            day = 1;
            if(month==12)   { year++; month = 1;}
            else            { month++;}
        
        } else{ day++; } 
        
        Date newDate = new Date(day,month,year);
        return newDate;
    }

   //METODO PARA OBTER DIA DE HOJE -------> MUDAR PARA CLASSE DATE 
   /*public static Date getToday() {
    LocalDate t = LocalDate.now();
    int dToday = t.getDayOfMonth();
    int mToday = t.getMonthValue();
    int yToday = t.getYear();
    Date today = new Date(dToday, mToday, yToday);
    return today;
}
*/

    //hashCode()
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + day;
        result = prime * result + month;
        result = prime * result + year;
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