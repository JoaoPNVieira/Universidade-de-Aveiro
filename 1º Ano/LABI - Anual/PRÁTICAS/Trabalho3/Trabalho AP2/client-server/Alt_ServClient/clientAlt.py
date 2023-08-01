#!/usr/bin/python3

import errno
import os
import sys
import socket
import json
import base64
from common_comm import send_dict, recv_dict, sendrecv_dict
from Crypto.Cipher import AES
from socket import gethostbyname, gaierror

#ClientID
userID = sys.argv[1]

#Variaveis globais
turnCount = 0
max_attempts = 100

#Apresentaçao dos autores
welcome = ("\n \n \n"
          "                          ██▄                           \n"
          "                  ██       ██       ██                  \n"
          "                 ████      ██      ████                 \n"
          "                 █████     ██     █████                 \n"
          "                 ██████████████████████                 \n"
          "                 ██████████████████████                 \n"
          "                 ███▒▒▒▒▒▒████▒▒▒▒▒▒███                 \n"
          "                 ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███                 \n"
          "                 ███▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███                 \n"
          "                 █████████▒▒▒▒█████████                 \n"
          "                  ████████████████████                  \n" 
          "                 UNIVERSIDADE DE AVEIRO:                \n"
          "Departamento de Eletrónica, Telecomunicações e Informática"
          "\n         Laboratórios de Informática - 2020/2021        "
          "\n \n AUTORES :"
          "\n Rui Miguel Fonseca Coimbra Machado ---> NºMec.: 65081"
          "\n João Pedro Nunes Vieira --------------> NºMec.: 50458"
          "\n \n \n"
          "███╗  ████╗ ██╗  ██╗    █╗   █╗ █╗ █╗  █╗ ███╗  ██╗ \n"
          "█╔═█╗ █╔══╝ ███╗ ██║    █║   █║ █║ ██╗ █║ █╔═█╗█╔═█╗\n"
          "█╔═█╗ █╔══╝ ███╗ ██║    █║   █║ █║ ██╗ █║ █╔═█╗█╔═█╗\n"
          "███╦╝ ██╗   █╔███╔█║ █╗  █╗ █╔╝ █║ █╔█╗█║ █║ █║█║ █║\n"
          "█╔═█╗ █╔═╝  █║╚█╔╝█║ ╚╝   ██╔╝  █║ █║╚██║ █║ █║█║ █║\n"
          "███╦╝ ████╗ █║ ╚╝ █║      ██╝   █║ █║ ╚█║ ███╔╝ ██╔╝\n"
          "╚══╝  ╚═══╝ ╚═╝  ╚═╝      ╚╝    ╚╝ ╚╝  ╚╝ ╚══╝  ╚═╝ \n")



# ---------------------------------------------------------------------------------------------------
# Função para encriptar valores a enviar em formato json com codificação base64
# return int data encrypted in a 16 bytes binary string coded in base64
def encrypt_intvalue(cipherkey, data):
    #cipherkey = str(base64.b64encode(cipherkey), 'utf8') #chave a enviar

    data = base64.b64decode(data)  # decode do base64 (json)
    cipherkey = os.urandom(16)  # chave 16 bits aleatória
    mode = AES.MODE_ECB
    cipher = AES.new(cipherkey, mode)

    #nonce = cipher.nonce

    return None


# Função para desencriptar valores recebidos em formato json com codificação base64
# return int data decrypted from a 16 bytes binary strings coded in base64
def decrypt_intvalue(cipherkey, data):

    data = base64.b64decode(data)   #decode do base64 (json)
    cipherkey = os.urandom(16)      #chave 16 bits aleatória
    mode = AES.MODE_ECB             #modo de operação
    cipher = AES.new(cipherkey, mode)
    data = cipher.decrypt_intvalue(data)

    return data


# verify if response from server is valid or is an error message and act accordingly
def validate_response(client_sock, response):
    if response['status'] == False:
        print("Erro 3: Operação inválida")
        opExit(client_sock)

    return None


# ---------------------------------------------------------------------------------------------------
# process EXIT
def opExit(client_sock):
    client_sock.close()
    sys.exit(0)
    
# ---------------------------------------------------------------------------------------------------
# process OP QUIT
def opQuit(client_sock):
	opQuit = {"op": "QUIT"}
	inMSG = sendrecv_dict(client_sock, opQuit)
	print(inMSG)


