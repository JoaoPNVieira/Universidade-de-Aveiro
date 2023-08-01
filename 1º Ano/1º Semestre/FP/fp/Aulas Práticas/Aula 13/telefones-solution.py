# Solução do primeiro problema da semana13.
# JMR@ua.pt Dez 2017
#
# O problema foi resolvido por fases sucessivas e sugere-se que seja analisado
# pela mesma ordem.
#
# 1) Primeiro foi criada a função principal, main(), com o ciclo, menu e ifs
# para tratar a opção escolhida, inicialmente apenas com instruções vazias.
# Apenas se implementou a opção 5, para terminar, e o aviso de opção errada no
# else.  Esses são simples.
# O menu poderia ter sido escrito com vários prints, mas aqui implementámos
# simplesmente como um "prompt" de várias linhas do input().  Porque não?
#
# 2) Desenvolvida a função telefoneValido.  Foi testada com algumas instruções
# assert para verificar um conjunto de resultados desejados.  Foi escrita
# por fases, primeiro para verificar apenas telefones formados por dígitos,
# que corresponde ao método .isdigit já existente nas stings.
# Depois acrescentámos as restantes condições de validade.
# Usámos regras da lógica para reorganizar e simplificar a condição.
#
# 3) Implementar a opção 1 de ler/registar uma chamada.
# Implicou acrescentar código após o if op == "1".
# Como é uma operação algo complexa, inventámos inputChamada para ler uma
# chamada para depois a registar na estrutura de dados chamadas.
#
# 4) Ao definir inputChamada, era preciso ler a origem e o destino, ambos
# números de telefone que deveriam ser validados.  Para evitar copy&paste,
# fazia sentido inventar inputTel: uma função que lesse e validasse um número de
# telefone (qualquer).  Invocando essa função, inputChamada fica muito simples.
# Como vamos precisar de fazer cálculos com a duração, faz sentido ler e
# converter imediatamente para int.
# inputChamada devolve os três valores na forma de um tuplo que representa a
# chamada, e é sempre assim que as chamadas serão representadas em todo o
# programa.
#
# 5) Para ser geral, inputTel tem de receber o prompt como parâmetro.
# Assim pode ser usada para pedir a "origem" ou o "destino".
# É implementada de uma forma típica para uma leitura com validação:
# Basta repetir a leitura e sair (break) apenas quando o valor lido satisfaz a
# condição desejada.  A condição neste caso é que o "telefoneValido"... que
# felizmente já temos resolvido!
#
# 6) No main, a variável chamadas terá que registar as sucessivas chamadas
# que forem inseridas pelo utilizador.
# Numa primeira abordagem, poderia usar-se uma lista à qual se fosse
# acrescentando cada chamada, mas mais à frente vamos ver que precisamos de
# encontrar todas as chamadas de um certo cliente, e de saber que clientes
# temos.
# Tudo isso fica facilitado se chamadas for um dicionário que para a cada
# cliente (chave) associe uma lista das chamadas desse cliente.
# Ou seja, algo como: {"96245": [("96245", "234882", 1.23), ...], ... }.
# Esta estrutura de dados é fundamental no programa.  É preciso compreender bem
# como a usar corretamente.
# A forma como acrescentamos uma nova chamada é o principal. Como se trata de
# um dicionário, é preciso distinguir se a nova chamada é de um cliente "novo"
# ou de um que já tem registo.  E lembrar que o valor a associar tem de ser uma
# lista, ainda que com apenas uma (ou nenhuma) chamada.
# 
# 7) Implementar a opção 2 de leitura do ficheiro agora é simples.
# É feito na função lerChamadas que recebe a referencia para o dicionário
# chamadas e altera-o pelo mesmo processo que na opção 1, mas agora com cada
# chamada extraída linha-a-linha do ficheiro.
#
# 8) A opção 3 para mostrar os clientes fica trivial devido à opção tomada no
# ponto (6).  Os clientes são as chaves do dicionário.  Basta ordená-las com
# sorted e mostrá-las.
#
# 9) A opção 4 para mostrar a fatura de um cliente é implementada na função
# fatura.  Os parâmetros necessários são o cliente e o registo de chamadas,
# claro.  Com o dicionário obtém-se a lista das chamadas desse cliente
# diretamente.  O problema agora é só percorrer essa lista para mostrar a
# informação necessária de cada chamada feita: destino, duração e custo.
# Imprimir na forma de tabela é apenas uma questão de usar as facilidades de
# alinhamento do método .format.
#
# Para o programa ficar completo, falta corrigir e completar uns detalhes que
# se deixam como exercícios, indicados por comentários #TPC.
#
# Bom estudo!

def telefoneValido(tel):
    """Indica se tel é um número de telefone válido."""
    r = (len(tel)>=3 and tel.isdigit()) or \
        (len(tel)>=4 and tel[0]=="+" and tel[1:].isdigit())
    return r

