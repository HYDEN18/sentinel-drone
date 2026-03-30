# Sentinel Drone 🚁

An autonomous drone system capable of navigating from one point to another without manual control using PID-based control, ROS, and onboard computer vision.

---

## 🔥 Features

- Autonomous navigation using PID control
- Built on ROS (Robot Operating System)
- Custom Debian Linux bring-up on Banana Pi SBC
- Low-level driver development:
  - SPI
  - I2C
  - WiFi
- CSI camera interface bring-up
- Real-time object detection using computer vision
- Live video streaming to remote system
- UDP-based communication
- Secure remote access via SSH

---

## 🧱 System Architecture

- SBC: Banana Pi
- OS: Custom Debian Linux kernel
- Middleware: ROS
- Communication: UDP + SSH
- Vision: OpenCV / Deep Learning models

---

## ⚙️ Technologies Used

- C / C++
- Python
- ROS
- Linux Kernel Development
- Networking (UDP, SSH)
- Computer Vision

---

## 🚀 How It Works

1. Drone boots into custom Debian OS
2. Drivers initialize (SPI, I2C, WiFi, Camera)
3. ROS nodes start:
   - PID controller
   - Navigation system
   - Vision processing
4. Camera captures live feed
5. Object detection runs onboard
6. Drone adjusts trajectory autonomously
7. Video stream sent to ground station via UDP
8. Monitoring via SSH on Ubuntu laptop
