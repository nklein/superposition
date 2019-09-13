;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/package.lisp

(defpackage #:superposition
  (:use #:cl)
  (:shadowing-import-from #:common-lisp/generic-arithmetic
                          #:+
                          #:-
                          #:*
                          #:/))
