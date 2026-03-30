;; Auto-generated. Do not edit!


(when (boundp 'sentinel_drone_driver::CommandBool)
  (if (not (find-package "SENTINEL_DRONE_DRIVER"))
    (make-package "SENTINEL_DRONE_DRIVER"))
  (shadow 'CommandBool (find-package "SENTINEL_DRONE_DRIVER")))
(unless (find-package "SENTINEL_DRONE_DRIVER::COMMANDBOOL")
  (make-package "SENTINEL_DRONE_DRIVER::COMMANDBOOL"))
(unless (find-package "SENTINEL_DRONE_DRIVER::COMMANDBOOLREQUEST")
  (make-package "SENTINEL_DRONE_DRIVER::COMMANDBOOLREQUEST"))
(unless (find-package "SENTINEL_DRONE_DRIVER::COMMANDBOOLRESPONSE")
  (make-package "SENTINEL_DRONE_DRIVER::COMMANDBOOLRESPONSE"))

(in-package "ROS")





(defclass sentinel_drone_driver::CommandBoolRequest
  :super ros::object
  :slots (_value ))

(defmethod sentinel_drone_driver::CommandBoolRequest
  (:init
   (&key
    ((:value __value) nil)
    )
   (send-super :init)
   (setq _value __value)
   self)
  (:value
   (&optional (__value :null))
   (if (not (eq __value :null)) (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; bool _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _value
       (if _value (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _value
     (setq _value (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass sentinel_drone_driver::CommandBoolResponse
  :super ros::object
  :slots (_success _result ))

(defmethod sentinel_drone_driver::CommandBoolResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _result (round __result))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; uint8 _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _result
       (write-byte _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _result
     (setq _result (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass sentinel_drone_driver::CommandBool
  :super ros::object
  :slots ())

(setf (get sentinel_drone_driver::CommandBool :md5sum-) "e09abbb4e5bae6b558e5010966eb6e9e")
(setf (get sentinel_drone_driver::CommandBool :datatype-) "sentinel_drone_driver/CommandBool")
(setf (get sentinel_drone_driver::CommandBool :request) sentinel_drone_driver::CommandBoolRequest)
(setf (get sentinel_drone_driver::CommandBool :response) sentinel_drone_driver::CommandBoolResponse)

(defmethod sentinel_drone_driver::CommandBoolRequest
  (:response () (instance sentinel_drone_driver::CommandBoolResponse :init)))

(setf (get sentinel_drone_driver::CommandBoolRequest :md5sum-) "e09abbb4e5bae6b558e5010966eb6e9e")
(setf (get sentinel_drone_driver::CommandBoolRequest :datatype-) "sentinel_drone_driver/CommandBoolRequest")
(setf (get sentinel_drone_driver::CommandBoolRequest :definition-)
      "# Common type for switch commands

bool value
---
bool success
uint8 result


")

(setf (get sentinel_drone_driver::CommandBoolResponse :md5sum-) "e09abbb4e5bae6b558e5010966eb6e9e")
(setf (get sentinel_drone_driver::CommandBoolResponse :datatype-) "sentinel_drone_driver/CommandBoolResponse")
(setf (get sentinel_drone_driver::CommandBoolResponse :definition-)
      "# Common type for switch commands

bool value
---
bool success
uint8 result


")



(provide :sentinel_drone_driver/CommandBool "e09abbb4e5bae6b558e5010966eb6e9e")