# ---------------------------------------------------------------------------------------------------
#process RETRY
def retry_game(client_sock, client_id):
    while True:
        print("\n Quer jogar novamente? (Y/N)?")
        replay = input("").upper()
        
        if replay == "Y":
            run_client(client_sock, client_id)
            
        elif replay == "N":
            print("Foi um prazer jogar consigo! Até à próxima!")
            opExit(client_sock);
            
        else:
            print("Resposta Inválida")


# ---------------------------------------------------------------------------------------------------
# Suporte da execução do cliente
def run_client(client_sock, client_id):
    skip = False
    sucess = False
    
    turnCount = 0
    max_attempts = 100

	#Ciclo While para dar a oportunidade ao cliente de corrigir o ID
    while not skip:
        opStart = {"op": "START", "client_id": client_id}
        START = sendrecv_dict(client_sock, opStart)

        print(START)
        
        # Operação Start foi aceite pelo Servidor
        if START["status"] == True:
            max_attempts = START["max_attempts"]
            skip = True

        # Operação Start não foi aceite pelo Servidor. Perguntar ao cliente se quer mudar ID
        else:
            while True: #problema vem daqui penso eu...
                print("Erro: Já existe um cliente com esse ID. Deseja mudar ID? (Y/N)?")
                response = input("").upper();
                # Nova tentativa de Start
                if response == "Y":
                    print("Novo ID:")
                    client_id = input("")
                    break
				# Cliente quer prosseguir sem mudar ID, nao pode jogar
                elif response == "N":
                    print("")
                    skip = True
                    break
				#Resposta Inválida
                else:
                    print("Resposta inválida")
	

    while True:
        try:
            clientInput = input("").lower()
                
            
            # Input é numero, assume que é uma tentativa/op:Guess
            if clientInput.isnumeric():
                # Aplicaçao só aceita valores dentro dos parametros
                if (int(clientInput) < 0 or int(clientInput) > 100):
                    print("\nA operação 'Guess' só aceita valores entre 0 e 100\nTente outra vez:")

                # Função GUESS
                else:
                    opGuess = {"op": "GUESS", "number": clientInput}
                    inMSG = sendrecv_dict(client_sock, opGuess)
                    turnCount += 1
                    if inMSG['status']:
                        if inMSG['result'] == "equals": sucess = True
                    print(inMSG)
                    print(f'turns: {str(turnCount)}')

            
            # Função QUIT
            elif clientInput == "quit":
                opQuit(client_sock)
                
            # Função Exit
            elif clientInput == "exit":
                opExit(client_sock)

            
            # Input inválido, imprime mensagem de erro
            else:
                print("Operação Inválida!")

            
            # Função STOP
            if turnCount >= max_attempts:  # PERDEU POR ESGOTAR TENTATIVAS
                opStop = {"op": "STOP", "number": clientInput, "attempts": turnCount}
                inMSG = sendrecv_dict(client_sock, opStop)
                print(inMSG)
                retry_game(client_sock, client_id)

            if sucess:  # GANHOU
                opStop = {"op": "STOP", "number": clientInput, "attempts": turnCount}
                inMSG = sendrecv_dict(client_sock, opStop)
                print(inMSG)
                retry_game(client_sock, client_id)
                    
                    
        # ---------------------------------------------
        # Error Handling
        except IOError as e:
            print(f'Reading error1: {str(e)}')
            sys.exit()

        except Exception as e:
            print(f'Reading error2: {str(e)}')
            sys.exit()


# -------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------
# validate the number of arguments and eventually print error message and exit with error
# verify type of of arguments and eventually print error message and exit with error
def main():
    
    if len(sys.argv) != 4:
        print("Erro 1: Numero inválido de argumentos")
        sys.exit()
        
    if not sys.argv[2].isnumeric():
        print("Erro 2: Valor do Port Inválido (argv[2])")
        sys.exit()
        
    try:
        
        PORT = int(sys.argv[2])
        IP = sys.argv[3]

        client_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_sock.connect((IP, PORT))

        client_sock.send(userID.encode('utf-8'))
        regras = client_sock.recv(1024).decode('utf-8')

        print(welcome)
        print(regras)

        run_client(client_sock, userID)

        opExit(client_sock)
    
    except gaierror:
        print("Erro 4: Valor do IP inválido (argv[3])")
        
    except ConnectionRefusedError:
        print("Erro 2: Conexão falhada, tente outro valor Port (argv[2])")
        

if __name__ == "__main__":
    main()
