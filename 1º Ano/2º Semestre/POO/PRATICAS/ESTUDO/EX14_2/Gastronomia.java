import java.util.*;

public class Gastronomia extends Atividade {
 
    private List<Restaurante> restaurantes;

    public Gastronomia(int id, String nome) {
        super(id, nome);

        restaurantes = new ArrayList<Restaurante>();
    }

    public Gastronomia(int id, String nome, List<Restaurante> list) {
        this(id, nome);

        restaurantes = list;
    }
}
