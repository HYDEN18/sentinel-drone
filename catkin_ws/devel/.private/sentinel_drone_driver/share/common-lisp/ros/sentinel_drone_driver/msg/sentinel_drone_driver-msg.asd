
(cl:in-package :asdf)

(defsystem "sentinel_drone_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PIDError" :depends-on ("_package_PIDError"))
    (:file "_package_PIDError" :depends-on ("_package"))
    (:file "RCMessage" :depends-on ("_package_RCMessage"))
    (:file "_package_RCMessage" :depends-on ("_package"))
  ))