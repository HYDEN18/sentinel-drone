import socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(("127.0.0.1", 12345))

ip = input("Enter the ip to know to mac :")
client.send(ip.encode())
mac = client.recv(1024)
mac = mac.decode("utf-8")
print("The corresponding mac address is ", mac)

client.close()