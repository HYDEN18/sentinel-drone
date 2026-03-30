#!/usr/bin/env python3

'''

This python file runs a ROS-node of name drone_control which holds the position of e-Drone on the given dummy.
This node publishes and subsribes the following topics:

		PUBLICATIONS			SUBSCRIPTIONS
		/drone_command			/whycon/poses
		/alt_error				/pid_tuning_altitude
		/pitch_error			/pid_tuning_pitch
		/roll_error				/pid_tuning_roll
					
								

Rather than using different variables, use list. eg : self.setpoint = [1,2,3], where index corresponds to x,y,z ...rather than defining self.x_setpoint = 1, self.y_setpoint = 2
CODE MODULARITY AND TECHNIQUES MENTIONED LIKE THIS WILL HELP YOU GAINING MORE MARKS WHILE CODE EVALUATION.	
'''

# Importing the required libraries

from edrone_client.msg import *
from geometry_msgs.msg import PoseArray
from std_msgs.msg import Int16
from std_msgs.msg import Int64
from std_msgs.msg import Float64
from pid_tune.msg import PidTune
import rospy
import time
import numpy as np
import rospy # Python library for ROS
from sensor_msgs.msg import Image # Image is the message type
from cv_bridge import CvBridge # Package to convert between ROS and OpenCV Images
import cv2 # OpenCV library
from scipy import stats as st

