i = float(input("Qual o valor da quantia em euros? "))

def money(i):
    n50 = 0
    n20 = 0
    n10 = 0
    n5 = 0
    m2 = 0
    m1 = 0
    m0_5 = 0
    m0_2 = 0
    m0_1 = 0
    m0_05 = 0
    m0_02 = 0
    m0_01 = 0
    while(True) :
        if i == 0:
            break
        elif i // 50 != 0:
            n50 = i // 50
            i -= n50 * 50

        elif i // 20 != 0:
            n20 = i // 20
            i -= n20 * 20

        elif i // 10 != 0:
            n10 = i // 10
            i -= n10 * 10

        elif i // 5 != 0:
            n5 = i // 5
            i -= n5 * 5

        elif i // 2 != 0:
            m2 = i // 2
            i -= m2 * 2

        elif i // 1 != 0:
            m1 = i // 1
            i -= m1 * 1

        elif i // 0.5 != 0:
            m0_5 = i // 0.5
            i -= m0_5 * 0.5

        elif i // 0.2 != 0:
            m0_2 = i // 0.2
            i -= m0_2 * 0.2

        elif i // 0.1 != 0:
            m0_1 = i // 0.1
            i -= m0_1 * 0.1

        elif i // 0.05 != 0:
            m0_05 = i // 0.05
            i -= m0_05 * 0.05

        elif i // 0.02 != 0:
            m0_02 = i // 0.02
            i -= m0_2 * 0.02

        elif i // 0.01 != 0:
            m0_01 = i // 0.01
            i -= m0_01 * 0.01
    print("Notas de 50:", n50,"\nNotas de 20:", n20,"\nNotas de 10:", n10,"\nNotas de 5:", n5,"\nMoedas de 2:",m2,"\nMoedas de 1:",m1,"\nMoedas de 50cent:",m0_5,"\nMoeds de 20 cent:",m0_2,"\nMoedas de 10cent:",m0_1,"\nMoedas de 5cent:", m0_05,"\nMoedas de 2cent:",m0_02,"\nMOedas de 1cent:",m0_01)

money(i)
