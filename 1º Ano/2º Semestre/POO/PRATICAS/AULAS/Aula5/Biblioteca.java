package Aula5;

public class Biblioteca {
    private int nLivros;

    public Biblioteca(int nLivros) { this.nLivros = nLivros; }
    public int getnLivros() { return nLivros; }
    public void setnLivros(int nLivros) { this.nLivros = nLivros; }    
    //METODO PARA EMPRESTIMO
    
    public Livro[] setBiblio(){ 
        Livro catalogo[] = new Livro[nLivros];
        return catalogo; 
    }

    public Livro setLivro(String titulo){
        Livro newLivro = new Livro(titulo);
        return newLivro;
    }

    


}
