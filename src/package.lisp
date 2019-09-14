;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/package.lisp

(defpackage #:superposition
  (:use #:cl)
  (:shadowing-import-from #:common-lisp/generic-arithmetic
                          #:+
                          #:-
                          #:*
                          #:/)
  ;; statistics.lisp
  (:export #:μ
           #:mean
           #:σ²
           #:variance)
  ;; variable.lisp
  (:export #:random-variable
           #:gaussian-random-variable
           #:make-gaussian-random-variable))