class Edrone():
	"""docstring for Edrone"""
	def __init__(self):
		
		rospy.init_node('drone_control')
			# initializing ros node with name drone_control

		# This corresponds to your current position of drone. This value must be updated each time in your whycon callback
		# [x,y,z]
		self.drone_position = [0.0,0.0,0.0]	

		# [x_setpoint, y_setpoint, z_setpoint]
		#self.points=[[0,0,20],[0,6.51,20],[-9.5,6.5,20]]#,[-4,6.5,20],[-5,6.5,20],[-6,6.5,20],[-7,6.5,20],[-8,6.5,20],[-9.2,6.5,20]]
		self.points=[[0,0,20],[0,-6.5,20],[-2,2,20],[-4,6.5,20],[-5,6.5,20],[-6,6.5,20],[-8,6.5,20],[-9.5,6.5,20]]#,[-3,3,20],[-7.2,6.13,20]]
		#self.points=[[0,0,20],[0,1.5,20],[0,1.5,20],[-3,3,20],[-7.2,6.13,20]]
		#self.points=[[1,1,20]]
		self.setpoint = self.points[0] # whycon marker at the position of the dummy given in the scene. Make the whycon marker associated with position_to_hold dummy renderable and make changes accordingly
		self.ptr = 0
		self.tempary=[]
		#240 320
		#Declaring a cmd of message type edrone_msgs and initializing values
		self.cmd = edrone_msgs()
		self.cmd.rcRoll = 1500
		self.cmd.rcPitch = 1500
		self.cmd.rcYaw = 1500
		self.cmd.rcThrottle = 1000
		self.cmd.rcAUX1 = 1500
		self.cmd.rcAUX2 = 1500
		self.cmd.rcAUX3 = 1500
		self.cmd.rcAUX4 = 1500
		self.test=True
		self.testing=1
		#initial setting of Kp, Kd and ki for [roll, pitch, throttle]. eg: self.Kp[2] corresponds to Kp value in throttle axis
		#after tuning and computing corresponding PID parameters, change the parameters
		self.Kp = [27.54,64.2,31.4]
		self.Ki = [0,0,0.009]
		self.Kd = [530.7,799.2,277]

		#-----------------------Add other required variables for pid here ----------------------------------------------

		self.error=[0,0,0]
		self.prev_error=[0,0,0]
		self.sum_error=[0,0,0]
		self.faci=0
		self.facd=0
		#self.windupMax=0.12
		

 





		# Hint : Add variables for storing previous errors in each axis, like self.prev_values = [0,0,0] where corresponds to [pitch, roll, throttle]		#		 Add variables for limiting the values like self.max_values = [2000,2000,2000] corresponding to [roll, pitch, throttle]
		#													self.min_values = [1000,1000,1000] corresponding to [pitch, roll, throttle]
		#																	You can change the upper limit and lower limit accordingly. 
		#----------------------------------------------------------------------------------------------------------

		# # This is the sample time in which you need to run pid. Choose any time which you seem fit. Remember the stimulation step time is 50 ms
		# self.sample_time = 0.060 # in seconds







		# Publishing /drone_command, /alt_error, /pitch_error, /roll_error
		self.command_pub = rospy.Publisher('/drone_command', edrone_msgs, queue_size=1)
		#------------------------Add other ROS Publishers here-----------------------------------------------------
		self.throttle_error_pub = rospy.Publisher('/alt_error', Float64, queue_size=1)
		self.pitch_error_pub = rospy.Publisher('/pitch_error', Float64, queue_size=1)
		self.roll_error_pub = rospy.Publisher('/roll_error', Float64, queue_size=1)
		#self.image_pub=rospy.Publisher('/drone_display/image_view/output',Image,queue_size=1)




		#-----------------------------------------------------------------------------------------------------------


		# Subscribing to /whycon/poses, /pid_tuning_altitude, /pid_tuning_pitch, pid_tuning_roll
		rospy.Subscriber('/drone_display/image_view/output',Image,self.callback)
		rospy.Subscriber('/whycon/poses', PoseArray, self.whycon_callback)
		rospy.Subscriber('/pid_tuning_altitude',PidTune,self.altitude_set_pid)
		rospy.Subscriber('/pid_tuning_pitch',PidTune,self.pitchy_set_pid)
		rospy.Subscriber('/pid_tuning_roll',PidTune,self.rollx_set_pid)

		#-------------------------Add other ROS Subscribers here----------------------------------------------------






		#------------------------------------------------------------------------------------------------------------

		self.arm() # ARMING THE DRONE
	def PixToSetPoint(self,x,y,w,z):

		X = -0.0084745762712*x + 2.7881355932203
		Y = -0.0086956521739*y + 2.0869565217391
		print("currx",w,"coordix",X,"currx",z,"coordix",Y)
		return [w-X,z-Y,20]

	# Disarming condition of the drone
	def disarm(self):
		self.cmd.rcAUX4 = 1100
		self.command_pub.publish(self.cmd)
		rospy.sleep(1)


	# Arming condition of the drone : Best practise is to disarm and then arm the drone.
	def arm(self):
		
		self.disarm()
		self.cmd.rcRoll = 1500
		self.cmd.rcYaw = 1500
		self.cmd.rcPitch = 1500
		self.cmd.rcThrottle = 1000
		self.cmd.rcAUX4 = 1500
		self.command_pub.publish(self.cmd)	# Publishing /drone_command
		rospy.sleep(1)



	# Whycon callback function
	# The function gets executed each time when /whycon node publishes /whycon/poses 
	def whycon_callback(self,msg):
		self.drone_position[0] = msg.poses[0].position.x
		self.drone_position[1] = msg.poses[0].position.y
		self.drone_position[2] = msg.poses[0].position.z
		#--------------------Set the remaining co-ordinates of the drone from msg----------------------------------------------
	def callback(self,msg):
		br=CvBridge()
		current_frame=br.imgmsg_to_cv2(msg)
		img = current_frame
		hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
		lower_yellow= np.array([24,140,255])
		upper_yellow = np.array([27,160, 255])
		mask = cv2.inRange(hsv, lower_yellow, upper_yellow)
		res = cv2.bitwise_and(img, img, mask=mask)
		yellow = cv2.cvtColor(res, cv2.COLOR_BGR2GRAY)
		corners = cv2.goodFeaturesToTrack(yellow,20, 0.01, 10)
		try:
			corners = np.int0(corners)
			x = [k[0][0] for k in corners]
			y = [k[0][1] for k in corners]
			curr_x=self.points[self.ptr][0]
			curr_y=self.points[self.ptr][1]

			centroid = (sum(y)//len(y),sum(x)//len(x))
			if(self.test):
				self.points=self.points[:self.ptr+1]
				if(self.testing!=300):
					self.tempary.append(np.array([centroid[1],centroid[0]]))
					self.testing+=1
				else:
					z=st.mode(self.tempary,keepdims=True).mode
					print((np.array(self.PixToSetPoint(z[0][0],z[0][1],curr_x,curr_y))))
					print(z[0][0],z[0][1])

					#self.points.append((np.array(self.PixToSetPoint(z[0][0],z[0][1],curr_x,curr_y))+np.array([curr_x,curr_y,16]))/2)
					self.points.append(np.array(self.PixToSetPoint(z[0][0],z[0][1],curr_x,curr_y)))

					self.test=False
					
		except Exception as e:
			pass
		cv2.imshow("current_frame",current_frame)
		cv2.imshow("Yellow",yellow)
		cv2.waitKey(5)
		if(0xFF==ord('q')):
			cv2.destroyAllWindows()




		
		#---------------------------------------------------------------------------------------------------------------



	# Callback function for /pid_tuning_altitude
	# This function gets executed each time when /tune_pid publishes /pid_tuning_altitude
	def altitude_set_pid(self,alt):
		self.Kp[2] = alt.Kp * 0.06 # 113.94This is just for an example. You can change the ratio/fraction value accordingly
		self.Ki[2] = alt.Ki * 0.008
		self.Kd[2] = alt.Kd * 0.3#1128.9
		
		
	def pitchy_set_pid(self,alt):
		self.Kp[1] = alt.Kp * 0.06 # 74.76This is just for an example. You can change the ratio/fraction value accordingly
		self.Ki[1] = alt.Ki * 0.008
		self.Kd[1] = alt.Kd * 0.3#1041


	
	def rollx_set_pid(self,alt):
		self.Kp[0] = alt.Kp * 0.06 #102.24 This is just for an example. You can change the ratio/fraction value accordingly
		self.Ki[0] = alt.Ki * 0.008#
		self.Kd[0] = alt.Kd * 0.3#1041

	
		
		

	#----------------------------Define callback function like altitide_set_pid to tune pitch, roll--------------


















	#----------------------------------------------------------------------------------------------------------------------


	def pid(self):
	#-----------------------------Write the PID algorithm here--------------------------------------------------------------

	# Steps:
	# 	1. Compute error in each axis. eg: error[0] = self.drone_position[0] - self.setpoint[0] ,where error[0] corresponds to error in x...
	#	2. Compute the error (for proportional), change in error (for derivative) and sum of errors (for integral) in each axis. Refer "Understanding PID.pdf" to understand PID equation.
	#	3. Calculate the pid output required for each axis. For eg: calcuate self.out_roll, self.out_pitch, etc.
	#	4. Reduce or add this computed output value on the avg value ie 1500. For eg: self.cmd.rcRoll = 1500 + self.out_roll. LOOK OUT FOR SIGN (+ or -). EXPERIMENT AND FIND THE CORRECT SIGN
	#	5. Don't run the pid continously. Run the pid only at the a sample time. self.sampletime defined above is for this purpose. THIS IS VERY IMPORTANT.
	#	6. Limit the output value and the final command value between the maximum(2000) and minimum(1000)range before publishing. For eg : if self.cmd.rcPitch > self.max_values[1]:
	#																														self.cmd.rcPitch = self.max_values[1]
	#	7. Update previous errors.eg: self.prev_error[1] = error[1] where index 1 corresponds to that of pitch (eg)
	#	8. Add error_sum
		self.error[2]= -(self.setpoint[2]-self.drone_position[2])
		self.cmd.rcThrottle=int(1500 + (self.error[2]* self.Kp[2] )+(self.error[2] - self.prev_error[2])*self.Kd[2] + (self.sum_error[2]* self.Ki[2]))
		
		if self.cmd.rcThrottle>2000:
			self.cmd.rcThrottle=2000
		elif self.cmd.rcThrottle<1000:
			self.cmd.rcThrottle=1000
		self.prev_error[2]=self.error[2]
		self.sum_error[2]=self.sum_error[2]+self.error[2]
		self.faci=(self.sum_error[2]* self.Ki[2])
		#self.facd=(self.error[2] - self.prev_error[2])*self.Kd[2]
		##self.Kd[2]=0.0
		
		if(self.cmd.rcThrottle>1505 and self.cmd.rcThrottle<1495)and (self.error[2]*self.faci >0 ):
			self.Ki[2]=0.0
		else :
			self.Ki[2] =0.017
		if self.sum_error[2] > 0.05:
			self.sum_error[2] =0.05
		elif self.sum_error[2] <-0.05:
			self.sum_error[2] =-0.05
		#print(self.faci)
#-----------------------------------------------------------------------------------------------------------------
		self.error[1]= -(self.setpoint[1]-self.drone_position[1])
		self.cmd.rcPitch=int(1500 + (self.error[1]* self.Kp[1] )+(self.error[1] - self.prev_error[1])*self.Kd[1] + (self.sum_error[1]* self.Ki[1]))
		if self.cmd.rcPitch>2000:
			self.cmd.rcPitch=2000
		elif self.cmd.rcPitch<1000:
			self.cmd.rcPitch=1000
		self.prev_error[1]=self.error[1]
		self.sum_error[1]=self.sum_error[1]+self.error[1]


	#------------------------------------------------------------------------------------------------------------------------
		self.error[0]=(self.setpoint[0]-self.drone_position[0])
		self.cmd.rcRoll=int(1500 + (self.error[0]* self.Kp[0] )+(self.error[0] - self.prev_error[0])*self.Kd[0] + (self.sum_error[0]* self.Ki[0]))
		#print(self.cmd.rcRoll, (self.error[0]* self.Kp[0] ),(self.error[0] - self.prev_error[0])*self.Kd[0] ,(self.sum_error[0]* self.Ki[0])))
		if self.cmd.rcRoll>2000:
			self.cmd.rcRoll=2000
		elif self.cmd.rcRoll<1000:
			self.cmd.rcRoll=1000
		#print((self.error[0]* self.Kp[0] )+(self.error[0] - self.prev_error[0])*self.Kd[0] + (self.sum_error[0]* self.Ki[0]),self.error[0])
		self.prev_error[0]=self.error[0]
		self.sum_error[0]=self.sum_error[0]+self.error[0]

		
		if(self.error[0]< 0.12 and self.error[0]>-0.13 and self.error[1]< 0.13 and self.error[1]>-0.12 and self.error[2]< 0.12 and self.error[2]>-0.12 ):
			if(self.ptr!=len(self.points)-1):
				self.setpoint=self.points[self.ptr+1]
				self.ptr+=1
				print("Reached")
				print(self.setpoint)

        
		self.command_pub.publish(self.cmd)
		self.throttle_error_pub.publish(self.error[2])
		self.pitch_error_pub.publish(self.error[1])
		self.roll_error_pub .publish(self.error[0])









	

if __name__ == '__main__':
	time.sleep(1)
	
	e_drone = Edrone()
	r = rospy.Rate(37) #specify rate in Hz based upon your desired PID sampling time, i.e. if desired sample time is 33ms specify rate as 30Hz
	while not rospy.is_shutdown():
		e_drone.pid()
		r.sleep()
