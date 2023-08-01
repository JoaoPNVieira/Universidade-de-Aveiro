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
    mode = AES.MODE_ECB                                     # Paramentro de cifra 2 : "Chaining Mode"
    cipher = AES.new(cipherkey, mode)                       # Função que retorna Objecto de Class AESCipher que nos fornece funções encrypt() e decrypt() para os dados
    data = cipher.encrypt(bytes("%16d" % data, 'utf8'))     # cifrar str binaria de 128 bits (8 x 16)
    data_tosend = str(base64.b64encode (data), 'utf8')        # str base64 dict
    return data_tosend # dados a serem enviados


# ---------------------------------------------------------------------------------------------------
# Função para desencriptar valores recebidos em formato json com codificação base64
# return int data decrypted from a 16 bytes binary strings coded in base64
def decrypt_intvalue(cipherkey, data):
    mode = AES.MODE_ECB                                 # Paramentro de cifra 2 : "Chaining Mode"
    cipher = AES.new(cipherkey,mode)                    # Função que retorna Objecto de Class AESCipher
    data = base64.b64decode(data)              # str base64 dict
    data = cipher.decrypt(data) # decifrar str binaria de 128 bits (8 x 16)
    data_tosend = int(str(data, 'utf8'))                       # str para integer
    return data_tosend # dados recebidos


# ---------------------------------------------------------------------------------------------------
# verify if response from server is valid or is an error message and act accordingly
def validate_response(client_sock, response):
    if response['status'] == False:
        op = response['op']
        print(response)
        print(f'Operação {op} não foi aceite!')
        print("Erro 3: Operação inválida - " + response['error'])
        opExit(client_sock)


# ---------------------------------------------------------------------------------------------------
# process EXIT
def opExit(client_sock):
    print("Até à próxima")
    client_sock.close()
    sys.exit(0)

    
# ---------------------------------------------------------------------------------------------------
#process RETRY
def retry_game(client_sock, client_id):
    while True:
        print("\nQuer jogar novamente? (Y/N)?")
        replay = input("").upper()
        
        if replay == "Y":
            run_client(client_sock, client_id)
            
        elif replay == "N":
            print("\nFoi um prazer jogar consigo!")
            opExit(client_sock);
            
        else:
            print("Resposta Inválida")
            
                        
# ---------------------------------------------------------------------------------------------------
# process OP QUIT
def opQuit(client_sock):
	opQuit = {"op": "QUIT"}
	inMSG = sendrecv_dict(client_sock, opQuit)
	validate_response(client_sock, inMSG)
	print("Operação QUIT aceite.")
	
	opExit(client_sock)


# ---------------------------------------------------------------------------------------------------
# Question Safe Mode
def initQuestion():
    #Ciclo While para perguntar ao usuário o Modo de inicialização
    while True:
        print("\nDeseja executar o jogo em modo Seguro?(Y/N)")
        response = input("Resposta:").upper()
        
        #Cliente quer entrar com modo de Segurança
        if response == "Y":
            print("A aplicação vai ser inicializada em modo de Segurança\n")
            safeMode = True
            break
        #Cliente quer entrar com modo Não-Seguro
        elif response == "N":
            print("A aplicação vai ser inicializada em modo Standart(Não Seguro)\n")
            safeMode = False
            break
        #Resposta inválida
        else:
            print("Resposta inválida\n")
            
    return safeMode
            

# ---------------------------------------------------------------------------------------------------
# Process OP GUESS
def opGuessing(client_sock, clientInput):
    global turnCount
    global max_attempts
    global safeMode
    sucess = False
	
    # Aplicaçao só aceita valores dentro dos parametros
    if (int(clientInput) < 0 or int(clientInput) > 100):
        print("A operação 'Guess' só aceita valores entre 0 e 100\nTente outra vez.\n")

    # Função GUESS
    else:
        if safeMode: data = encrypt_intvalue(cipherkey, int(clientInput)) # Safe Mode - Encripta o Number Guess
        else: data = int(clientInput) #Standart Mode
            
        opGuess = {"op": "GUESS", "number": data}
        inMSG = sendrecv_dict(client_sock, opGuess)
        validate_response(client_sock, inMSG)
        
        #Registar tentativa
        turnCount += 1
        
        result = inMSG['result']
        if result == "equals": sucess = True
        
        print(f'Resultado: {result}')
        print(f'Jogadas feitas: {str(turnCount)}\{str(max_attempts)}\n')
        
    return sucess

