;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; test/package.lisp

(defpackage #:superposition-test
  (:use #:cl #:superposition)
  (:shadowing-import-from #:common-lisp/generic-arithmetic
                          #:+
                          #:-
                          #:*
                          #:/)
  (:export :run-all-tests))
