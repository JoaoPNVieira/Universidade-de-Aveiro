import socket

# Server-side code

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the address and port
server_address = ('120.100.20.2', 10000)
sock.bind(server_address)

# Listen for incoming connections
sock.listen(1)

# Initialize a counter for the total number of bytes received
total_payload_bytes = 0

#dictionary to store number of payload bytes received from each client
client_payload_bytes = {}

while True:
    # Wait for a connection
    print('Waiting for a connection...')
    connection, client_address = sock.accept()

    try:
        # Receive data from the client
        data = connection.recv(16)
        payload = data.decode()

        #get the number of payload bytes received from this client
        client_payload_bytes[client_address] = len(data)

        # Increment the total number of bytes received
        total_payload_bytes += len(data)

        # Get the server's hostname and IP address
        hostname = socket.gethostname()
        ip_address = socket.gethostbyname(hostname)

        # Send the hostname, IP address, and total number of bytes received to the client      
        response = f"Hostname: {hostname}\nIP address: {ip_address}\nPayload bytes received from this client: {client_payload_bytes[client_address]}\nTotal payload bytes received: {total_payload_bytes}"
    

        connection.sendall(response.encode())
    finally:
        # Close the connection
        connection.close()


