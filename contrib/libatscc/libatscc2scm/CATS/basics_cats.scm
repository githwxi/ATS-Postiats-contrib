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

(define atscc2scm_null '())

;; ****** ****** ;;

(define atscc2scm_true #t)
(define atscc2scm_false #f)

;; ****** ****** ;;
;;
(define ATSINSmove0_void atscc2scm_null)
;;
(define-macro (ATSINSmove1_void cmd) cmd)
;;
;; ****** ****** ;;

(define-macro (ATSfunclo_fun fc) fc)
(define-macro (ATSfunclo_fclo fc) `(car ,fc))

;; ****** ****** ;;

(define-macro (ATSCKiseqz x) `(= ,x 0))
(define-macro (ATSCKisneqz x) `(not (= ,x 0)))

;; ****** ****** ;;
;;
(define-macro (ATSCKpat_int x y) `(= ,x ,y))
;;
(define-macro (ATSCKpat_bool x y) `(eqv? ,x ,y))
;;
(define-macro (ATSCKpat_string x y) `(eqv? ,x ,y))
;;
;; ****** ****** ;;
;;
(define-macro (ATSCKpat_con0 x tag) `(= ,x ,tag))
(define-macro (ATSCKpat_con1 x tag) `(= (car ,x) ,tag))
;;
;; ****** ****** ;;

(define-macro (ATSCKptrisnull x) `(eqv? ,x atscc2scm_null))
(define-macro (ATSCKptriscons x) `(not (eqv? ,x atscc2scm_null)))

;; ****** ****** ;;
;;
(define-macro (ATSCCget_0 xs) `(car ,xs))
(define-macro (ATSCCget_1 xs) `(car (cdr ,xs)))
(define-macro (ATSCCget_2 xs) `(car (cdr (cdr ,xs))))
(define-macro (ATSCCget_3 xs) `(car (cdr (cdr (cdr ,xs)))))
;;
(define-macro (ATSCCget_at xs n) `(list-ref ,xs ,n))
;;
(define-macro (ATSCCset_0 xs x0) `(set-car! ,xs ,x0))
(define-macro (ATSCCset_1 xs x0) `(set-car! (cdr ,xs) ,x0))
(define-macro (ATSCCset_2 xs x0) `(set-car! (cdr (cdr ,xs)) ,x0))
(define-macro (ATSCCset_3 xs x0) `(set-car! (cdr (cdr (cdr ,xs))) ,x0))
;;
;; ****** ****** ;;
;;
(define-syntax
 ATSPMVtyrec (syntax-rules () ((_ . xs) (list . xs))))
(define-syntax
 ATSPMVtysum (syntax-rules () ((_ . xs) (list . xs))))
;;
;; ****** ****** ;;
;;
(define-macro
 (ATSPMVlazyval thunk) `(list 0 ,thunk))
;;
(define
 (ATSPMVlazyval_eval lazyval)
 (let ((flag (ATSCCget_0 lazyval)))
   (if (= flag 0)
     (begin
      (ATSCCset_0 lazyval 1)
      (let ((thunk (ATSCCget_1 lazyval)))
        (ATSCCset_1 lazyval ((ATSCCget_0 thunk) thunk)))
     )
     (begin
      (ATSCCset_0 lazyval (+ flag 1))
     )
   ) ;; if
 ) ;; let
) ;; define
;;
(define-macro
 (ATSPMVlazyval_eval2 lazyval)
 `(begin
   (ATSPMVlazyval_eval ,lazyval) (ATSCCget_1 ,lazyval)
  )
)
;;
;; ****** ****** ;;

(define-macro (ATSSELcon xs i) `(ATSCCget_at ,xs ,i))
(define-macro (ATSSELboxrec xs i) `(ATSCCget_at ,xs ,i))

;; ****** ****** ;;
;;
(define (ATSINSdeadcode_fail) (exit 1))
;;
(define
 (ATSINScaseof_fail errmsg) (display errmsg) (exit 1))
;;
;; ****** ****** ;;

;;;;;; end of [basics_cats.scm] ;;;;;;
