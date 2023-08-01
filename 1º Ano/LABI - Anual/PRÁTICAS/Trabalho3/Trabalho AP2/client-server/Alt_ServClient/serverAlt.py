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
active = []

# Ficheiro CSV para guardar resultados dos clientes
filename = 'report.csv'


# ----------------------------------------------------------------------------------------------------------
# Função para encriptar valores a enviar em formato json com codificação base64
# return int data encrypted in a 16 bytes binary string and coded base64
def encrypt_intvalue(client_id, data):
    return None


# Função para desencriptar valores recebidos em formato json com codificação base64
# return int data decrypted from a 16 bytes binary string and coded base64
def decrypt_intvalue(client_id, data):
    return None


# ----------------------------------------------------------------------------------------------------------
# return the client_id of a socket
def find_client_id(client_sock):
    index = clients.index(client_sock)
    client_id = nicknames[index]

    return client_id

# ----------------------------------------------------------------------------------------------------------
# return the status of a socket
def isActive(client_sock):
	index = clients.index(client_sock)
	status = active[index]
	
	return status


# ----------------------------------------------------------------------------------------------------------
# Suporte da eliminação de um cliente
# obtain the client_id from his socket and delete from the dictionary
def clean_client(client_sock):
    client_id = find_client_id(client_sock)
    status = isActive(client_sock)

    if gamers.get(client_id) != None and status == True:
        gamers.pop(client_id)


# ----------------------------------------------------------------------------------------------------------
# Suporte da criação de um ficheiro csv com o respectivo cabeçalho
# create report csv file with header
def create_file():
    if not path.exists(filename):
        csvfile = open(filename, 'w')
        fields = ['Cliente ID', 'Número Secreto', 'Tentativas Possíveis', 'Tentativas Jogadas', 'Resultado']

        writer = csv.DictWriter(csvfile, fieldnames=fields)
        writer.writeheader()
        
        csvfile.close()


# ---------------------------------------------------------------------------------------------------
# Suporte da actualização de um ficheiro csv com a informação do cliente e resultado
# update report csv file with the result from the client
def update_file(client_id, result):
    csvfile = open(filename, 'a+', newline='')
    fields = ['Cliente_ID', 'Número_Secreto', 'Tentativas_Possíveis', 'Tentativas_Jogadas', 'Resultado']

    secret_number = gamers[client_id][0]
    max_attempts = gamers[client_id][1]
    turns_count = gamers[client_id][2]

    writer = csv.DictWriter(csvfile, fieldnames=fields)

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

        if (message["op"] == "START"): start_client(client_sock, message)
        if (message["op"] == "GUESS"): guess_client(client_sock, message)
        if (message["op"] == "QUIT"): quit_client(client_sock)
        if (message["op"] == "STOP"): stop_client(client_sock, message)

    except:
        return False


