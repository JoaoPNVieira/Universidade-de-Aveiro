import java.util.*;

public class PasseioBicicleta extends Atividade {

    Set<String> locais;  

    public PasseioBicicleta(int id, String nome) {
        super(id, nome);

        this.locais = new TreeSet<String>();
    }

    public PasseioBicicleta(int id, String nome, String[] locais) {
        this(id, nome);

        this.locais = new TreeSet<String>();

        for(String str : locais) {
            this.locais.add(str);
        }
    }
    
}
