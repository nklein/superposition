;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; test/arithmetic.lisp

(in-package #:superposition-test)

(nst:def-test-group arithmetic-tests ()
  (nst:def-test can-add-independent-gaussians (:values (:equal 3.0)
                                                       (:equal 5.0))
    (let* ((a (make-gaussian-random-variable 1.0 2.0))
           (b (make-gaussian-random-variable 2.0 3.0))
           (c (+ a b)))
      (values (μ c)
              (σ² c)))))