# ---------------------------------------------------------------------------------------------------
# Suporte da criação de um novo jogador - operação START
#----------------------------------------------------------------------------------------------------
# detect the client in the request
# verify the appropriate conditions for executing this operation
# obtain the secret number and number of attempts
# process the client in the dictionary
# return response message with results or error message
def start_client(client_sock, request):
    client_id = request['client_id']  # Aqui nao usamos a funçao find_client_id para dar a oportunidade ao cliente de mudar ID

    if gamers.get(client_id) == None:
        secret_number = random.randint(0, 100)
        max_attempts = random.randint(10, 30)
        turns_count = 0
        
        #Reactualiza nicknames para o caso de mudança de ID
        index = clients.index(client_sock)
        nicknames[index] = client_id
        active[index] = True

        gamers.update({client_id: [secret_number, max_attempts, turns_count]})
        opStart = {"op": "START", "status": True, "max_attempts": max_attempts}
        send_dict(client_sock, opStart)

        print(f'Request of START accepted. Secret number of {client_id} is: {str(secret_number)}\n')

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
    print("This is guess")  # Teste

    client_id = find_client_id(client_sock)
    active = isActive(client_sock)

    # Cliente não está na lista de jogadores activos
    if gamers.get(client_id) == None:
        opGuess = {"op": "GUESS", "status": False, "error": "Cliente inexistente"}
        send_dict(client_sock, opGuess)
     
    #Cliente não está activo porque tem um ID repetido 
    elif not active:
        opGuess = {"op": "GUESS", "status": False, "error": "Cliente não está activo"}
        send_dict(client_sock, opGuess)


    #Funcinamento correcto
    else:
        attempt = int(request["number"])

        secret_number = gamers[client_id][0]
        max_attempts = gamers[client_id][1]
        turns_count = gamers[client_id][2]
        turns_count += 1

        gamers.update({client_id: [secret_number, max_attempts, turns_count]})

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
    print("This is QUIT")  # teste

    client_id = find_client_id(client_sock)
    active = isActive(client_sock)

	# Cliente não está na lista de jogadores activos
    if gamers.get(client_id) == None:
        opQuit = {"op": "QUIT", "status": False, "error": "Cliente inexistente"}
        send_dict(client_sock, opQuit)
        
    #Cliente não está activo porque tem um ID repetido
    elif not active:
        opQuit = {"op": "QUIT", "status": False, "error": "Cliente não está activo"}
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
    print("This is Stop")

    client_id = find_client_id(client_sock)

    secret_number = gamers[client_id][0]
    max_attempts = gamers[client_id][1]
    turns_count = gamers[client_id][2]

    last_number = request["number"]
    attempts = request["attempts"]

    if gamers.get(client_id) == None:
        print("Something is wrong")  # Para depois
        opStop = {"op": "QUIT", "status": False, "error": "um dos erros indicados em cima"}
    else:
        if int(last_number) == int(secret_number):
            update_file(client_id, "SUCESS")
            opStop = {"op": "STOP", "status": True, "guess": secret_number}
        else:
            update_file(client_id, "FAILURE")
            opStop = {"op": "STOP", "status": True, "guess": secret_number}

    send_dict(client_sock, opStop)
    clean_client(client_sock)
    #clients.remove(client_sock) # Talvez seja para alterar
    #client_sock.close() #Talvez seja para alterar
    return None


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# validate the number of arguments and eventually print error message and exit with error
# verify type of of arguments and eventually print error message and exit with error
def main():

    REGRAS = "\n**Regras do jogo**\nObjectivo: Adivinhar um número entre 0 e 100\nPara desistir do jogo escrever \"quit\"\nPara sair do programa escrever \"exit\"\n"

    IP = "127.0.0.1"
    PORT = 12345

    # Create a socket    # AF_INET - address family Ipv4    #SOCK_STREAM - TCP
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Sets REUSEADDR (as a socket option) to 1 on socket
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

    server_socket.bind((IP, PORT))
    server_socket.listen(10)
 
    create_file()

    print(f'Listening for connections on {IP}:{PORT}...')

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
                active.append(False)

                nickname = newclient.recv(1024).decode('utf-8')  # receives client ID
                nicknames.append(nickname)
                newclient.send(REGRAS.encode('utf-8'))  # Send rules of game

                print(f'Accepted new connection from {addr}, username: {nickname}')

            # Or an existing client
            else:
                try:  # Avoid error when client imediately shuts down after connecting

                    # See if client sent a message
                    if len(client_sock.recv(1, socket.MSG_PEEK)) != 0:
                        # client socket has a message
                        new_msg(client_sock)
                    else:  # Or just disconnected
                        client_id = find_client_id(client_sock)
                        print(f' {client_id} has disconnected\n')
                        clean_client(client_sock)
                        clients.remove(client_sock)
                        client_sock.close()
                        break  # Reiterate select

                except IOError as e:
                    if e.errno != errno.ECONNRESET:
                        raise  # Not error we are looking for
                    pass  # Handle error here.


if __name__ == "__main__":
    main()
