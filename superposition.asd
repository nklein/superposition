;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; superposition.asd

(asdf:defsystem #:superposition
  :description "Superposition -- probabilistic position calculations"
  :author "Patrick Stein <pat@nklein.com>"
  :version "0.1.20190913"
  :license "UNLICENSE"
  :depends-on (#:cl-generic-arithmetic)
  :in-order-to ((asdf:test-op (asdf:test-op :superposition-test)))
  :components ((:static-file "README.md")
               (:static-file "UNLICENSE.txt")
               (:module "src"
                :components ((:file "package")
                             (:file "statistics" :depends-on ("package"))
                             (:file "variable" :depends-on ("package"
                                                            "statistics"))))))
