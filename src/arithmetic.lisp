;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; src/arithmetic.lisp

(in-package #:superposition)

(defmethod nullary-+ ((type random-variable))
  0)

(defmethod unary-+ ((v random-variable))
  v)

(defmethod binary-+ ((a number)
                     (b gaussian-random-variable))
  (if (zerop a)
      b
      (make-dependent-gaussian-random-variable (list* b (dependencies b))
                                               (cl:+ a (μ b))
                                               (σ² b))))

(defmethod binary-+ ((a gaussian-random-variable)
                     (b number))
  (binary-+ b a))

(defmethod binary-+ ((a independent-gaussian-random-variable)
                     (b independent-gaussian-random-variable))
  (make-dependent-gaussian-random-variable (list a b)
                                           (cl:+ (μ a) (μ b))
                                           (cl:+ (σ² a) (σ² b))))


(defmethod nullary-* ((type random-variable))
  1)

(defmethod unary-* ((v random-variable))
  v)

(defmethod binary-* ((a number)
                     (b gaussian-random-variable))

  (cond
    ((zerop a)
     0)
    ((= 1 a)
     b)
    (t
     (make-dependent-gaussian-random-variable (list* b (dependencies b))
                                              (cl:* a (μ b))
                                              (cl:* a a (σ² b))))))

(defmethod binary-* ((a gaussian-random-variable)
                     (b number))
  (binary-* b a))

(defmethod binary-* ((a independent-gaussian-random-variable)
                     (b independent-gaussian-random-variable))

  (let ((μ-a (μ a))
        (μ-b (μ b))
        (σ²-a (σ² a))
        (σ²-b (σ² b)))
    (make-dependent-gaussian-random-variable (list a b)
                                             (cl:* μ-a μ-b)
                                             (cl:+ (cl:* σ²-a σ²-b)
                                                   (cl:* (σ² a) μ-b μ-b)
                                                   (cl:* (σ² b) μ-a μ-a)))))
