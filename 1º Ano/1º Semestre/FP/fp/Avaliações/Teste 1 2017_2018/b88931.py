# Nome: Vasco António Lopes Ramos
# Número mecanográfico: 88931

def velocidade (dist, time):
    velocidade = dist / time
    return velocidade

def lerValorRealPositivo (n):
    x = float(input(n))
    while x <= 0:
        print("Número inválido!", end = " ")
        x = float(input(n))
    return x

def mensagem (n):
    if n <= 50:
        print("Top")
    elif 50 < n < 70:
        print("Rápido")
    else:
        print("Crime")

def menu ():
    soma = 0
    contagem = 0
    # while opcao > 2 or opcao < 0:
    #     print("Opção inválida!")
    #     opcao = float(input("\nOpções disponíveis:\n0 - sair\n1 - introduzir nova medida\n2 - mostrar média atual\nOpção? "))
    while (True):
        opcao = float(input("\nOpções disponíveis:\n0 - sair\n1 - introduzir nova medida\n2 - mostrar média atual\nOpção? "))
        if opcao == 0:
            print("\nFIM!\nAté breve.")
            break
        elif opcao < 0 or opcao > 2:
            print("Opção inválida!")
        else:
            if opcao == 1:
                dist = lerValorRealPositivo ("Distância (km)? ")
                time = lerValorRealPositivo ("Tempo (h)? ")
                vel =(velocidade(dist, time))
                soma += vel
                contagem += 1
                print(vel)
                mensagem(velocidade(dist, time))
            elif opcao == 2:
                if soma != 0 or contagem != 0:
                    print("A média atual da velocidade: ", soma/contagem)
                else:
                    print("Ainda não introduziu qualquer valor.")

def menu():


print("\nCalculadora da velocidade\n")

menu ()
