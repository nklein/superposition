;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; test/variable.lisp

(in-package #:superposition-test)

(nst:def-test-group variable-tests ()
  (nst:def-test can-create-gaussian-random-variable (:not :err)
    (make-gaussian-random-variable 0.0 1.0))

  (nst:def-test can-create-default-gaussian-random-variable (:values
                                                             (:equal 0.0)
                                                             (:equal 1.0))
    (let ((v (make-gaussian-random-variable)))
      (values (μ v)
              (σ² v)))))
