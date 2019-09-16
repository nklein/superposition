;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/arithmetic.lisp

(in-package #:superposition)

(defmethod nullary-+ ((type gaussian-random-variable))
  0)

(defmethod unary-+ ((v gaussian-random-variable))
  v)

(defmethod binary-+ ((a number)
                     (b gaussian-random-variable))
  (if (zerop a)
      b
      (make-dependent-gaussian-random-variable (list b)
                                               (cl:+ a (μ b))
                                               (σ² b))))

(defmethod binary-+ ((a gaussian-random-variable)
                     (b number))
  (binary-+ b a))

(defmethod binary-+ ((a gaussian-random-variable)
                     (b gaussian-random-variable))
  (make-dependent-gaussian-random-variable (list a b)
                                           (cl:+ (μ a) (μ b))
                                           (cl:+ (σ² a) (σ² b))))
