;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;
;; For some implementations of scheme,
;; we may have to map [define-macro] to [defmacro]
;;
;; (defmacro (define-macro x y) `(defmacro ,x ,y))
;;
;;;;;;

;; ****** ****** ;;

(define atscc2scm_void '())

;; ****** ****** ;;

(define atscc2scm_true #t)
(define atscc2scm_false #f)

;; ****** ****** ;;

(define-macro (ATSINmove1_void cmd) cmd)

;; ****** ****** ;;

(define-macro (ATSCKpat_int x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_bool x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_string x y) `(eqv? ,x ,y))

;; ****** ****** ;;

;;;;;; end of [basics_cats.scm] ;;;;;;
