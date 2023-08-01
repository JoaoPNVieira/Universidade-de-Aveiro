package Aula5;

/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº5 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 5.1.:
->  Crie uma classe que permita modelar uma data (class Date).
    Esta classe deve conter os seguintes métodos estáticos:
        - um método booleano que indique se o valor inteiro que represente um mês ([1;12]) é válido:
        validMonth(int month)
        - um método inteiro que devolva o número de dias de um determinado mês, num
        determinado ano: monthDays(int month, int year)
        - um método booleano que indique se um ano é bissexto: leapYear(int year)
        - um método booleano que indique se uma data composta por dia, mês e ano, é válida:
        valid(int day, int month, int year)

    (Nota: No desenvolvimento destes métodos aproveite os métodos desenvolvidos nas aulas anteriores.)

    A classe deve também permitir instanciar objetos que representem uma data específica
    (válida). Nesse sentido, considere que a representação interna do objeto é composta por três
    atributos inteiros (day, month, year).

    Deve ser possível aplicar externamente as seguintes operações sobre objetos deste tipo:
        - definir uma data: set(int day, int month, int year);
        - consultar os valores do dia, mês e ano (day, month, year);
        - incrementar a data (increment);
        - decrementar a data (decrement);
        - método toString que devolva a data no formato AAAA-MM-DD.

    A classe deve ter um construtor que defina uma data (válida) indicando um dia, mês e ano.

    (Nota: desenvolva a classe garantindo que não é possível que nenhum dos seus objetos represente uma 
    data inválida [por exemplo, 31 de fevereiro de 2022].)

    Para testar esta classe, crie um programa de teste, com o seguinte menu (DateTest.java):
        Date operations:
        1 - create new date
        2 - show current date
        3 - increment date
        4 - decrement date
        0 - exit
*/
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