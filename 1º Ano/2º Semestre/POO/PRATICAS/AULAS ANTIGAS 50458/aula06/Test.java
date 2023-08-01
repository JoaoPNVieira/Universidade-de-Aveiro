// Exercício 6.1 - Aula Prática Nº6 - Programação Orientada a Objectos
package aula06;

public class Test {

	public static void main(String[] args) {
		//CREATION
		Student st = new Student ("Andreia Melo", 9855678, new Date (18, 7, 1990), new Date (1, 9, 2018));
		Scholarship sh = new Scholarship("Igor Santos", 4854585, new Date(01,05,1975), new Date(04,05,2018));
		sh.setSvalue(1050);
		
		//PRINTS
		System.out.println("Student: " + st.getName());
		System.out.println(st + "\n");
		System.out.println("Scholarship Student: " + sh.getName() + " | NMec: " + sh.getMec() + 
							" | Scholarship Value: " + sh.getSvalue());
		System.out.println(sh);
	}
}
