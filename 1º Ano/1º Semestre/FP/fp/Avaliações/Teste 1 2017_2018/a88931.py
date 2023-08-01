# Nome: Vasco António Lopes Ramos
# Número mecanográfico: 88931

dist = float(input("Distância (km)? "))
time = float(input("Tempo (h)? "))

velocidade = dist / time

print("Velocidade média do veículo:", velocidade)

if velocidade <= 50:
    print("Top")
elif 50 < velocidade < 70:
    print("Rápido")
else:
    print("Crime") 
