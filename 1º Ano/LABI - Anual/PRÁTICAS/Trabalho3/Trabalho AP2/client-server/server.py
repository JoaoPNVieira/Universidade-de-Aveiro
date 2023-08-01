#!/usr/bin/python3

import errno
import sys
import socket
import select
import json
import base64
import csv
import random
import os.path

from os import path
from common_comm import send_dict, recv_dict, sendrecv_dict
from Crypto.Cipher import AES

# Dicionário com a informação relativa aos clientes activos a jogar
gamers = {}

# Listas com informação relativa aos clientes conectados ao servidor
clients = []
nicknames = []

# Ficheiro CSV para guardar resultados dos clientes
filename = 'report.csv'

# ---------------------------------------------------------------------------------------------------
# return the cipher of a client socket
def find_cipher(client_id):
    gamer_cipher = gamers[client_id]['cipher']
    cipherkey = base64.b64decode(gamer_cipher)
    mode = AES.MODE_ECB
    cipher = AES.new(cipherkey, mode)
    return cipher


# Função para desencriptar valores recebidos em formato json com codificação base64
# return int data decrypted from a 16 bytes binary string and coded base64
def decrypt_intvalue(client_id, data):
    cipher = find_cipher(client_id)                       # cifra do cliente com "client_id" X
    data = base64.b64decode(data)              # str base64 dict
    data = cipher.decrypt(data) # decifrar str binaria de 128 bits (8 x 16)
    data_tosend = int(str(data, 'utf8'))                       # str para integer
    return data_tosend


# ----------------------------------------------------------------------------------------------------------
# Função para encriptar valores a enviar em formato json com codificação base64
# return int data encrypted in a 16 bytes binary string and coded base64
def encrypt_intvalue(client_id, data):
    cipher = find_cipher(client_id)
    data = cipher.encrypt(bytes("%16d" % data, 'utf8'))  # cifrar str binaria de 128 bits (8 x 16)
    data_tosend = str(base64.b64encode(data), 'utf8')           # str base64 dict
    return data_tosend


# ----------------------------------------------------------------------------------------------------------
# return the client_id of a client socket
def find_client_id(client_sock):
    found = False
    
    for key in gamers:
        if gamers[key]['socket'] == str(client_sock):
            client_id = key
            found = True
            return client_id
        
    if not found: return None


# ----------------------------------------------------------------------------------------------------------
# Suporte da eliminação de um cliente
# obtain the client_id from his socket and delete from the dictionary
def clean_client(client_sock):
    client_id = find_client_id(client_sock)

    if gamers.get(client_id) != None:
        gamers.pop(client_id)


# ----------------------------------------------------------------------------------------------------------
# Suporte da criação de um ficheiro csv com o respectivo cabeçalho
# create report csv file with header
def create_file():
    if not path.exists(filename): #Verificar se já existe o ficheiro para o apagar
        csvfile = open(filename, 'w')
        fieldnames = ['Cliente ID', 'Número Secreto', 'Tentativas Possíveis', 'Tentativas Jogadas', 'Resultado']

        writer = csv.DictWriter(csvfile, fieldnames)
        writer.writeheader()
        
        csvfile.close()


# ---------------------------------------------------------------------------------------------------
# Suporte da actualização de um ficheiro csv com a informação do cliente e resultado
# update report csv file with the result from the client
def update_file(client_id, result):
    csvfile = open(filename, 'a+', newline='')
    fieldnames = ['Cliente_ID', 'Número_Secreto', 'Tentativas_Possíveis', 'Tentativas_Jogadas', 'Resultado']

    secret_number = gamers[client_id]['guess']
    max_attempts = gamers[client_id]['max_attempts']
    turns_count = gamers[client_id]['attempts']

    writer = csv.DictWriter(csvfile, fieldnames)

    newline = {'Cliente_ID': client_id, 'Número_Secreto': secret_number, 'Tentativas_Possíveis': max_attempts,
               'Tentativas_Jogadas': turns_count, 'Resultado': result}   
                  
    writer.writerow(newline)

    csvfile.close()


