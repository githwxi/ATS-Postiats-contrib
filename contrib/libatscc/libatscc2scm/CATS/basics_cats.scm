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

(define-macro (ATSCKpat_int x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_bool x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_string x y) `(eqv? ,x ,y))

;;;;;; end of [basics_cats.scm] ;;;;;;
