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


userID = sys.argv[1]


turnCount = 0


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




def encrypt_intvalue(cipherkey, data):
   

    data = base64.b64decode(data)  
    cipherkey = os.urandom(16)  
    mode = AES.MODE_ECB
    cipher = AES.new(cipherkey, mode)

  

    return None


def decrypt_intvalue(cipherkey, data):

    data = base64.b64decode(data)   
    cipherkey = os.urandom(16)      
    mode = AES.MODE_ECB             
    cipher = AES.new(cipherkey, mode)
    data = cipher.decrypt_intvalue(data)

    return data


def validate_response(client_sock, response):
    if response['status'] == False:
        op = response['op']
        print(f'Operação {op} não foi aceite!')
        print("Erro 3: Operação inválida")
        print("Erro: " + response['error'])
        opExit(client_sock)


def opExit(client_sock):
    print("Até à próxima")
    client_sock.close()
    sys.exit(0)
    
    
def opQuit(client_sock):
	opQuit = {"op": "QUIT"}
	inMSG = sendrecv_dict(client_sock, opQuit)
	validate_response(client_sock, inMSG)
	print("Operação QUIT aceite.")
	
	opExit(client_sock)


def retry_game(client_sock, client_id):
    while True:
        print("\nQuer jogar novamente? (Y/N)?")
        replay = input("").upper()
        
        if replay == "Y":
            run_client(client_sock, client_id)
            
        elif replay == "N":
            print("Foi um prazer jogar consigo! Até à próxima!")
            opExit(client_sock);
            
        else:
            print("Resposta Inválida")
            

def opGuessing(client_sock, clientInput):
    global sucess
    sucess = False
	
    
    if (int(clientInput) < 0 or int(clientInput) > 100):
        print("\nA operação 'Guess' só aceita valores entre 0 e 100\nTente outra vez:")

  
    else:
        opGuess = {"op": "GUESS", "number": clientInput}
        inMSG = sendrecv_dict(client_sock, opGuess)
        validate_response(client_sock, inMSG)
        
        
        global turnCount
        turnCount += 1
        
        result = inMSG['result']
        if result == "equals": sucess = True
        
        print(f'Resultado: {result}')
        print(f'Jogadas feitas: {str(turnCount)}\n')
        
    return sucess



def run_client(client_sock, client_id):
    skip = False
    global turnCount
    
    #-----------------------------------------
    #CODIGO DE TESTE
    #Testar situação em que o cliente envia operação Guess sem estar a jogar
    #-----------------------------------------
    opGuess = {"op": "GUESS", "number": 32}
    inMSG = sendrecv_dict(client_sock, opGuess)
    print("\nMensagem do Servidor:")
    print(inMSG)
    print("\n")
    validate_response(client_sock, inMSG)
    #-----------------------------------------
	
    while not skip:
        opStart = {"op": "START", "client_id": client_id}
        START = sendrecv_dict(client_sock, opStart)
        
      
        if START["status"] == True:
            max_attempts = START["max_attempts"]
            print(f'Operação START aceite. Tem {max_attempts} tentativas para tentar acertar no número secreto')
            skip = True

        
        else:
            while True:
                print("Erro: Já existe um cliente com esse ID. Deseja mudar ID? (Y/N)?")
                response = input("Resposta:").upper();
                
                if response == "Y":
                    print("Novo ID:")
                    client_id = input("")
                    break
				
                elif response == "N":
                    print("Até à próxima")
                    opExit(client_sock)
				
                else:
                    print("Resposta inválida")
	

    while True:
        try:
            clientInput = input("OP: ").lower()
            
            
            if clientInput.isnumeric():
                sucess = opGuessing(client_sock,clientInput)
            
            
            elif clientInput == "quit":
                opQuit(client_sock)

           
            else:
                print("Operação Inválida!")

            
           
            if turnCount >= max_attempts or sucess == True:  
                opStop = {"op": "STOP", "number": clientInput, "attempts": turnCount}
                inMSG = sendrecv_dict(client_sock, opStop)
                validate_response(client_sock, inMSG)
                
                secret_number = inMSG['guess']
                print(f'O jogo acabou. O número secreto era {secret_number}')
                if sucess: print("Você ACERTOU")
                else: print("Você esgotou as tentativas")
                retry_game(client_sock, client_id)
                    
                    
      
        except IOError as e:
            print(f'Reading error1: {str(e)}')
            sys.exit()

        except Exception as e:
            print(f'Reading error2: {str(e)}')
            sys.exit()



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
