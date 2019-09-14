;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; superposition-test.asd

(asdf:defsystem #:superposition-test
  :description "Tests for the Superposition package."
  :author "Patrick Stein <pat@nklein.com>"
  :version "0.1.20190913"
  :license "UNLICENSE"
  :depends-on ((:version #:superposition "0.1.20190913")
               #:nst)
  :perform (asdf:test-op (o c)
             (uiop:symbol-call :superposition-test :run-all-tests))
  :components ((:module "test"
                :components ((:file "package")
                             (:file "statistics" :depends-on ("package"))
                             (:file "variable" :depends-on ("package"))
                             (:file "run" :depends-on ("package"))))))