# ---------------------------------------------------------------------------------------------------
# Suporte da execução do cliente
def run_client(client_sock, client_id):
    global turnCount
    global max_attempts
    global safeMode
    global cipherkey
    skip = False
    sucess = False
    turnCount = 0

    safeMode=initQuestion()
    if safeMode == True:
        cipherkey = os.urandom(16) # Paramentro de cifra 1 : Chave / KEY 16 bits aleatória
        cipherkey_tosend = str(base64.b64encode(cipherkey), 'utf8')

	#Ciclo While para dar a oportunidade ao usuário de corrigir o ID
    while not skip:
        if safeMode: opStart = {"op": "START", "client_id": client_id, "cipher": cipherkey_tosend} #Safe Mode - Envia cifra
        else: opStart = {"op": "START", "client_id": client_id, "cipher": None} #Standart Mode - Não envia cifra
        START = sendrecv_dict(client_sock, opStart)
        
        # Operação Start foi aceite pelo Servidor
        if START["status"] == True:
            max_attempts = START["max_attempts"]
            if safeMode: max_attempts = decrypt_intvalue(cipherkey, max_attempts) #Safe Mode - Decifra Max Attempts
            
            print(f'Operação START aceite. Tem {max_attempts} tentativas para tentar acertar no número secreto')
            skip = True

        # Operação Start não foi aceite pelo Servidor. Perguntar ao cliente se quer mudar ID
        else:
            while True:
                print("Erro: Já existe um cliente com esse ID. Deseja mudar ID? (Y/N)?")
                response = input("Resposta:").upper()
                # Nova tentativa de Start
                if response == "Y":
                    print("Novo ID:")
                    client_id = input("")
                    print("\n")
                    break
				# Cliente não quer prosseguir
                elif response == "N":
                    opExit(client_sock)
				#Resposta Inválida
                else:
                    print("Resposta inválida")
	
    #Ciclo Main - Jogo foi inicializado
    while True:
        try:
            clientInput = input("OP: ").lower()
            
            # Input é numero, assume que é uma tentativa/op:Guess
            if clientInput.isnumeric():
                sucess = opGuessing(client_sock,clientInput)
            
            # Função QUIT
            elif clientInput == "quit":
                opQuit(client_sock)

            # Input inválido, imprime mensagem de erro
            else:
                print("Operação Inválida!\n")

            
            # Função STOP
            if turnCount >= max_attempts or sucess == True:  # PERDEU POR ESGOTAR TENTATIVAS / ACERTOU NO NUMERO
                if safeMode: #Safe Mode
                    clientInput = encrypt_intvalue(cipherkey, int(clientInput)) #Encripta clientInupt
                    turnCount = encrypt_intvalue(cipherkey, turnCount) # Encripta turnCount
                    
                opStop = {"op": "STOP", "number": clientInput, "attempts": turnCount}
                inMSG = sendrecv_dict(client_sock, opStop)
                validate_response(client_sock, inMSG)
                
                secret_number = inMSG['guess']
                if safeMode: secret_number = decrypt_intvalue(cipherkey, secret_number) # Safe Mode - Decifra secret_number
                
                print(f'O jogo acabou. O número secreto era {secret_number}')
                if sucess: print("Você ACERTOU")
                else: print("Você esgotou as tentativas")
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
    
    #----------------------------------------------------------------------------
    #Error Handling - Argumentos na invocação do programa no terminal têm de estar correctos
    if len(sys.argv) != 4:
        print("Erro 1: Numero inválido de argumentos\n")
        sys.exit()
        
    if not sys.argv[2].isnumeric():
        print("Erro 2: Valor do Port Inválido (argv[2]) - Deve ser um número inteiro\n")
        sys.exit()
        
        
    #----------------------------------------------------------------------------
    #Main Function
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
    
    #----------------------------------------------------------------------------
    #Error Handling - Argumentos na invocação do programa no terminal têm de estar correctos
    except gaierror:
        print("Erro 4: Valor do IP inválido (argv[3])\n")
        
    except ConnectionRefusedError:
        print("Erro 5: Conexão falhada, tente outro valor Port (argv[2])\n")
        
    except OverflowError:
        print("Erro 2: Valor do Port Inválido (argv[2]) - Deve ser um número entre 1024 e 65535\n")
        

if __name__ == "__main__":
    main()