# ---------------------------------------------------------------------------------------------------
# Suporte de descodificação da operação pretendida pelo cliente
#----------------------------------------------------------------------------------------------------
# read the client request
# detect the operation requested by the client
# execute the operation and obtain the response (consider also operations not available)
# send the response to the client
def new_msg(client_sock):
    try:
        message = recv_dict(client_sock)
        print(message)  # teste

        if   (message["op"] == "START"): start_client(client_sock, message)
        elif (message["op"] == "GUESS"): guess_client(client_sock, message)
        elif (message["op"] == "QUIT"): quit_client(client_sock)
        elif (message["op"] == "STOP"): stop_client(client_sock, message)
        
        #Operação Inexistente
        else:
            op = message["op"]
            opUnknown = {"op": op, "status": False, "error": "Operação inexistente"}
            send_dict(client_sock,opUnknown)

    except:
        print("Erro a receber mensagem de cliente")


# ---------------------------------------------------------------------------------------------------
# Suporte da criação de um novo jogador - operação START
#----------------------------------------------------------------------------------------------------
# detect the client in the request
# verify the appropriate conditions for executing this operation
# obtain the secret number and number of attempts
# process the client in the dictionary
# return response message with results or error message
def start_client(client_sock, request):
    global safeMode
    
    client_id = request['client_id']
    cipherkey = request['cipher']
    
    index = clients.index(client_sock) #Código desnecessário ao funcionamento do programa
    nicknames[index] = client_id       #Apenas corrige mensagens internas do servidor
    
    if cipherkey != None: safeMode = True
    else: safeMode = False

	#Verifica que não existe um cliente com o mesmo ID
    if gamers.get(client_id) == None:
        secret_number = random.randint(0, 100)
        max_attempts = random.randint(10, 30)
        turns_count = 0

        gamers.update({client_id: {'socket': str(client_sock), 'cipher': cipherkey, 'guess': secret_number, 'max_attempts': max_attempts, 'attempts': turns_count}})

        if safeMode: max_attempts = encrypt_intvalue(client_id, max_attempts) #Safe Mode - encripta o Max_Attempts
        opStart = {"op": "START", "status": True, "max_attempts": max_attempts}
        send_dict(client_sock, opStart)

        print(f'Request of START accepted. Secret number of {client_id} is: {str(secret_number)}\n')

	#Existe um cliente com o mesmo ID
    else:
        print(f'Request of START from {client_id} wasn\'t accepted. The Client ID is already taken\n')
        opStart = {"op": "START", "status": False, "error": "Cliente existente"}
        send_dict(client_sock, opStart)


# ---------------------------------------------------------------------------------------------------
# Suporte da jogada de um cliente - operação GUESS
#----------------------------------------------------------------------------------------------------
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# return response message with result or error message
def guess_client(client_sock, request):

    client_id = find_client_id(client_sock)

    # Cliente não está na lista de jogadores activos
    if gamers.get(client_id) == None:
        opGuess = {"op": "GUESS", "status": False, "error": "Cliente inexistente"}
        send_dict(client_sock, opGuess)

    #Funcinamento correcto
    else:
        gamers[client_id]['attempts'] += 1 #registar tentativa
        data = request["number"]
        
        if safeMode: attempt = decrypt_intvalue(client_id, data) # Safe Mode - Decifra o Number Guess
        else: attempt = int(data) # Standart Mode
        
        secret_number = gamers[client_id]['guess']

        if (attempt < secret_number): result = "smaller"
        elif (attempt > secret_number): result = "larger"
        else: result = "equals"

        opGuess = {"op": "GUESS", "status": True, "result": result}
        send_dict(client_sock, opGuess)
        
    
# ---------------------------------------------------------------------------------------------------
# Suporte do pedido de desistência de um cliente - operação QUIT
#----------------------------------------------------------------------------------------------------
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# process the report file with the QUIT result
# eliminate client from dictionary
# return response message with result or error message
def quit_client(client_sock):

    client_id = find_client_id(client_sock)

	# Cliente não está na lista de jogadores activos
    if gamers.get(client_id) == None:
        opQuit = {"op": "QUIT", "status": False, "error": "Cliente inexistente"}
        send_dict(client_sock, opQuit)
        
	#Funcionamento correcto
    else:
        opQuit = {"op": "QUIT", "status": True}
        send_dict(client_sock, opQuit)
        
        update_file(client_id, "QUIT")
        clean_client(client_sock)


