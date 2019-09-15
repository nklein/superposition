;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; test/statistics.lisp

(in-package #:superposition-test)

(nst:def-test-group statistics-tests ()
  (nst:def-test mean-of-number-is-the-number (:values
                                              (:equal 3)
                                              (:equal 3))
    (values (μ 3)
            (mean 3)))

  (nst:def-test variance-of-number-is-zero (:values
                                            (:equal 0)
                                            (:equal 0))
    (values (σ² 3)
            (variance 3))))
