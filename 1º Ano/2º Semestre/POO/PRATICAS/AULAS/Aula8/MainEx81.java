/*
Universidade de Aveiro
UC: Programação Orientada a Objectos 
Aula Pratica Nº8 - Turma P14
Aluno: João Pedro Nunes Vieira - NºMec: 50458 - P14

Exercício 8.1.: Classe de Teste (Main)

*/


package Aula8;

public class MainEx81 {
    
    public static void main(String[] args){
    
		Empresa empresa1 = new Empresa("EmprestaCarro", "3810-526", "geral@emprestacarro.pt");
        
        Motociclo moto1 = new Motociclo("Famel", "Zundapp", "AL-69-OK", "ABCD-12345", 3 , "estrada");
        Motociclo moto2 = new Motociclo("Yamaha", "XPTO", "LV-80-80", "EFGH-15855", 50 , "estrada");

        AutomovelLigeiro carro1 = new AutomovelLigeiro("BMW", "Serie5", "BA-10-20", "OI-121212", 286, 100);
        AutomovelLigeiro carro2 = new AutomovelLigeiro("BMW", "Serie3", "BA-15-13", "OLA-45875", 250, 100);
        Taxi carro3 = new Taxi("Mitsubishi", "SpaceStar", "TJ-58-23", "ASDE-54856", 200, 100, "UMA-LICENÇA-12345");
        Taxi carro4 = new Taxi("Mitsubishi", "SpaceStar", "TJ-58-23", "ASDE-54856", 200, 100, "UMA-LICENÇA-12345");
        
        PesadoDeMercadorias pesado1 = new PesadoDeMercadorias("Mitsubishi", "SeiLa", "UM-20-ER", "UMNUMERO-123456", 300, 1800, 3000);
        PesadoDePassageiros pesado2 = new PesadoDePassageiros("Audi", "Andaéoquemporta", "LI-58-OA", "TEMUM-66666", 150, 1500, 50);

		empresa1.addVeiculos(moto1);
        empresa1.addVeiculos(moto2);
        empresa1.addVeiculos(carro1);
        empresa1.addVeiculos(carro2);
        empresa1.addVeiculos(carro3);
        empresa1.addVeiculos(carro4);
        empresa1.addVeiculos(pesado1);
        empresa1.addVeiculos(pesado2);

        empresa1.toString();
        empresa1.getSetVeiculos();
        carro1.equals(carro2);
        carro3.equals(carro4);
        pesado1.equals(pesado2);
        System.out.println(pesado1.equals(carro1));
        System.out.println(empresa1);
        System.out.println(carro1);
    }
}
