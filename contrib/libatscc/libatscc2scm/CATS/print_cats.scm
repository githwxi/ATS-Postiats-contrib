;;
;;;;;;
;
; HX-2016-06:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [print_cats.scm]
;;;;;;
;;

;; ****** ****** ;;
;;
(define-macro
 (ats2scmpre_print_int x) `(display ,x))
;;
(define-macro
 (ats2scmpre_print_char x) `(display ,x))
(define-macro
 (ats2scmpre_print_bool x) `(display (if ,x "true" "false")))
;;
(define-macro
 (ats2scmpre_print_double x) `(display ,x))
(define-macro
 (ats2scmpre_print_string x) `(display ,x))
;;
(define-macro
 (ats2scmpre_print_SCMval x) `(display ,x))
;;
(define-macro (ats2scmpre_print_newline) `(newline))
;;
;; ****** ****** ;;

;; end of [print_cats.scm] ;;
