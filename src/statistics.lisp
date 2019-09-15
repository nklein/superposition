;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/statistics.lisp

(in-package #:superposition)

(defgeneric μ (x)
  (:method ((x number))
    x))

(declaim (inline mean))
(defun mean (x)
  (μ x))

(defgeneric σ² (x)
  (:method ((x number))
    0))

(declaim (inline variance))
(defun variance (x)
  (σ² x))
