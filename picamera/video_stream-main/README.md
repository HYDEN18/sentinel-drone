# video_stream

## client.py:

This script streams camera data via UDP. Device acts as UDP client
Change the ip address, ip address should be the ros master ip(i.e IP of UDP server which is running on desktop)
Run this script on pi

## server.py:
This script is useful to read the camera stream sent by UDP client. Acts as UDP server.
Change the ip address, ip address should be the ros master ip(i.e IP of UDP server which is running on desktop)

> IP address in client.py and server.py should be same. 

## ros_stream.py:

This script runs UDP server on a ros node and converts the image frame data to a ros topic.
Change the ip address with the ROS master ip addressed to PC
Run this script on desktop

