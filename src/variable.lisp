;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/variable.lisp

(in-package #:superposition)

(defclass random-variable ()
  ())

(defclass gaussian-random-variable (random-variable)
  ((μ :initarg :μ
      :reader μ)
   (σ² :initarg :σ²
        :reader σ²))
  (:default-initargs :μ 0.0 :σ² 1.0))

(defun make-gaussian-random-variable (&optional
                                        (μ 0.0 μ-p)
                                        (σ² 1.0 σ²-p))
  (apply #'make-instance
         'gaussian-random-variable
         (append (when μ-p `(:μ ,μ))
                 (when σ²-p `(:σ² ,σ²)))))
