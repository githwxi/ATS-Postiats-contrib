;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;

;; ****** ****** ;;

(def ^:const atscc2clj_null '())

;; ****** ****** ;;

(def ^:const atscc2clj_true true)
(def ^:const atscc2clj_false false)

;; ****** ****** ;;
;;
(def ^:const
 ATSINSmove0_void atscc2clj_null)
;;
(defmacro ATSINSmove1_void[cmd] `(do ~cmd))
;;
;; ****** ****** ;;
;;
(defmacro ATSfunclo_fun[fc] fc)
(defmacro ATSfunclo_fclo[fc] `(first ~fc))
;;
;; ****** ****** ;;

(defmacro ATSCKiseqz[x] `(identical? ~x 0))
(defmacro ATSCKisneqz[x] `(not (identical? ~x 0)))

;; ****** ****** ;;
;;
(defmacro
 ATSCKpat_int[x y] `(identical? ~x ~y)
)
;;
(defmacro
 ATSCKpat_bool[x y] `(identical? ~x ~y)
)
;;
(defmacro ATSCKpat_string[x y] `(= ~x ~y))
;;
;; ****** ****** ;;
;;
(defmacro
 ATSCKpat_con0[x tag] `(identical? ~x ~tag))
(defmacro
 ATSCKpat_con1[x tag] `(identical? (first ~x) ~tag))
;;
;; ****** ****** ;;

(defmacro
 ATSCKptrisnull[x] `(identical? ~x atscc2clj_null))
(defmacro
 ATSCKptriscons[x] `(not (indentical? ~x atscc2clj_null)))

;; ****** ****** ;;
;;
(defmacro
 ATSSELcon[xs i] `(ATSCCget_at ~xs ~i)
)
(defmacro
 ATSSELboxrec[xs i] `(ATSCCget_at ~xs ~i)
)
;;
;; ****** ****** ;;
;;
(defn
 ATSINSdeadcode_fail[] (System/exit 1)
)
;;
(defn
 ATSINScaseof_fail[msg]
 (do (.println *err* msg) (System/exit 1))
) ;; end-of-define
;;
;; ****** ****** ;;
;;
(defn
 ats2cljpre_assert_bool0[tfv] (if (not tfv) (System/exit 1))
)
(defn
 ats2cljpre_assert_bool1[tfv] (if (not tfv) (System/exit 1))
)
;;
(defn
 ats2cljpre_assert_errmsg_bool0[msg tfv]
 (if (not tfv)
   (do (.println *err* msg) (System/exit 1))
 )
) ;; end-of-define
(defn
 ats2cljpre_assert_errmsg_bool1[msg tfv]
 (if (not tfv)
   (do (.println *err* msg) (System/exit 1))
 )
) ;; end-of-define
;;
;; ****** ****** ;;

;;;;;; end of [basics_cats.clj] ;;;;;;