# Testes unitários à função telefoneVálido
# Estes testes foram feitos para testar a função anterior, enquanto era desenvolvida.
# Quando correta, nenhum assert falha (e poderiam ser retirados)
assert telefoneValido("24352") == True
assert telefoneValido("52") == False
assert telefoneValido("+252") == True
assert telefoneValido("+23") == False
assert telefoneValido("+23") == False
assert telefoneValido("") == False

def inputTel(prompt):
    """Pede e garante que lê um número de telefone válido.""" 
    while True:
        tel = input(prompt)
        if telefoneValido(tel): break
        print("Telefone inválido")       # (Não pedia esta mensagem, mas seria assim.)
    return tel

def inputChamada():
    """Lê os dados (validados) de uma chamada. Devolve num tuplo."""
    origem = inputTel("Tel origem? ")
    destino = inputTel("Tel destino? ")
    # se fosse pedido, também poderíamos validar a duracao (garantir que >=0, por exemplo)
    duracao = int(input("Duração? "))
    return (origem, destino, duracao)

def lerChamadas(fname, chamadas):
    """Lê um ficheiro de chamadas (fname) e junta-as ao registo (dicionário chamadas)."""
    f = open(fname, "r")
    for line in f:
        #print(repr(line))
        parts = line.strip().split()
        chamada = (parts[0], parts[1], int(parts[2]))
        cliente = chamada[0]
        if cliente not in chamadas:
            chamadas[cliente] = []
        chamadas[cliente].append(chamada)
    f.close()


import math

def custoChamada(chamada):
    """Avalia o custo de uma chamada, em função do destino e duração."""
    origem, destino, duracao = chamada
    if destino[0] == "2":
        cmin = 0.02
    elif destino[0] == "+":
        cmin = 0.80
    elif destino[:2] == origem[:2]:
        cmin = 0.04
    else:
        cmin = 0.10
    c = duracao*cmin/60.0
    return math.ceil(c*100.0)/100.0   # arredonda ao cêntimo acima (não era pedido)

def fatura(cliente, chamadas):
    """Imprime a fatura de um cliente."""
    print("Fatura do cliente: {}".format(cliente))
    # Escrever cabeçalho da tabela, com títulos devidamente alinhados
    print("{:<20s} {:>8s} {:>10s}".format("Destino", "Dura", "custo"))
    lst = chamadas[cliente]
    for ch in lst:
        custo = custoChamada(ch)  # falta calcular custo
        print("{:<20s} {:>8d} {:>10.2f}".format(ch[1], ch[2], custo))
    # TPC: Falta calcular e imprimir o total da fatura.
    ...
   

# MENU é uma string com várias linhas.
# (Foi definida como global porque torna o main mais legível e,
# sendo uma constante, não traz quaisquer problemas.)
MENU = """
1) Registar chamada 
2) Ler ficheiro 
3) Listar clientes 
4) Fatura
5) Terminar 
Opção? """

# Função "principal":
# Tem o ciclo principal, que repete o menu e faz as operações escolhidas
def main():
    chamadas = {} # key=cliente (origem) value=lista de chamadas
    repetir = True
    while repetir:
        op = input(MENU)    # Lemos opção como string...

        if op == "1":       # ... e comparamos com outras strings
            chamada = inputChamada()
            cliente = chamada[0]
            if cliente not in chamadas:       # se é cliente "novo", ...
                chamadas[cliente] = []        # ... associa-lhe uma lista vazia
            chamadas[cliente].append(chamada) # em qq caso, acrescenta chamada à lista
            #print(chamadas)     # print útil durante o desenvolvimento
        elif op == "2":
            fname = input("Ficheiro? ")
            lerChamadas(fname, chamadas)
            #print(chamadas)     # print útil durante o desenvolvimento
        elif op == "3":
            clientes = sorted(chamadas.keys())
            # TPC: substitua o print por uma função que imprima os clientes de
            # forma mais elegante (sem [], nem aspas, como no enunciado).
            print(clientes)
        elif op == "4":
            cliente = input("cliente? ")
            if cliente in chamadas:
                fatura(cliente, chamadas)
            else:
                print("Cliente desconhecido")
        elif op == "5":
            # Esta é uma forma de implementar a terminação: mudar uma "flag"
            repetir = False
        else:
            # Outras opções são erro do utilizador!
            print("Opção inválida!")

    return

# Chamar função principal:
main()



"""EXEMPLO de utilização:

[...]
Opção? 2
Ficheiro? chamadas1.txt

[...]
Opção? 4
cliente? 963970864
Fatura do cliente: 963970864
Destino                  Dura      custo
228628637                 162       0.06
934877413                 245       0.41
914917941                 302       0.51
+31765214531              437       5.83
228628637                 415       0.14
910898341                  36       0.07
965411417                 146       0.10
969565271                 372       0.25
919530258                 186       0.31
+31765214531               87       1.17
271055066                 331       0.12
"""
