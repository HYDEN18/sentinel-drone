import socket
table = {
		"192.168.1.1" : "1E.4A.4A.11",
		"192.168.1.2" : "1E.4A.4A.12",
		"196.168.1.3" : "1E.4A.4A.13"
	}
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('',12345))
server.listen()
client,address = server.accept()
print("Connection from",address,"has established.")
ip = client.recv(1024)
ip = ip.decode("utf-8")
mac = table.get(ip,"No entry found for given address")
client.send(mac.encode())
server.close()
client.close()