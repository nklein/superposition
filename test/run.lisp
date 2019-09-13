;;;; -*- mode: Common-Lisp; Syntax: ANSI-Common-Lisp -*-
;;;; test/run.lisp

(in-package #:superposition-test)

(defun run-all-tests ()
  (let ((*print-pretty* t))
    (nst:nst-cmd :run-package #.*package*)))
