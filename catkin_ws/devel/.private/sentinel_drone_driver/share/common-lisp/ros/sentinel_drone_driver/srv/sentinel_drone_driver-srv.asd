
(cl:in-package :asdf)

(defsystem "sentinel_drone_driver-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CommandBool" :depends-on ("_package_CommandBool"))
    (:file "_package_CommandBool" :depends-on ("_package"))
  ))