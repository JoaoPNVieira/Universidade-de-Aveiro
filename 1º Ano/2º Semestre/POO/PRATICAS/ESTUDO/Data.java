package codechecker03;
import static java.lang.System.*;
import java.util.Calendar;

public class Data {
	 private int dia, mes, ano;

	   /** Inicia esta data com o dia de hoje. */
	   public Data() {
	      // Usamos a classe java.util.Calendar para obter a data atual.
	      Calendar today = Calendar.getInstance();
	      dia = today.get(Calendar.DAY_OF_MONTH);
	      mes = today.get(Calendar.MONTH) + 1;
	      ano = today.get(Calendar.YEAR);
	   }

	   /** Devolve esta data segundo a norma ISO 8601. */
	   @Override
	   public String toString() {
	      return String.format("%04d-%02d-%02d", ano, mes, dia);
	   }

	   /** Indica se ano é bissexto. */
	   public static boolean bissexto(int ano) {
	      return ano%4 == 0 && ano%100 != 0 || ano%400 == 0;
	   }

	   /** Inicia a data a partir do dia, mes e ano dados. */
	   public Data(int dia, int mes, int ano) 
	   { this.dia = dia; this.mes = mes; this.ano = ano; }
	   
	   public int dia() { return dia; }
	   public int mes() { return mes; }
	   public int ano() { return ano; }

	   private static final
	   int[] diasMesComum = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

	   public static int diasDoMes(int mes, int ano) {
		   
		   	if(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12) { return 31;} 
		    else if (mes == 4 || mes == 6 ||mes == 9) { return 30; }
		    else if(mes == 2)	{ if(bissexto(ano)) { return 29; } else return 28; }
			else System.out.print("Mês invalido!"); return 0; 
			
	   		}
	   
	   /** Data.dataValida(dia, mes, ano) 
	    *  devolve true sse um terno (dia, mes, ano) forma uma data válida. */
	   
	   public static boolean dataValida(int dia, int mes, int ano) {
	     
		   	if(mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12)
		   	{ 	if(dia>=1 && dia<=31) { return true; } return false; }  
		   	else if(mes == 4 || mes == 6 ||mes == 9) 
		   	{ 	if(dia>=1 && dia<=30) { return true; } return false; }
	     
		   	
		   	
		   	if(bissexto(ano))
		   	{ 	if(mes == 2 && dia>=1 && dia<=29) { return true; } return false; }
		   	else if(mes == 2 && dia>=1 && dia<=28) { return true; } return false; 
	 	
	   		}

	   
	   
	   /** Atrasa a data (this) para o dia anterior. */
	   public void anterior() {
		
		   if(mes == 1)		 														{ if(dia == 1) { dia = 31; mes = 12; ano--; } else dia--; }
		   else if(mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12)		{ if(dia == 1) { dia = 30; mes--; } else dia--; }
		   else if(mes == 2 || mes == 4 || mes == 6 || mes == 9 || mes == 11) 		{ if(dia == 1) { dia = 31; mes--; } else dia--; }
		   else if(mes == 3) 														{ if(bissexto(ano) && dia == 1) { dia = 29; mes--; } else if (dia == 1) { dia = 28; mes--;} else dia--;}
	   
	   }
}