# ---------------------------------------------------------------------------------------------------
# Suporte do pedido de terminação de um cliente - operação STOP
#----------------------------------------------------------------------------------------------------
# obtain the client_id from his socket
# verify the appropriate conditions for executing this operation
# process the report file with the SUCCESS/FAILURE result
# eliminate client from dictionary
# return response message with result or error message
def stop_client(client_sock, request):

    client_id = find_client_id(client_sock)

    if gamers.get(client_id) != None:
        secret_number = gamers[client_id]['guess']
        max_attempts = gamers[client_id]['max_attempts']
        turns_count = gamers[client_id]['attempts']

    last_number = request["number"]
    attempts = request["attempts"]
    
    if safeMode: # Safe Mode
        last_number = decrypt_intvalue(client_id, last_number) #Decifra last_Number
        attempts = decrypt_intvalue(client_id, attempts) # Decifra Attempts
    
    # Cliente não está na lista de jogadores activos
    if gamers.get(client_id) == None:
        opStop = {"op": "STOP", "status": False, "error": "Cliente inexistente"}
        
    elif attempts != turns_count:
        opStop = {"op": "STOP", "status": False, "error": "Número de tentativas incoerente entre Servidor e Cliente"}
    
    #Funcionamento correcto    
    else:
        #Sucess
        if int(last_number) == int(secret_number) and int(attempts) < int(max_attempts): update_file(client_id, "SUCESS")
        #Failure
        else: update_file(client_id, "FAILURE")
        
        if safeMode: secret_number = encrypt_intvalue(client_id, secret_number) # Safe Mode - Encripta Secret_Number
        opStop = {"op": "STOP", "status": True, "guess": secret_number}


    send_dict(client_sock, opStop)
    clean_client(client_sock)
    return None


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# validate the number of arguments and eventually print error message and exit with error
# verify type of of arguments and eventually print error message and exit with error
def main():
	
	#----------------------------------------------------------------------------
    #Error Handling - Argumentos no chamamento do terminal têm de estar correctos
    if len(sys.argv) != 2:
        print("Erro 1: Numero inválido de argumentos\n")
        sys.exit()
        
    if not sys.argv[1].isnumeric():
        print("Erro 2: Valor do Port Inválido (argv[2])- Deve ser um número inteiro\n")
        sys.exit()
    
    try:
        #----------------------------------------------------------------------------
        #Main Function
        REGRAS = "\n**Regras do jogo**\nObjectivo: Adivinhar um número entre 0 e 100\nPara desistir do jogo escrever \"quit\"\n"

        IP = "127.0.0.1"
        PORT = int(sys.argv[1])

        # Create a socket    # AF_INET - address family Ipv4    #SOCK_STREAM - TCP
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        # Sets REUSEADDR (as a socket option) to 1 on socket
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

        server_socket.bind((IP, PORT))
        server_socket.listen(10)

        #Criar ficheiro CSV se este ainda não existir
        create_file()

        print(f'Listening for connections on IP-{IP} : PORT-{PORT}...')

        while True:
            try:
                available = select.select([server_socket] + clients, [], [])[0]
            except ValueError:
                # Sockets may have been closed, check for that
                for client_sock in clients:
                    if client_sock.fileno() == -1:
                        client_sock.remove(client)  # closed
                        print(f'Closed connection from {addr}')
                continue  # Reiterate select

            for client_sock in available:
                # New client
                if client_sock is server_socket:

                    newclient, addr = server_socket.accept()
                    clients.append(newclient)

                    nickname = newclient.recv(1024).decode('utf-8')  # receives client ID for internal message
                    nicknames.append(nickname)
                    newclient.send(REGRAS.encode('utf-8'))  # Send rules of game

                    print(f'Accepted new connection from {addr}, username: {nickname}\n')

                # Or an existing client
                else:
                    # See if client sent a message
                    if len(client_sock.recv(1, socket.MSG_PEEK)) != 0:
                        # client socket has a message
                        new_msg(client_sock)
                    else:  # Or just disconnected
                        index = clients.index(client_sock)
                        client_id = nicknames[index]
                        print(f'{client_id} has disconnected\n')
                        clean_client(client_sock)
                        clients.remove(client_sock)
                        client_sock.close()
                        break  # Reiterate select

    #----------------------------------------------------------------------------
    #Error Handling - Argumentos na invocação do programa no terminal têm de estar correctos
    except PermissionError:
        print("Erro 2: Valor do Port Inválido (argv[2]) - Deve ser um número entre 1024 e 65535\n")
        sys.exit()
        
    except OverflowError:
        print("Erro 2: Valor do Port Inválido (argv[2]) - Deve ser um número entre 1024 e 65535\n")
        sys.exit()


if __name__ == "__main__":
    main()
