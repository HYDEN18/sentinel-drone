; Auto-generated. Do not edit!


(cl:in-package sentinel_drone_driver-msg)


;//! \htmlinclude PIDError.msg.html

(cl:defclass <PIDError> (roslisp-msg-protocol:ros-message)
  ((roll_error
    :reader roll_error
    :initarg :roll_error
    :type cl:float
    :initform 0.0)
   (pitch_error
    :reader pitch_error
    :initarg :pitch_error
    :type cl:float
    :initform 0.0)
   (throttle_error
    :reader throttle_error
    :initarg :throttle_error
    :type cl:float
    :initform 0.0)
   (yaw_error
    :reader yaw_error
    :initarg :yaw_error
    :type cl:float
    :initform 0.0)
   (zero_error
    :reader zero_error
    :initarg :zero_error
    :type cl:float
    :initform 0.0))
)

(cl:defclass PIDError (<PIDError>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PIDError>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PIDError)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sentinel_drone_driver-msg:<PIDError> is deprecated: use sentinel_drone_driver-msg:PIDError instead.")))

(cl:ensure-generic-function 'roll_error-val :lambda-list '(m))
(cl:defmethod roll_error-val ((m <PIDError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:roll_error-val is deprecated.  Use sentinel_drone_driver-msg:roll_error instead.")
  (roll_error m))

(cl:ensure-generic-function 'pitch_error-val :lambda-list '(m))
(cl:defmethod pitch_error-val ((m <PIDError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:pitch_error-val is deprecated.  Use sentinel_drone_driver-msg:pitch_error instead.")
  (pitch_error m))

(cl:ensure-generic-function 'throttle_error-val :lambda-list '(m))
(cl:defmethod throttle_error-val ((m <PIDError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:throttle_error-val is deprecated.  Use sentinel_drone_driver-msg:throttle_error instead.")
  (throttle_error m))

(cl:ensure-generic-function 'yaw_error-val :lambda-list '(m))
(cl:defmethod yaw_error-val ((m <PIDError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:yaw_error-val is deprecated.  Use sentinel_drone_driver-msg:yaw_error instead.")
  (yaw_error m))

(cl:ensure-generic-function 'zero_error-val :lambda-list '(m))
(cl:defmethod zero_error-val ((m <PIDError>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sentinel_drone_driver-msg:zero_error-val is deprecated.  Use sentinel_drone_driver-msg:zero_error instead.")
  (zero_error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PIDError>) ostream)
  "Serializes a message object of type '<PIDError>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'throttle_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'zero_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PIDError>) istream)
  "Deserializes a message object of type '<PIDError>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'throttle_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_error) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'zero_error) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PIDError>)))
  "Returns string type for a message object of type '<PIDError>"
  "sentinel_drone_driver/PIDError")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PIDError)))
  "Returns string type for a message object of type 'PIDError"
  "sentinel_drone_driver/PIDError")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PIDError>)))
  "Returns md5sum for a message object of type '<PIDError>"
  "965f4467327ee9171cf551616b23b064")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PIDError)))
  "Returns md5sum for a message object of type 'PIDError"
  "965f4467327ee9171cf551616b23b064")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PIDError>)))
  "Returns full string definition for message of type '<PIDError>"
  (cl:format cl:nil "~%float32 roll_error~%float32 pitch_error~%float32 throttle_error~%float32 yaw_error~%~%float32 zero_error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PIDError)))
  "Returns full string definition for message of type 'PIDError"
  (cl:format cl:nil "~%float32 roll_error~%float32 pitch_error~%float32 throttle_error~%float32 yaw_error~%~%float32 zero_error~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PIDError>))
  (cl:+ 0
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PIDError>))
  "Converts a ROS message object to a list"
  (cl:list 'PIDError
    (cl:cons ':roll_error (roll_error msg))
    (cl:cons ':pitch_error (pitch_error msg))
    (cl:cons ':throttle_error (throttle_error msg))
    (cl:cons ':yaw_error (yaw_error msg))
    (cl:cons ':zero_error (zero_error msg))
))
