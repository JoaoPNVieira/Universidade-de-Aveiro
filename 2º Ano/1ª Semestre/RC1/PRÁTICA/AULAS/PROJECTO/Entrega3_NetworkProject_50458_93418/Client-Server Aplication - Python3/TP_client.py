import socket

# Client-side code

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
server_address = ('120.100.20.2', 10000)
sock.connect(server_address)

try:
    # Send a message to the server
    message = input("Message to send:")
    sock.sendall(message.encode())

    # Receive the server's response
    response = sock.recv(1024)
    print(response.decode())
finally:
    # Close the connection
    sock.close()