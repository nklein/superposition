;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/arithmetic.lisp

(in-package #:superposition)

(defmethod nullary-+ ((type gaussian-random-variable))
  0)

(defmethod unary-+ ((v gaussian-random-variable))
  v)

(defmethod binary-+ ((a number)
                     (b gaussian-random-variable))
  (assert (zerop a))
  b)

(defmethod binary-+ ((a gaussian-random-variable)
                     (b gaussian-random-variable))
  (make-dependent-gaussian-random-variable (list a b)
                                           (+ (μ a) (μ b))
                                           (+ (σ² a) (σ² b))))
