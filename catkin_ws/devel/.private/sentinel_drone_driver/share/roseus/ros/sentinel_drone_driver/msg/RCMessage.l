;; Auto-generated. Do not edit!


(when (boundp 'sentinel_drone_driver::RCMessage)
  (if (not (find-package "SENTINEL_DRONE_DRIVER"))
    (make-package "SENTINEL_DRONE_DRIVER"))
  (shadow 'RCMessage (find-package "SENTINEL_DRONE_DRIVER")))
(unless (find-package "SENTINEL_DRONE_DRIVER::RCMESSAGE")
  (make-package "SENTINEL_DRONE_DRIVER::RCMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude RCMessage.msg.html


(defclass sentinel_drone_driver::RCMessage
  :super ros::object
  :slots (_rc_throttle _rc_roll _rc_pitch _rc_yaw ))

(defmethod sentinel_drone_driver::RCMessage
  (:init
   (&key
    ((:rc_throttle __rc_throttle) 0)
    ((:rc_roll __rc_roll) 0)
    ((:rc_pitch __rc_pitch) 0)
    ((:rc_yaw __rc_yaw) 0)
    )
   (send-super :init)
   (setq _rc_throttle (round __rc_throttle))
   (setq _rc_roll (round __rc_roll))
   (setq _rc_pitch (round __rc_pitch))
   (setq _rc_yaw (round __rc_yaw))
   self)
  (:rc_throttle
   (&optional __rc_throttle)
   (if __rc_throttle (setq _rc_throttle __rc_throttle)) _rc_throttle)
  (:rc_roll
   (&optional __rc_roll)
   (if __rc_roll (setq _rc_roll __rc_roll)) _rc_roll)
  (:rc_pitch
   (&optional __rc_pitch)
   (if __rc_pitch (setq _rc_pitch __rc_pitch)) _rc_pitch)
  (:rc_yaw
   (&optional __rc_yaw)
   (if __rc_yaw (setq _rc_yaw __rc_yaw)) _rc_yaw)
  (:serialization-length
   ()
   (+
    ;; uint16 _rc_throttle
    2
    ;; uint16 _rc_roll
    2
    ;; uint16 _rc_pitch
    2
    ;; uint16 _rc_yaw
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _rc_throttle
       (write-word _rc_throttle s)
     ;; uint16 _rc_roll
       (write-word _rc_roll s)
     ;; uint16 _rc_pitch
       (write-word _rc_pitch s)
     ;; uint16 _rc_yaw
       (write-word _rc_yaw s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _rc_throttle
     (setq _rc_throttle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rc_roll
     (setq _rc_roll (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rc_pitch
     (setq _rc_pitch (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rc_yaw
     (setq _rc_yaw (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get sentinel_drone_driver::RCMessage :md5sum-) "41f534868ff2103b914923c89e4aa7e5")
(setf (get sentinel_drone_driver::RCMessage :datatype-) "sentinel_drone_driver/RCMessage")
(setf (get sentinel_drone_driver::RCMessage :definition-)
      "
uint16 rc_throttle
uint16 rc_roll
uint16 rc_pitch
uint16 rc_yaw


")



(provide :sentinel_drone_driver/RCMessage "41f534868ff2103b914923c89e4aa7e5")


