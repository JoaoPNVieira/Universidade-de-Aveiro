package Teste;

public class Bebida {
	
	private String nome;
	private double teorAlc;
	
	public Bebida(String x, double y) {
		this.nome = x;
		this.teorAlc = y;
	}

	@Override
	public String toString() {
		return "Bebida [nome=" + nome + ", teorAlc=" + teorAlc + "]";
	}
	
}
