;; Auto-generated. Do not edit!


(when (boundp 'sentinel_drone_driver::PIDError)
  (if (not (find-package "SENTINEL_DRONE_DRIVER"))
    (make-package "SENTINEL_DRONE_DRIVER"))
  (shadow 'PIDError (find-package "SENTINEL_DRONE_DRIVER")))
(unless (find-package "SENTINEL_DRONE_DRIVER::PIDERROR")
  (make-package "SENTINEL_DRONE_DRIVER::PIDERROR"))

(in-package "ROS")
;;//! \htmlinclude PIDError.msg.html


(defclass sentinel_drone_driver::PIDError
  :super ros::object
  :slots (_roll_error _pitch_error _throttle_error _yaw_error _zero_error ))

(defmethod sentinel_drone_driver::PIDError
  (:init
   (&key
    ((:roll_error __roll_error) 0.0)
    ((:pitch_error __pitch_error) 0.0)
    ((:throttle_error __throttle_error) 0.0)
    ((:yaw_error __yaw_error) 0.0)
    ((:zero_error __zero_error) 0.0)
    )
   (send-super :init)
   (setq _roll_error (float __roll_error))
   (setq _pitch_error (float __pitch_error))
   (setq _throttle_error (float __throttle_error))
   (setq _yaw_error (float __yaw_error))
   (setq _zero_error (float __zero_error))
   self)
  (:roll_error
   (&optional __roll_error)
   (if __roll_error (setq _roll_error __roll_error)) _roll_error)
  (:pitch_error
   (&optional __pitch_error)
   (if __pitch_error (setq _pitch_error __pitch_error)) _pitch_error)
  (:throttle_error
   (&optional __throttle_error)
   (if __throttle_error (setq _throttle_error __throttle_error)) _throttle_error)
  (:yaw_error
   (&optional __yaw_error)
   (if __yaw_error (setq _yaw_error __yaw_error)) _yaw_error)
  (:zero_error
   (&optional __zero_error)
   (if __zero_error (setq _zero_error __zero_error)) _zero_error)
  (:serialization-length
   ()
   (+
    ;; float32 _roll_error
    4
    ;; float32 _pitch_error
    4
    ;; float32 _throttle_error
    4
    ;; float32 _yaw_error
    4
    ;; float32 _zero_error
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _roll_error
       (sys::poke _roll_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch_error
       (sys::poke _pitch_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _throttle_error
       (sys::poke _throttle_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_error
       (sys::poke _yaw_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _zero_error
       (sys::poke _zero_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _roll_error
     (setq _roll_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch_error
     (setq _pitch_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _throttle_error
     (setq _throttle_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_error
     (setq _yaw_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _zero_error
     (setq _zero_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sentinel_drone_driver::PIDError :md5sum-) "965f4467327ee9171cf551616b23b064")
(setf (get sentinel_drone_driver::PIDError :datatype-) "sentinel_drone_driver/PIDError")
(setf (get sentinel_drone_driver::PIDError :definition-)
      "
float32 roll_error
float32 pitch_error
float32 throttle_error
float32 yaw_error

float32 zero_error


")



(provide :sentinel_drone_driver/PIDError "965f4467327ee9171cf551616b23b064")


