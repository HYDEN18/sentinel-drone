; Auto-generated. Do not edit!


(cl:in-package sentinel_drone_driver-msg)


;//! \htmlinclude RCMessage.msg.html

(cl:defclass <RCMessage> (roslisp-msg-protocol:ros-message)
  ((rc_throttle
    :reader rc_throttle
    :initarg :rc_throttle
    :type cl:fixnum
    :initform 0)
   (rc_roll
    :reader rc_roll
    :initarg :rc_roll
    :type cl:fixnum
    :initform 0)
   (rc_pitch
    :reader rc_pitch
    :initarg :rc_pitch
    :type cl:fixnum
    :initform 0)
   (rc_yaw
    :reader rc_yaw
    :initarg :rc_yaw
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RCMessage (<RCMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RCMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RCMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sentinel_drone_driver-msg:<RCMessage> is deprecated: use sentinel_drone_driver-msg:RCMessage instead.")))

(cl:ensure-generic-function 'rc_throttle-val :lambda-list '(m))
(cl:defmethod rc_throttle-val ((m <RCMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:rc_throttle-val is deprecated.  Use sentinel_drone_driver-msg:rc_throttle instead.")
  (rc_throttle m))

(cl:ensure-generic-function 'rc_roll-val :lambda-list '(m))
(cl:defmethod rc_roll-val ((m <RCMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:rc_roll-val is deprecated.  Use sentinel_drone_driver-msg:rc_roll instead.")
  (rc_roll m))

(cl:ensure-generic-function 'rc_pitch-val :lambda-list '(m))
(cl:defmethod rc_pitch-val ((m <RCMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:rc_pitch-val is deprecated.  Use sentinel_drone_driver-msg:rc_pitch instead.")
  (rc_pitch m))

(cl:ensure-generic-function 'rc_yaw-val :lambda-list '(m))
(cl:defmethod rc_yaw-val ((m <RCMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:rc_yaw-val is deprecated.  Use sentinel_drone_driver-msg:rc_yaw instead.")
  (rc_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RCMessage>) ostream)
  "Serializes a message object of type '<RCMessage>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_throttle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_throttle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_roll)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_roll)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_pitch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_pitch)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_yaw)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_yaw)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RCMessage>) istream)
  "Deserializes a message object of type '<RCMessage>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_throttle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_throttle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_roll)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_roll)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_pitch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_pitch)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rc_yaw)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rc_yaw)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RCMessage>)))
  "Returns string type for a message object of type '<RCMessage>"
  "sentinel_drone_driver/RCMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RCMessage)))
  "Returns string type for a message object of type 'RCMessage"
  "sentinel_drone_driver/RCMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RCMessage>)))
  "Returns md5sum for a message object of type '<RCMessage>"
  "41f534868ff2103b914923c89e4aa7e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RCMessage)))
  "Returns md5sum for a message object of type 'RCMessage"
  "41f534868ff2103b914923c89e4aa7e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RCMessage>)))
  "Returns full string definition for message of type '<RCMessage>"
  (cl:format cl:nil "~%uint16 rc_throttle~%uint16 rc_roll~%uint16 rc_pitch~%uint16 rc_yaw~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RCMessage)))
  "Returns full string definition for message of type 'RCMessage"
  (cl:format cl:nil "~%uint16 rc_throttle~%uint16 rc_roll~%uint16 rc_pitch~%uint16 rc_yaw~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RCMessage>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RCMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'RCMessage
    (cl:cons ':rc_throttle (rc_throttle msg))
    (cl:cons ':rc_roll (rc_roll msg))
    (cl:cons ':rc_pitch (rc_pitch msg))
    (cl:cons ':rc_yaw (rc_yaw msg))
))
