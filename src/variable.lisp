;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/variable.lisp

(in-package #:superposition)

(defclass random-variable ()
  ())

(defun random-variable-p (x)
  (typep x 'random-variable))

(defgeneric dependencies (x)
  (:method (x)
    (declare (ignore x))
    nil))

(defclass dependent-random-variable ()
  ((dependencies :initarg :dependencies
                 :reader dependencies))
  (:default-initargs :dependencies (error "Must specify dependencies")))

(defclass gaussian-mixin ()
  ((μ :initarg :μ
      :reader μ)
   (σ² :initarg :σ²
        :reader σ²))
  (:default-initargs :μ 0.0 :σ² 1.0))

(defclass gaussian-random-variable (gaussian-mixin random-variable)
  ())

(defclass dependent-gaussian-random-variable (gaussian-mixin
                                              dependent-random-variable)
  ())

(defun make-gaussian-random-variable (&optional
                                        (μ 0.0 μ-p)
                                        (σ² 1.0 σ²-p))
  (apply #'make-instance
         'gaussian-random-variable
         (append (when μ-p `(:μ ,μ))
                 (when σ²-p `(:σ² ,σ²)))))

(defun make-dependent-gaussian-random-variable (dependencies
                                                &optional
                                                  (μ 0.0 μ-p)
                                                  (σ² 1.0 σ²-p))
  (check-type dependencies (and list (not null)))
  (assert (every #'random-variable-p dependencies))
  (apply #'make-instance
         'dependent-gaussian-random-variable
         :dependencies (remove-duplicates dependencies
                                          :test #'eql)
         (append (when μ-p `(:μ ,μ))
                 (when σ²-p `(:σ² ,σ²)))))
