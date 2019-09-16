;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/package.lisp

(defpackage #:superposition
  (:use #:cl)
  (:shadowing-import-from #:common-lisp/generic-arithmetic
                          #:+
                          #:-
                          #:*
                          #:/)
  (:import-from #:common-lisp/generic-arithmetic
                #:nullary-+ #:unary-+ #:binary-+
                #:nullary-* #:unary-* #:binary-*)
  ;; statistics.lisp
  (:export #:μ
           #:mean
           #:σ²
           #:variance)
  ;; variable.lisp
  (:export #:random-variable
           #:random-variable-p
           #:gaussian-random-variable
           #:make-gaussian-random-variable))
