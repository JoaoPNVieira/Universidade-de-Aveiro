public class AgenciaTuristica {
    
    private String nome;
    private String loc; 

    public AgenciaTuristica(String nome, String loc) {
        this.nome = nome;
        this.loc = loc;
    }

    
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }
    
    public String getNome() {
        return nome;
    }

    public String getLoc() {
        return loc;
    }

}
