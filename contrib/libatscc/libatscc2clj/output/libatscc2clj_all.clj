-en
-en ;;\n
-en ;; Time of Generation:\n
-en ;; 
Sun Dec 25 17:42:41 EST 2016
-en ;;\n\n
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
(def ^:const atscc2clj_list_nil '())
;;
(defmacro
 ats2cljpre_list_cons[x xs] `(vector ~x ~xs))
;;
;; ****** ****** ;;
;;
(def ^:const
 ATSINSmove0_void atscc2clj_null)
;;
(defmacro ATSINSmove1_void[cmd] `(do ~cmd))
;;
;; ****** ****** ;;
;;
(defmacro
 ATSINStmpset[tmp val] `(var-set ~tmp ~val)
)
(defmacro
 ATSINSstatmpset[statmp val]
`(alter-var-root (var ~statmp) (fn[x#] ~val))
)
;;
(defmacro
 ATSdynloadset[flag value]
`(alter-var-root (var ~flag) (fn[x#] ~value))
)
(defmacro
 ATSINSdyncst_valbind[d2cst value]
`(alter-var-root (var ~d2cst) (fn[x#] ~value))
)
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
 ATSCKptrisnull[x]
`(identical? ~x atscc2clj_null)
)
(defmacro
 ATSCKptriscons[x]
`(not (identical? ~x atscc2clj_null))
)

;; ****** ****** ;;

(defmacro
 ATSPMVtyrec[& xs]
`(vector ~@(for [x xs] x))
)
(defmacro
 ATSPMVtysum[& xs]
`(vector ~@(for [x xs] x))
)

;; ****** ****** ;;

(defmacro
 ATSCCget_at[xs i] `(nth ~xs ~i)
)

(defmacro ATSCCget_0[xs] `(nth ~xs 0))
(defmacro ATSCCget_1[xs] `(nth ~xs 1))
(defmacro ATSCCget_2[xs] `(nth ~xs 2))
(defmacro ATSCCget_3[xs] `(nth ~xs 3))

;; ****** ****** ;;
;;
(defmacro
 ATSPMVlazyval[thunk]
`(vector (atom 0) (atom ~thunk))
)
;;
(defmacro
 ATSPMVlazyval_evl[lazyval]
`(let
  [flag# (
    ATSCCget_0 ~lazyval
   ) flag2# (deref flag#)
  ]
  (if (
    identical? flag2# 0
   ) (do
      (reset! flag# 1)
      (let [
        mythunk#
        (ATSCCget_1 ~lazyval)
        mythunk2# (deref mythunk#)
       ] (
        reset! mythunk#
          ((ATSCCget_0 mythunk2#) mythunk2#)
        ;; end of [reset!]
       )
      ) ;; end of [let]
   ) (reset! flag# (inc flag2#))
  )
 ) ;; let
) ;; end of [defmacro]
;;
(defmacro
 ATSPMVlazyval_eval[lazyval]
`(let [lazyval# ~lazyval]
   (ATSPMVlazyval_evl lazyval#) (deref (ATSCCget_1 lazyval#))
 )
) ;; end of [defmacro]
;;
;; ****** ****** ;;
;;
(defmacro
 ATSPMVllazyval[thunk] thunk
)
;;
(defmacro
 ATSPMVllazyval_eval[llazyval]
`(let [llazyval# ~llazyval]
   ((ATSfunclo_fclo llazyval#) llazyval# true))
) ;; end of [defmacro]
;;
(defmacro
 atspre_lazy_vt_free[llazyval]
`(let [llazyval# ~llazyval]
   ((ATSfunclo_fclo llazyval#) llazyval# false))
) ;; end of [defmacro]
;;
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
(defn ats2cljpre_tostring[x] (.toString x))
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

(defmacro
 ats2cljpre_cloref0_app[cf]
`(let [cf# ~cf] ((ATSfunclo_fclo cf#) cf#))
) ; defmacro
(defmacro
 ats2cljpre_cloref1_app[cf x]
`(let [cf# ~cf] ((ATSfunclo_fclo cf#) cf# ~x))
) ; defmacro
(defmacro
 ats2cljpre_cloref2_app[cf x1 x2]
`(let [cf# ~cf] ((ATSfunclo_fclo cf#) cf# ~x1 ~x2))
) ; defmacro
(defmacro
 ats2cljpre_cloref3_app[cf x1 x2 x3]
`(let [cf# ~cf] ((ATSfunclo_fclo cf#) cf# ~x1 ~x2 ~x3))
) ; defmacro

;; ****** ****** ;;
;;
(defn
 ats2cljpre_cloref2fun0[cf]
 (fn [] (ats2cljpre_cloref0_app cf))
) ; defn
(defn
 ats2cljpre_cloref2fun1[cf]
 (fn [x] (ats2cljpre_cloref1_app cf x))
) ; defn
(defn
 ats2cljpre_cloref2fun2[cf]
 (fn [x1 x2] (ats2cljpre_cloref2_app cf x1 x2))
) ; defn
(defn
 ats2cljpre_cloref2fun3[cf]
 (fn [x1 x2 x3] (ats2cljpre_cloref3_app cf x1 x2 x3))
) ; defn
;;
;; ****** ****** ;;

(defmacro
 ats2cljpre_lazy2cloref[lazyval] `(deref (ATSCCget_1 ~lazyval))
) ;; end-of-define

;; ****** ****** ;;

;;;;;; end of [basics_cats.clj] ;;;;;;
;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [integer_cats.clj]
;;;;;;
;;

;; ****** ****** ;;
;;
;; HX: for signed integers
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_neg_int0[x] `(- ~x)
)
(defmacro
 ats2cljpre_neg_int1[x] `(- ~x)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_abs_int0[x]
`(let [x# ~x] (if (>= x# 0) x# (- x#)))
)
(defmacro
 ats2cljpre_abs_int1[x]
`(let [x# ~x] (if (>= x# 0) x# (- x#)))
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_succ_int0[x] `(+ ~x 1)
)
(defmacro
 ats2cljpre_pred_int0[x] `(- ~x 1)
)
;;
(defmacro
 ats2cljpre_succ_int1[x] `(+ ~x 1)
)
(defmacro
 ats2cljpre_pred_int1[x] `(- ~x 1)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_add_int0_int0[x y] `(+ ~x ~y)
)
(defmacro
 ats2cljpre_sub_int0_int0[x y] `(- ~x ~y)
)
(defmacro
 ats2cljpre_mul_int0_int0[x y] `(* ~x ~y)
)
(defmacro
 ats2cljpre_div_int0_int0[x y] `(quot ~x ~y)
)
;;
(defmacro
 ats2cljpre_mod_int0_int0[x y] `(mod ~x ~y)
)
(defmacro
 ats2cljpre_rem_int0_int0[x y] `(rem ~x ~y)
)
;;
(defmacro
 ats2cljpre_add_int1_int1[x y] `(+ ~x ~y)
)
(defmacro
 ats2cljpre_sub_int1_int1[x y] `(- ~x ~y)
)
(defmacro
 ats2cljpre_mul_int1_int1[x y] `(* ~x ~y)
)
(defmacro
 ats2cljpre_div_int1_int1[x y] `(quot ~x ~y)
)
;;
(defmacro
 ats2cljpre_mod_int1_int1[x y] `(mod ~x ~y)
)
(defmacro
 ats2cljpre_nmod_int1_int1[x y] `(mod ~x ~y)
)
;;
(defmacro
 ats2cljpre_rem_int1_int1[x y] `(rem ~x ~y)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_lt_int0_int0[x y] `(< ~x ~y)
)
(defmacro
 ats2cljpre_lte_int0_int0[x y] `(<= ~x ~y)
)
(defmacro
 ats2cljpre_gt_int0_int0[x y] `(> ~x ~y)
)
(defmacro
 ats2cljpre_gte_int0_int0[x y] `(>= ~x ~y)
)
;;
(defmacro
 ats2cljpre_eq_int0_int0[x y] `(= ~x ~y)
)
(defmacro
 ats2cljpre_neq_int0_int0[x y] `(not (= ~x ~y))
)
;;
;;
(defmacro
 ats2cljpre_lt_int1_int1[x y] `(< ~x ~y)
)
(defmacro
 ats2cljpre_lte_int1_int1[x y] `(<= ~x ~y)
)
(defmacro
 ats2cljpre_gt_int1_int1[x y] `(> ~x ~y)
)
(defmacro
 ats2cljpre_gte_int1_int1[x y] `(>= ~x ~y)
)
;;
(defmacro
 ats2cljpre_eq_int1_int1[x y] `(= ~x ~y)
)
(defmacro
 ats2cljpre_neq_int1_int1[x y] `(not (= ~x ~y))
)
;;
;; ****** ****** ;;

;; end of [integer_cats.clj] ;;
;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [bool_cats.clj]
;;;;;;
;;

;; ****** ****** ;;

(defmacro
 ats2cljpre_neg_bool0[x] `(not ~x)
)
(defmacro
 ats2cljpre_neg_bool1[x] `(not ~x)
)

;; ****** ****** ;;

;; end of [bool_cats.clj] ;;
;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [float_cats.clj]
;;;;;;
;;

;; ****** ****** ;;
;;
;; HX: for signed floats
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_int2double[x] x)
(defmacro
 ats2cljpre_double_of_int[x] x)
;;
(defmacro
 ats2cljpre_double2int[x] `(int ~x))
(defmacro
 ats2cljpre_int_of_double[x] `(int ~x))
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_neg_double[x] `(- ~x)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_abs_double[x]
`(let [x# ~x] (if (>= x# 0.0) x# (- x#)))
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_succ_double[x] `(+ ~x 1)
)
(defmacro
 ats2cljpre_pred_double[x] `(- ~x 1)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_add_int_double[x y] `(+ ~x ~y)
)
(defmacro
 ats2cljpre_sub_int_double[x y] `(- ~x ~y)
)
(defmacro
 ats2cljpre_mul_int_double[x y] `(* ~x ~y)
)
(defmacro
 ats2cljpre_div_int_double[x y] `(/ ~x ~y)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_add_double_int[x y] `(+ ~x ~y)
)
(defmacro
 ats2cljpre_sub_double_int[x y] `(- ~x ~y)
)
(defmacro
 ats2cljpre_mul_double_int[x y] `(* ~x ~y)
)
(defmacro
 ats2cljpre_div_double_int[x y] `(/ ~x ~y)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_add_double_double[x y] `(+ ~x ~y)
)
(defmacro
 ats2cljpre_sub_double_double[x y] `(- ~x ~y)
)
(defmacro
 ats2cljpre_mul_double_double[x y] `(* ~x ~y)
)
(defmacro
 ats2cljpre_div_double_double[x y] `(/ ~x ~y)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_lt_double_double[x y] `(< ~x ~y)
)
(defmacro
 ats2cljpre_lte_double_double[x y] `(<= ~x ~y)
)
(defmacro
 ats2cljpre_gt_double_double[x y] `(> ~x ~y)
)
(defmacro
 ats2cljpre_gte_double_double[x y] `(>= ~x ~y)
)
;;
(defmacro
 ats2cljpre_eq_double_double[x y] `(= ~x ~y)
)
(defmacro
 ats2cljpre_neq_double_double[x y] `(not (= ~x ~y))
)
;;
;; ****** ****** ;;

;; end of [float_cats.clj] ;;
;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [print_cats.clj]
;;;;;;
;;

;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_print_int[x] `(print ~x)
)
;;
(defmacro
 ats2cljpre_print_bool[x]
`(print (if ~x "true" "false"))
)
(defmacro
 ats2cljpre_print_char[x] `(print ~x))
;;
(defmacro
 ats2cljpre_print_double[x] `(print ~x)
)
(defmacro
 ats2cljpre_print_string[x] `(print ~x)
)
;;
(defmacro
 ats2cljpre_print_CLJval[x] `(print ~x)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_print_newline[] `(newline)
)
;;
;; ****** ****** ;;

;;
(defmacro
 ats2cljpre_fprint_bool[out x]
`(.write ~out (if ~x "true" "false"))
)
(defmacro
 ats2cljpre_fprint_char[out x] `(.write ~out (int ~x))
)
;;
(defmacro
 ats2cljpre_fprint_int[out x] `(.write ~out (.toString ~x))
)
;;
(defmacro
 ats2cljpre_fprint_double[out x] `(.write ~out (.toString ~x))
)
(defmacro
 ats2cljpre_fprint_string[out x] `(.write ~out (.toString ~x))
)
(defmacro
 ats2cljpre_fprint_CLJval[out x] `(.write ~out (.toString ~x))
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_fprint_newline[out]
`(let [out# ~out] (do (.write out# (int \newline)) (.flush out#)))
)
;;
;; ****** ****** ;;

;; end of [print_cats.clj] ;;
;;
;;;;;;
;
; HX-2016-07:
; for Clojure code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [reference_cats.clj]
;;;;;;
;;

;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_ref[x] `(atom ~x)
)
(defmacro
 ats2cljpre_ref_make_elt[x] `(atom ~x)
)
;;
;; ****** ****** ;;
;;
(defmacro
 ats2cljpre_ref_get_elt[r] `(deref ~r)
)
(defmacro
 ats2cljpre_ref_set_elt[r x0] `(reset! ~r ~x0)
)
;;
;; ****** ****** ;;

;; end of [reference_cats.clj] ;;
;;;;;;
;
; HX-2016-07:
; for Clojure code translated from ATS
;
;;;;;;

;;;;;;
;beg of [filebas_cats.clj]
;;;;;;
;;
(defmacro ats2cljpre_stdin_get[] *in*)
(defmacro ats2cljpre_stdout_get[] *out*)
(defmacro ats2cljpre_stderr_get[] *err*)
;;
;;;;;;
;;;;;; end of [filebas_cats.clj] ;;;;;;
;;;;;;
;
; HX-2016-07:
; for Clojure code translated from ATS
;
;;;;;;

;;;;;;
; beg of [CLJlist_cats.clj]
;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 ats2cljpre_CLJlist_nil[] `())
(defmacro
 ats2cljpre_CLJlist_sing[x] `(list ~x))
(defmacro
 ats2cljpre_CLJlist_pair[x1 x2] `(list ~x1 ~x2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 ats2cljpre_CLJlist_cons[x0 xs] `(cons ~x0 ~xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 ats2cljpre_CLJlist_make_elt[n x0] `(repeat ~n ~x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 ats2cljpre_CLJlist_is_nil[xs] `(empty? ~xs))
(defmacro
 ats2cljpre_CLJlist_is_cons[xs] `(not (empty? ~xs)))
(defmacro
 ats2cljpre_CLJlist_isnot_nil[xs] `(not (empty? ~xs)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 ats2cljpre_CLJlist_length[xs] `(count ~xs)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro ats2cljpre_CLJlist_tail[xs] `(rest ~xs))
(defmacro ats2cljpre_CLJlist_head[xs] `(first ~xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 ats2cljpre_CLJlist_get_at[xs i] `(nth ~xs ~i)
) ; defmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 ats2cljpre_CLJlist_append[xs ys] `(concat ~xs ~ys)
)
;;
(defmacro ats2cljpre_CLJlist_reverse[xs] `(reverse ~xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 ats2cljpre_CLJlist2list_rev[xs]
`(reduce #(ats2cljpre_list_cons %2 %1) atscc2clj_null ~xs)
) ; defmacro
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 ats2cljpre_CLJlist_sort_2[xs cmp]
`(let [cmp# (ats2cljpre_cloref2fun2 ~cmp)] (sort cmp# ~xs))
) ; defmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; end of [CLJlist_cats.clj] ;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_list_loop1_4)
(declare _ats2cljpre_list_loop2_5)
(declare _ats2cljpre_list_loop_12)
(declare _ats2cljpre_list_loop_20)
(declare _ats2cljpre_list_auxlst_22)
(declare _ats2cljpre_list_patsfun_31)
(declare _ats2cljpre_list_loop_33)
(declare _ats2cljpre_list_patsfun_35)
(declare _ats2cljpre_list_patsfun_38)
(declare _ats2cljpre_list_loop_40)
(declare _ats2cljpre_list_patsfun_42)
(declare _ats2cljpre_list_patsfun_46)
(declare _ats2cljpre_list_aux_48)
(declare _ats2cljpre_list_patsfun_50)
(declare _ats2cljpre_list_patsfun_53)
(declare _ats2cljpre_list_aux_55)
(declare _ats2cljpre_list_patsfun_57)
(declare _ats2cljpre_list_aux_59)
(declare _ats2cljpre_list_patsfun_61)
(declare _ats2cljpre_list_loop_63)
(declare _ats2cljpre_list_patsfun_65)
(declare _ats2cljpre_list_loop_67)
(declare _ats2cljpre_list_patsfun_69)
(declare _ats2cljpre_list_aux_71)
(declare _ats2cljpre_list_patsfun_73)
(declare _ats2cljpre_list_aux_75)
(declare _ats2cljpre_list_patsfun_77)
(declare _ats2cljpre_list_auxmain_81)
(declare _ats2cljpre_list_patsfun_82)
(declare _ats2cljpre_list_auxmain_84)
(declare _ats2cljpre_list_patsfun_85)
(declare _ats2cljpre_list_auxone_87)
(declare _ats2cljpre_list_patsfun_88)
(declare _ats2cljpre_list_auxmain_89)
(declare _ats2cljpre_list_patsfun_90)
(declare _ats2cljpre_list_aux_99)
(declare _ats2cljpre_list_patsfun_101)
(declare ats2cljpre_list_make_intrange_2)
(declare ats2cljpre_list_make_intrange_3)
(declare _ats2cljpre_list_loop1_4)
(declare _ats2cljpre_list_loop2_5)
(declare ats2cljpre_list_length)
(declare _ats2cljpre_list_loop_12)
(declare ats2cljpre_list_last)
(declare ats2cljpre_list_get_at)
(declare ats2cljpre_list_snoc)
(declare ats2cljpre_list_extend)
(declare ats2cljpre_list_append)
(declare ats2cljpre_list_reverse)
(declare ats2cljpre_list_reverse_append)
(declare _ats2cljpre_list_loop_20)
(declare ats2cljpre_list_concat)
(declare _ats2cljpre_list_auxlst_22)
(declare ats2cljpre_list_take)
(declare ats2cljpre_list_drop)
(declare ats2cljpre_list_split_at)
(declare ats2cljpre_list_insert_at)
(declare ats2cljpre_list_remove_at)
(declare ats2cljpre_list_takeout_at)
(declare ats2cljpre_list_exists)
(declare ats2cljpre_list_exists_method)
(declare _ats2cljpre_list_patsfun_31)
(declare ats2cljpre_list_iexists)
(declare _ats2cljpre_list_loop_33)
(declare ats2cljpre_list_iexists_method)
(declare _ats2cljpre_list_patsfun_35)
(declare ats2cljpre_list_forall)
(declare ats2cljpre_list_forall_method)
(declare _ats2cljpre_list_patsfun_38)
(declare ats2cljpre_list_iforall)
(declare _ats2cljpre_list_loop_40)
(declare ats2cljpre_list_iforall_method)
(declare _ats2cljpre_list_patsfun_42)
(declare ats2cljpre_list_app)
(declare ats2cljpre_list_foreach)
(declare ats2cljpre_list_foreach_method)
(declare _ats2cljpre_list_patsfun_46)
(declare ats2cljpre_list_iforeach)
(declare _ats2cljpre_list_aux_48)
(declare ats2cljpre_list_iforeach_method)
(declare _ats2cljpre_list_patsfun_50)
(declare ats2cljpre_list_rforeach)
(declare ats2cljpre_list_rforeach_method)
(declare _ats2cljpre_list_patsfun_53)
(declare ats2cljpre_list_filter)
(declare _ats2cljpre_list_aux_55)
(declare ats2cljpre_list_filter_method)
(declare _ats2cljpre_list_patsfun_57)
(declare ats2cljpre_list_map)
(declare _ats2cljpre_list_aux_59)
(declare ats2cljpre_list_map_method)
(declare _ats2cljpre_list_patsfun_61)
(declare ats2cljpre_list_foldleft)
(declare _ats2cljpre_list_loop_63)
(declare ats2cljpre_list_foldleft_method)
(declare _ats2cljpre_list_patsfun_65)
(declare ats2cljpre_list_ifoldleft)
(declare _ats2cljpre_list_loop_67)
(declare ats2cljpre_list_ifoldleft_method)
(declare _ats2cljpre_list_patsfun_69)
(declare ats2cljpre_list_foldright)
(declare _ats2cljpre_list_aux_71)
(declare ats2cljpre_list_foldright_method)
(declare _ats2cljpre_list_patsfun_73)
(declare ats2cljpre_list_ifoldright)
(declare _ats2cljpre_list_aux_75)
(declare ats2cljpre_list_ifoldright_method)
(declare _ats2cljpre_list_patsfun_77)
(declare ats2cljpre_streamize_list_elt)
(declare _ats2cljpre_list_auxmain_81)
(declare _ats2cljpre_list_patsfun_82)
(declare ats2cljpre_streamize_list_zip)
(declare _ats2cljpre_list_auxmain_84)
(declare _ats2cljpre_list_patsfun_85)
(declare ats2cljpre_streamize_list_cross)
(declare _ats2cljpre_list_auxone_87)
(declare _ats2cljpre_list_patsfun_88)
(declare _ats2cljpre_list_auxmain_89)
(declare _ats2cljpre_list_patsfun_90)
(declare ats2cljpre_CLJlist_oflist_rev)
(declare _ats2cljpre_list_aux_99)
(declare ats2cljpre_list_sort_2)
(declare _ats2cljpre_list_patsfun_101)
;;;;;;


;;
;; ATSextcode_beg()
;;
;; list.dats
;; declared: stream_vt.dats
(declare ats2cljpre_stream_vt_append)
;;
;; ATSextcode_end()
;;

(defn
_ats2cljpre_list_patsfun_31__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_31 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_35__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_35 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_38__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_38 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_42__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_42 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_46__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_46 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_50__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_50 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_53__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_53 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_57__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_57 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_61__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_61 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_65__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_65 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_69__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_69 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_73__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_73 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_77__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_77 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_82__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_82 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_85__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_85 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_88__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_88 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_90__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_list_patsfun_90 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_list_patsfun_101__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0 xarg1](_ats2cljpre_list_patsfun_101 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; end-of-defn


;;fun
(defn
 ats2cljpre_list_make_intrange_2[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret2 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_make_intrange_2
  (ats2cljpre_list_make_intrange_3 arg0 arg1 1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_make_intrange_3[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret3 nil
  tmp14 nil
  tmp15 nil
  tmp16 nil
  tmp17 nil
  tmp18 nil
  tmp19 nil
  tmp20 nil
  tmp21 nil
  tmp22 nil
  tmp23 nil
  tmp24 nil
  tmp25 nil
  tmp26 nil
  tmp27 nil
  tmp28 nil
  tmp29 nil
  tmp30 nil
  tmp31 nil
  tmp32 nil
  tmp33 nil
  tmp34 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_make_intrange_3
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (ATSINStmpset tmp14 (ats2cljpre_gt_int0_int0 arg2 0))
       (if (not (ATSCKpat_bool @tmp14 atscc2clj_true))
         (casefnx 2)
         (do
          (ATSINStmpset tmp15 (ats2cljpre_lt_int0_int0 arg0 arg1))
          (if @tmp15
            (do
             (ATSINStmpset tmp19 (ats2cljpre_sub_int0_int0 arg1 arg0))
             (ATSINStmpset tmp18 (ats2cljpre_add_int0_int0 @tmp19 arg2))
             (ATSINStmpset tmp17 (ats2cljpre_sub_int0_int0 @tmp18 1))
             (ATSINStmpset tmp16 (ats2cljpre_div_int0_int0 @tmp17 arg2))
             (ATSINStmpset tmp22 (ats2cljpre_sub_int0_int0 @tmp16 1))
             (ATSINStmpset tmp21 (ats2cljpre_mul_int0_int0 @tmp22 arg2))
             (ATSINStmpset tmp20 (ats2cljpre_add_int0_int0 arg0 @tmp21))
             (ATSINStmpset tmp23 atscc2clj_null)
             (_ats2cljpre_list_loop1_4 @tmp16 @tmp20 arg2 @tmp23)
            ) ;; if-then
            (do
             atscc2clj_null
            ) ;; if-else
          )
         )
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      2 (do
       (ATSINStmpset tmp24 (ats2cljpre_lt_int0_int0 arg2 0))
       (if (not (ATSCKpat_bool @tmp24 atscc2clj_true))
         (casefnx 3)
         (do
          (ATSINStmpset tmp25 (ats2cljpre_gt_int0_int0 arg0 arg1))
          (if @tmp25
            (do
             (ATSINStmpset tmp26 (ats2cljpre_neg_int0 arg2))
             (ATSINStmpset tmp30 (ats2cljpre_sub_int0_int0 arg0 arg1))
             (ATSINStmpset tmp29 (ats2cljpre_add_int0_int0 @tmp30 @tmp26))
             (ATSINStmpset tmp28 (ats2cljpre_sub_int0_int0 @tmp29 1))
             (ATSINStmpset tmp27 (ats2cljpre_div_int0_int0 @tmp28 @tmp26))
             (ATSINStmpset tmp33 (ats2cljpre_sub_int0_int0 @tmp27 1))
             (ATSINStmpset tmp32 (ats2cljpre_mul_int0_int0 @tmp33 @tmp26))
             (ATSINStmpset tmp31 (ats2cljpre_sub_int0_int0 arg0 @tmp32))
             (ATSINStmpset tmp34 atscc2clj_null)
             (_ats2cljpre_list_loop2_5 @tmp27 @tmp31 @tmp26 @tmp34)
            ) ;; if-then
            (do
             atscc2clj_null
            ) ;; if-else
          )
         )
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop1_4[arg0 arg1 arg2 arg3]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
  tmpret4 nil
  tmp5 nil
  tmp6 nil
  tmp7 nil
  tmp8 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop1_4
    (ATSINStmpset tmp5 (ats2cljpre_gt_int0_int0 arg0 0))
    (if @tmp5
      (do
       (ATSINStmpset tmp6 (ats2cljpre_sub_int0_int0 arg0 1))
       (ATSINStmpset tmp7 (ats2cljpre_sub_int0_int0 arg1 arg2))
       (ATSINStmpset tmp8 (ATSPMVtysum arg1 arg3))
       ;; apy0 = @tmp6
       ;; apy1 = @tmp7
       ;; apy2 = arg2
       ;; apy3 = @tmp8
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; arg3 = apy3
       ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop1_4
       (recur @tmp6 @tmp7 arg2 @tmp8)
      ) ;; if-then
      (do
       arg3
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret4;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop2_5[arg0 arg1 arg2 arg3]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
  tmpret9 nil
  tmp10 nil
  tmp11 nil
  tmp12 nil
  tmp13 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop2_5
    (ATSINStmpset tmp10 (ats2cljpre_gt_int0_int0 arg0 0))
    (if @tmp10
      (do
       (ATSINStmpset tmp11 (ats2cljpre_sub_int0_int0 arg0 1))
       (ATSINStmpset tmp12 (ats2cljpre_add_int0_int0 arg1 arg2))
       (ATSINStmpset tmp13 (ATSPMVtysum arg1 arg3))
       ;; apy0 = @tmp11
       ;; apy1 = @tmp12
       ;; apy2 = arg2
       ;; apy3 = @tmp13
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; arg3 = apy3
       ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop2_5
       (recur @tmp11 @tmp12 arg2 @tmp13)
      ) ;; if-then
      (do
       arg3
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret9;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret46 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_length
  (_ats2cljpre_list_loop_12 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_12[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret47 nil
  tmp49 nil
  tmp50 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_12
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp49 (ATSSELcon arg0 1))
         (ATSINStmpset tmp50 (ats2cljpre_add_int1_int1 arg1 1))
         ;; apy0 = @tmp49
         ;; apy1 = @tmp50
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_12
         (_ats2cljpre_list_loop_12 @tmp49 @tmp50)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret47;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_last[arg0]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
  tmpret51 nil
  tmp52 nil
  tmp53 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
    ] ; funlab_clj = 0;
    ;; __patsflab_list_last
    (ATSINStmpset tmp52 (ATSSELcon arg0 0))
    (ATSINStmpset tmp53 (ATSSELcon arg0 1))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp53)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         @tmp52
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         ;; apy0 = @tmp53
         ;; arg0 = apy0
         ;; funlab_clj = 1; // __patsflab_list_last
         (ats2cljpre_list_last @tmp53)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret51;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_get_at[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret54 nil
  tmp55 nil
  tmp56 nil
  tmp57 nil
  tmp58 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list_get_at
    (ATSINStmpset tmp55 (ats2cljpre_eq_int1_int1 arg1 0))
    (if @tmp55
      (do
       (ATSINStmpset tmp56 (ATSSELcon arg0 0))
       @tmp56
      ) ;; if-then
      (do
       (ATSINStmpset tmp57 (ATSSELcon arg0 1))
       (ATSINStmpset tmp58 (ats2cljpre_sub_int1_int1 arg1 1))
       ;; apy0 = @tmp57
       ;; apy1 = @tmp58
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_clj = 1; // __patsflab_list_get_at
       (recur @tmp57 @tmp58)
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret54;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_snoc[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret59 nil
  tmp60 nil
  tmp61 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_snoc
  (ATSINStmpset tmp61 atscc2clj_null)
  (ATSINStmpset tmp60 (ATSPMVtysum arg1 @tmp61))
  (ats2cljpre_list_append arg0 @tmp60)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_extend[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret62 nil
  tmp63 nil
  tmp64 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_extend
  (ATSINStmpset tmp64 atscc2clj_null)
  (ATSINStmpset tmp63 (ATSPMVtysum arg1 @tmp64))
  (ats2cljpre_list_append arg0 @tmp63)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret65 nil
  tmp66 nil
  tmp67 nil
  tmp68 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_append
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp66 (ATSSELcon arg0 0))
       (ATSINStmpset tmp67 (ATSSELcon arg0 1))
       (ATSINStmpset tmp68 (ats2cljpre_list_append @tmp67 arg1))
       (ATSPMVtysum @tmp66 @tmp68)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_reverse[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret69 nil
  tmp70 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_reverse
  (ATSINStmpset tmp70 atscc2clj_null)
  (ats2cljpre_list_reverse_append arg0 @tmp70)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_reverse_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret71 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_reverse_append
  (_ats2cljpre_list_loop_20 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_20[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret72 nil
  tmp73 nil
  tmp74 nil
  tmp75 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_20
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp73 (ATSSELcon arg0 0))
         (ATSINStmpset tmp74 (ATSSELcon arg0 1))
         (ATSINStmpset tmp75 (ATSPMVtysum @tmp73 arg1))
         ;; apy0 = @tmp74
         ;; apy1 = @tmp75
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_20
         (_ats2cljpre_list_loop_20 @tmp74 @tmp75)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret72;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_concat[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret76 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_concat
  (_ats2cljpre_list_auxlst_22 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_auxlst_22[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret77 nil
  tmp78 nil
  tmp79 nil
  tmp80 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_auxlst_22
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp78 (ATSSELcon arg0 0))
       (ATSINStmpset tmp79 (ATSSELcon arg0 1))
       (ATSINStmpset tmp80 (_ats2cljpre_list_auxlst_22 @tmp79))
       (ats2cljpre_list_append @tmp78 @tmp80)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_take[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret81 nil
  tmp82 nil
  tmp83 nil
  tmp84 nil
  tmp85 nil
  tmp86 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_take
  (ATSINStmpset tmp82 (ats2cljpre_gt_int1_int1 arg1 0))
  (if @tmp82
    (do
     (ATSINStmpset tmp83 (ATSSELcon arg0 0))
     (ATSINStmpset tmp84 (ATSSELcon arg0 1))
     (ATSINStmpset tmp86 (ats2cljpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp85 (ats2cljpre_list_take @tmp84 @tmp86))
     (ATSPMVtysum @tmp83 @tmp85)
    ) ;; if-then
    (do
     atscc2clj_null
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_drop[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret87 nil
  tmp88 nil
  tmp89 nil
  tmp90 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list_drop
    (ATSINStmpset tmp88 (ats2cljpre_gt_int1_int1 arg1 0))
    (if @tmp88
      (do
       (ATSINStmpset tmp89 (ATSSELcon arg0 1))
       (ATSINStmpset tmp90 (ats2cljpre_sub_int1_int1 arg1 1))
       ;; apy0 = @tmp89
       ;; apy1 = @tmp90
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_clj = 1; // __patsflab_list_drop
       (recur @tmp89 @tmp90)
      ) ;; if-then
      (do
       arg0
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret87;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_split_at[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret91 nil
  tmp92 nil
  tmp93 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_split_at
  (ATSINStmpset tmp92 (ats2cljpre_list_take arg0 arg1))
  (ATSINStmpset tmp93 (ats2cljpre_list_drop arg0 arg1))
  (ATSPMVtyrec @tmp92 @tmp93)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_insert_at[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret94 nil
  tmp95 nil
  tmp96 nil
  tmp97 nil
  tmp98 nil
  tmp99 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_insert_at
  (ATSINStmpset tmp95 (ats2cljpre_gt_int1_int1 arg1 0))
  (if @tmp95
    (do
     (ATSINStmpset tmp96 (ATSSELcon arg0 0))
     (ATSINStmpset tmp97 (ATSSELcon arg0 1))
     (ATSINStmpset tmp99 (ats2cljpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp98 (ats2cljpre_list_insert_at @tmp97 @tmp99 arg2))
     (ATSPMVtysum @tmp96 @tmp98)
    ) ;; if-then
    (do
     (ATSPMVtysum arg2 arg0)
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_remove_at[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret100 nil
  tmp101 nil
  tmp102 nil
  tmp103 nil
  tmp104 nil
  tmp105 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_remove_at
  (ATSINStmpset tmp101 (ATSSELcon arg0 0))
  (ATSINStmpset tmp102 (ATSSELcon arg0 1))
  (ATSINStmpset tmp103 (ats2cljpre_gt_int1_int1 arg1 0))
  (if @tmp103
    (do
     (ATSINStmpset tmp105 (ats2cljpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp104 (ats2cljpre_list_remove_at @tmp102 @tmp105))
     (ATSPMVtysum @tmp101 @tmp104)
    ) ;; if-then
    (do
     @tmp102
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_takeout_at[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret106 nil
  tmp107 nil
  tmp108 nil
  tmp109 nil
  tmp110 nil
  tmp111 nil
  tmp112 nil
  tmp113 nil
  tmp114 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_takeout_at
  (ATSINStmpset tmp107 (ATSSELcon arg0 0))
  (ATSINStmpset tmp108 (ATSSELcon arg0 1))
  (ATSINStmpset tmp109 (ats2cljpre_gt_int1_int1 arg1 0))
  (if @tmp109
    (do
     (ATSINStmpset tmp111 (ats2cljpre_sub_int1_int1 arg1 1))
     (ATSINStmpset tmp110 (ats2cljpre_list_takeout_at @tmp108 @tmp111))
     (ATSINStmpset tmp112 (ATSSELboxrec @tmp110 0))
     (ATSINStmpset tmp113 (ATSSELboxrec @tmp110 1))
     (ATSINStmpset tmp114 (ATSPMVtysum @tmp107 @tmp113))
     (ATSPMVtyrec @tmp112 @tmp114)
    ) ;; if-then
    (do
     (ATSPMVtyrec @tmp107 @tmp108)
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_exists[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret115 nil
  tmp116 nil
  tmp117 nil
  tmp118 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list_exists
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp116 (ATSSELcon arg0 0))
         (ATSINStmpset tmp117 (ATSSELcon arg0 1))
         (ATSINStmpset tmp118 ((ATSfunclo_fclo arg1) arg1 @tmp116))
         (if @tmp118
           (do
            atscc2clj_true
           ) ;; if-then
           (do
            ;; apy0 = @tmp117
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_list_exists
            (ats2cljpre_list_exists @tmp117 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret115;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret119 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_exists_method
  (_ats2cljpre_list_patsfun_31__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_31[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret120 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_31
  (ats2cljpre_list_exists env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iexists[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret121 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iexists
  (_ats2cljpre_list_loop_33 arg1 0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_33[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret122 nil
  tmp123 nil
  tmp124 nil
  tmp125 nil
  tmp126 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_33
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp123 (ATSSELcon arg1 0))
         (ATSINStmpset tmp124 (ATSSELcon arg1 1))
         (ATSINStmpset tmp125 ((ATSfunclo_fclo env0) env0 arg0 @tmp123))
         (if @tmp125
           (do
            atscc2clj_true
           ) ;; if-then
           (do
            (ATSINStmpset tmp126 (ats2cljpre_add_int1_int1 arg0 1))
            ;; apy0 = @tmp126
            ;; apy1 = @tmp124
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_33
            (_ats2cljpre_list_loop_33 env0 @tmp126 @tmp124)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret122;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iexists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret127 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iexists_method
  (_ats2cljpre_list_patsfun_35__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_35[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret128 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_35
  (ats2cljpre_list_iexists env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_forall[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret129 nil
  tmp130 nil
  tmp131 nil
  tmp132 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list_forall
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp130 (ATSSELcon arg0 0))
         (ATSINStmpset tmp131 (ATSSELcon arg0 1))
         (ATSINStmpset tmp132 ((ATSfunclo_fclo arg1) arg1 @tmp130))
         (if @tmp132
           (do
            ;; apy0 = @tmp131
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_list_forall
            (ats2cljpre_list_forall @tmp131 arg1)
           ) ;; if-then
           (do
            atscc2clj_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret129;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret133 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_forall_method
  (_ats2cljpre_list_patsfun_38__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_38[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret134 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_38
  (ats2cljpre_list_forall env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iforall[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret135 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iforall
  (_ats2cljpre_list_loop_40 arg1 0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_40[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret136 nil
  tmp137 nil
  tmp138 nil
  tmp139 nil
  tmp140 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_40
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp137 (ATSSELcon arg1 0))
         (ATSINStmpset tmp138 (ATSSELcon arg1 1))
         (ATSINStmpset tmp139 ((ATSfunclo_fclo env0) env0 arg0 @tmp137))
         (if @tmp139
           (do
            (ATSINStmpset tmp140 (ats2cljpre_add_int1_int1 arg0 1))
            ;; apy0 = @tmp140
            ;; apy1 = @tmp138
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_40
            (_ats2cljpre_list_loop_40 env0 @tmp140 @tmp138)
           ) ;; if-then
           (do
            atscc2clj_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret136;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iforall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret141 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iforall_method
  (_ats2cljpre_list_patsfun_42__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_42[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret142 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_42
  (ats2cljpre_list_iforall env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_app[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_app
  (ATSINSmove1_void (ats2cljpre_list_foreach arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foreach[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp145 nil
  tmp146 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list_foreach
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp145 (ATSSELcon arg0 0))
         (ATSINStmpset tmp146 (ATSSELcon arg0 1))
         (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 @tmp145))
         ;; apy0 = @tmp146
         ;; apy1 = arg1
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab_list_foreach
         (ats2cljpre_list_foreach @tmp146 arg1)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret148 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_foreach_method
  (_ats2cljpre_list_patsfun_46__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_46[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_46
  (ATSINSmove1_void (ats2cljpre_list_foreach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iforeach[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iforeach
  (ATSINSmove1_void (_ats2cljpre_list_aux_48 arg1 0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_48[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp152 nil
  tmp153 nil
  tmp155 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_aux_48
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp152 (ATSSELcon arg1 0))
         (ATSINStmpset tmp153 (ATSSELcon arg1 1))
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 @tmp152))
         (ATSINStmpset tmp155 (ats2cljpre_add_int1_int1 arg0 1))
         ;; apy0 = @tmp155
         ;; apy1 = @tmp153
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_aux_48
         (_ats2cljpre_list_aux_48 env0 @tmp155 @tmp153)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_iforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret156 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_iforeach_method
  (_ats2cljpre_list_patsfun_50__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_50[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_50
  (ATSINSmove1_void (ats2cljpre_list_iforeach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_rforeach[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmp159 nil
  tmp160 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_rforeach
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       ATSINSmove0_void
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp159 (ATSSELcon arg0 0))
       (ATSINStmpset tmp160 (ATSSELcon arg0 1))
       (ATSINSmove1_void (ats2cljpre_list_rforeach @tmp160 arg1))
       (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 @tmp159))
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_rforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret162 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_rforeach_method
  (_ats2cljpre_list_patsfun_53__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_53[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_53
  (ATSINSmove1_void (ats2cljpre_list_rforeach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_filter[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret164 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_filter
  (_ats2cljpre_list_aux_55 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_55[env0 arg0]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
  tmpret165 nil
  tmp166 nil
  tmp167 nil
  tmp168 nil
  tmp169 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_aux_55
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp166 (ATSSELcon arg0 0))
         (ATSINStmpset tmp167 (ATSSELcon arg0 1))
         (ATSINStmpset tmp168 ((ATSfunclo_fclo env0) env0 @tmp166))
         (if @tmp168
           (do
            (ATSINStmpset tmp169 (_ats2cljpre_list_aux_55 env0 @tmp167))
            (ATSPMVtysum @tmp166 @tmp169)
           ) ;; if-then
           (do
            ;; apy0 = @tmp167
            ;; arg0 = apy0
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_aux_55
            (_ats2cljpre_list_aux_55 env0 @tmp167)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret165;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_filter_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret170 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_filter_method
  (_ats2cljpre_list_patsfun_57__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_57[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret171 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_57
  (ats2cljpre_list_filter env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_map[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret172 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_map
  (_ats2cljpre_list_aux_59 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_59[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret173 nil
  tmp174 nil
  tmp175 nil
  tmp176 nil
  tmp177 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_aux_59
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp174 (ATSSELcon arg0 0))
       (ATSINStmpset tmp175 (ATSSELcon arg0 1))
       (ATSINStmpset tmp176 ((ATSfunclo_fclo env0) env0 @tmp174))
       (ATSINStmpset tmp177 (_ats2cljpre_list_aux_59 env0 @tmp175))
       (ATSPMVtysum @tmp176 @tmp177)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret178 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_map_method
  (_ats2cljpre_list_patsfun_61__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_61[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret179 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_61
  (ats2cljpre_list_map env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foldleft[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret180 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_foldleft
  (_ats2cljpre_list_loop_63 arg2 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_63[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret181 nil
  tmp182 nil
  tmp183 nil
  tmp184 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_63
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp182 (ATSSELcon arg1 0))
         (ATSINStmpset tmp183 (ATSSELcon arg1 1))
         (ATSINStmpset tmp184 ((ATSfunclo_fclo env0) env0 arg0 @tmp182))
         ;; apy0 = @tmp184
         ;; apy1 = @tmp183
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_63
         (_ats2cljpre_list_loop_63 env0 @tmp184 @tmp183)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret181;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foldleft_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret185 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_foldleft_method
  (_ats2cljpre_list_patsfun_65__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_65[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret186 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_65
  (ats2cljpre_list_foldleft env0 env1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_ifoldleft[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret187 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_ifoldleft
  (_ats2cljpre_list_loop_67 arg2 0 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_67[env0 arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmpret188 nil
  tmp189 nil
  tmp190 nil
  tmp191 nil
  tmp192 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_67
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg2)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp189 (ATSSELcon arg2 0))
         (ATSINStmpset tmp190 (ATSSELcon arg2 1))
         (ATSINStmpset tmp191 (ats2cljpre_add_int1_int1 arg0 1))
         (ATSINStmpset tmp192 ((ATSfunclo_fclo env0) env0 arg0 arg1 @tmp189))
         ;; apy0 = @tmp191
         ;; apy1 = @tmp192
         ;; apy2 = @tmp190
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; arg2 = apy2
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_67
         (_ats2cljpre_list_loop_67 env0 @tmp191 @tmp192 @tmp190)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret188;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_ifoldleft_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret193 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_ifoldleft_method
  (_ats2cljpre_list_patsfun_69__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_69[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret194 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_69
  (ats2cljpre_list_ifoldleft env0 env1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foldright[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret195 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_foldright
  (_ats2cljpre_list_aux_71 arg1 arg0 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_71[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret196 nil
  tmp197 nil
  tmp198 nil
  tmp199 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_aux_71
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp197 (ATSSELcon arg0 0))
       (ATSINStmpset tmp198 (ATSSELcon arg0 1))
       (ATSINStmpset tmp199 (_ats2cljpre_list_aux_71 env0 @tmp198 arg1))
       ((ATSfunclo_fclo env0) env0 @tmp197 @tmp199)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_foldright_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret200 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_foldright_method
  (_ats2cljpre_list_patsfun_73__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_73[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret201 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_73
  (ats2cljpre_list_foldright env0 arg0 env1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_ifoldright[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret202 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_ifoldright
  (_ats2cljpre_list_aux_75 arg1 0 arg0 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_75[env0 arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret203 nil
  tmp204 nil
  tmp205 nil
  tmp206 nil
  tmp207 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_aux_75
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg1)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg2
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp204 (ATSSELcon arg1 0))
       (ATSINStmpset tmp205 (ATSSELcon arg1 1))
       (ATSINStmpset tmp207 (ats2cljpre_add_int1_int1 arg0 1))
       (ATSINStmpset tmp206 (_ats2cljpre_list_aux_75 env0 @tmp207 @tmp205 arg2))
       ((ATSfunclo_fclo env0) env0 arg0 @tmp204 @tmp206)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_ifoldright_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret208 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_ifoldright_method
  (_ats2cljpre_list_patsfun_77__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_77[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret209 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_77
  (ats2cljpre_list_ifoldright env0 arg0 env1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_streamize_list_elt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret212 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list_elt
  (_ats2cljpre_list_auxmain_81 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_auxmain_81[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret213 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_auxmain_81
  (ATSPMVllazyval (_ats2cljpre_list_patsfun_82__closurerize arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_82[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret214 nil
  tmp215 nil
  tmp216 nil
  tmp217 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_82
  (if arg0
    (do
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp215 (ATSSELcon env0 0))
          (ATSINStmpset tmp216 (ATSSELcon env0 1))
          (ATSINStmpset tmp217 (_ats2cljpre_list_auxmain_81 @tmp216))
          (ATSPMVtysum @tmp215 @tmp217)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_streamize_list_zip[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret218 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list_zip
  (_ats2cljpre_list_auxmain_84 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_auxmain_84[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret219 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_auxmain_84
  (ATSPMVllazyval (_ats2cljpre_list_patsfun_85__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_85[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret220 nil
  tmp221 nil
  tmp222 nil
  tmp223 nil
  tmp224 nil
  tmp225 nil
  tmp226 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_85
  (if arg0
    (do
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp221 (ATSSELcon env0 0))
          (ATSINStmpset tmp222 (ATSSELcon env0 1))
          (let[
            casefnx
            (fn casefnx[tmplab](case tmplab
              ;; ATSbranchseq_beg
              1 (do
               (if (ATSCKptriscons env1)
                 (casefnx 4)
                 (do
                  (casefnx 2)
                 )
               )
              ) ;; end-of-branch
              2 (do
               atscc2clj_null
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; ATSbranchseq_beg
              3 (do
               (casefnx 4)
              ) ;; end-of-branch
              4 (do
               (ATSINStmpset tmp223 (ATSSELcon env1 0))
               (ATSINStmpset tmp224 (ATSSELcon env1 1))
               (ATSINStmpset tmp225 (ATSPMVtyrec @tmp221 @tmp223))
               (ATSINStmpset tmp226 (_ats2cljpre_list_auxmain_84 @tmp222 @tmp224))
               (ATSPMVtysum @tmp225 @tmp226)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
             ) ;; end-of-case
            ) ;; end-of-casefnx
           ] (casefnx 1)
          ) ;; end-of-let(casefnx)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_streamize_list_cross[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret227 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list_cross
  (_ats2cljpre_list_auxmain_89 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_auxone_87[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret228 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_auxone_87
  (ATSPMVllazyval (_ats2cljpre_list_patsfun_88__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_88[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret229 nil
  tmp230 nil
  tmp231 nil
  tmp232 nil
  tmp233 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_88
  (if arg0
    (do
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons env1)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp230 (ATSSELcon env1 0))
          (ATSINStmpset tmp231 (ATSSELcon env1 1))
          (ATSINStmpset tmp232 (ATSPMVtyrec env0 @tmp230))
          (ATSINStmpset tmp233 (_ats2cljpre_list_auxone_87 env0 @tmp231))
          (ATSPMVtysum @tmp232 @tmp233)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_auxmain_89[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret234 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_auxmain_89
  (ATSPMVllazyval (_ats2cljpre_list_patsfun_90__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_90[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret235 nil
  tmp236 nil
  tmp237 nil
  tmp238 nil
  tmp239 nil
  tmp240 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_90
  (if arg0
    (do
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons env0)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp236 (ATSSELcon env0 0))
          (ATSINStmpset tmp237 (ATSSELcon env0 1))
          (ATSINStmpset tmp239 (_ats2cljpre_list_auxone_87 @tmp236 env1))
          (ATSINStmpset tmp240 (_ats2cljpre_list_auxmain_89 @tmp237 env1))
          (ATSINStmpset tmp238 (ats2cljpre_stream_vt_append @tmp239 @tmp240))
          (ATSPMVllazyval_eval @tmp238)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_CLJlist_oflist_rev[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret248 nil
  tmp253 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_CLJlist_oflist_rev
  (ATSINStmpset tmp253 (ats2cljpre_CLJlist_nil))
  (_ats2cljpre_list_aux_99 arg0 @tmp253)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_99[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret249 nil
  tmp250 nil
  tmp251 nil
  tmp252 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_aux_99
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp250 (ATSSELcon arg0 0))
         (ATSINStmpset tmp251 (ATSSELcon arg0 1))
         (ATSINStmpset tmp252 (ats2cljpre_CLJlist_cons @tmp250 arg1))
         ;; apy0 = @tmp251
         ;; apy1 = @tmp252
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_aux_99
         (_ats2cljpre_list_aux_99 @tmp251 @tmp252)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret249;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_sort_2[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret254 nil
  tmp255 nil
  tmp256 nil
  tmp259 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_sort_2
  (ATSINStmpset tmp255 (ats2cljpre_CLJlist_oflist_rev arg0))
  (ATSINStmpset tmp256 (ats2cljpre_CLJlist_sort_2 @tmp255 (_ats2cljpre_list_patsfun_101__closurerize arg1)))
  (ATSINStmpset tmp259 (ats2cljpre_CLJlist2list_rev @tmp256))
  @tmp259
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_patsfun_101[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret257 nil
  tmp258 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_patsfun_101
  (ATSINStmpset tmp258 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2cljpre_neg_int0 @tmp258)
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_list_loop_3)
(declare _ats2cljpre_list_aux_7)
(declare _ats2cljpre_list_loop_10)
(declare ats2cljpre_list_vt_length)
(declare _ats2cljpre_list_loop_3)
(declare ats2cljpre_list_vt_snoc)
(declare ats2cljpre_list_vt_extend)
(declare ats2cljpre_list_vt_append)
(declare _ats2cljpre_list_aux_7)
(declare ats2cljpre_list_vt_reverse)
(declare ats2cljpre_list_vt_reverse_append)
(declare _ats2cljpre_list_loop_10)
;;;;;;


;;fun
(defn
 ats2cljpre_list_vt_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret2 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_length
  (_ats2cljpre_list_loop_3 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_3[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret3 nil
  tmp5 nil
  tmp6 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_3
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp5 (ATSSELcon arg0 1))
         (ATSINStmpset tmp6 (ats2cljpre_add_int1_int1 arg1 1))
         ;; apy0 = @tmp5
         ;; apy1 = @tmp6
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_3
         (_ats2cljpre_list_loop_3 @tmp5 @tmp6)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret3;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_vt_snoc[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
  tmp8 nil
  tmp9 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_snoc
  (ATSINStmpset tmp9 atscc2clj_null)
  (ATSINStmpset tmp8 (ATSPMVtysum arg1 @tmp9))
  (ats2cljpre_list_vt_append arg0 @tmp8)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_vt_extend[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret10 nil
  tmp11 nil
  tmp12 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_extend
  (ATSINStmpset tmp12 atscc2clj_null)
  (ATSINStmpset tmp11 (ATSPMVtysum arg1 @tmp12))
  (ats2cljpre_list_vt_append arg0 @tmp11)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_vt_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret13 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_append
  (_ats2cljpre_list_aux_7 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_aux_7[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret14 nil
  tmp15 nil
  tmp16 nil
  tmp17 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_list_aux_7
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp15 (ATSSELcon arg0 0))
       (ATSINStmpset tmp16 (ATSSELcon arg0 1))
       ;; ATSINSfreecon(arg0);
       (ATSINStmpset tmp17 (_ats2cljpre_list_aux_7 @tmp16 arg1))
       (ATSPMVtysum @tmp15 @tmp17)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_vt_reverse[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret18 nil
  tmp19 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_reverse
  (ATSINStmpset tmp19 atscc2clj_null)
  (ats2cljpre_list_vt_reverse_append arg0 @tmp19)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_list_vt_reverse_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret20 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list_vt_reverse_append
  (_ats2cljpre_list_loop_10 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_list_loop_10[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret21 nil
  tmp22 nil
  tmp23 nil
  tmp24 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_list_loop_10
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp22 (ATSSELcon arg0 0))
         (ATSINStmpset tmp23 (ATSSELcon arg0 1))
         ;; ATSINSfreecon(arg0);
         (ATSINStmpset tmp24 (ATSPMVtysum @tmp22 arg1))
         ;; apy0 = @tmp23
         ;; apy1 = @tmp24
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_list_loop_10
         (_ats2cljpre_list_loop_10 @tmp23 @tmp24)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret21;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare ats2cljpre_option_some)
(declare ats2cljpre_option_none)
(declare ats2cljpre_option_unsome)
(declare ats2cljpre_option_is_some)
(declare ats2cljpre_option_is_none)
;;;;;;


;;fun
(defn
 ats2cljpre_option_some[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret0 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_option_some
  (ATSPMVtysum arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_option_none[]
(
with-local-vars
[
;;knd = 0
  tmpret1 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_option_none
  atscc2clj_null
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_option_unsome[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret2 nil
  tmp3 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_option_unsome
  (ATSINStmpset tmp3 (ATSSELcon arg0 0))
  @tmp3
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_option_is_some[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret4 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_option_is_some
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptrisnull arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_true
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       atscc2clj_false
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_option_is_none[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret5 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_option_is_none
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_true
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       atscc2clj_false
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_stream_patsfun_6)
(declare _ats2cljpre_stream_loop_9)
(declare _ats2cljpre_stream_loop_11)
(declare _ats2cljpre_stream_aux_13)
(declare _ats2cljpre_stream_loop_15)
(declare _ats2cljpre_stream_patsfun_17)
(declare _ats2cljpre_stream_auxmain_19)
(declare _ats2cljpre_stream_auxmain_21)
(declare _ats2cljpre_stream_patsfun_23)
(declare _ats2cljpre_stream_patsfun_25)
(declare _ats2cljpre_stream_patsfun_27)
(declare _ats2cljpre_stream_patsfun_29)
(declare _ats2cljpre_stream_patsfun_31)
(declare _ats2cljpre_stream_patsfun_33)
(declare _ats2cljpre_stream_patsfun_36)
(declare _ats2cljpre_stream_patsfun_39)
(declare _ats2cljpre_stream_patsfun_42)
(declare _ats2cljpre_stream_loop_44)
(declare _ats2cljpre_stream_patsfun_46)
(declare _ats2cljpre_stream_auxmain_48)
(declare _ats2cljpre_stream_patsfun_49)
(declare _ats2cljpre_stream_auxmain_51)
(declare _ats2cljpre_stream_patsfun_52)
(declare _ats2cljpre_stream_patsfun_53)
(declare _ats2cljpre_stream_patsfun_56)
(declare _ats2cljpre_stream_patsfun_58)
(declare _ats2cljpre_stream_patsfun_60)
(declare _ats2cljpre_stream_loop_63)
(declare _ats2cljpre_stream_patsfun_65)
(declare _ats2cljpre_stream_patsfun_67)
(declare _ats2cljpre_stream_aux_69)
(declare _ats2cljpre_stream_patsfun_70)
(declare _ats2cljpre_stream_auxlst_71)
(declare _ats2cljpre_stream_patsfun_72)
(declare ats2cljpre_stream_make_list)
(declare _ats2cljpre_stream_patsfun_6)
(declare ats2cljpre_stream_make_list0)
(declare ats2cljpre_stream_nth_opt)
(declare _ats2cljpre_stream_loop_9)
(declare ats2cljpre_stream_length)
(declare _ats2cljpre_stream_loop_11)
(declare ats2cljpre_stream2list)
(declare _ats2cljpre_stream_aux_13)
(declare ats2cljpre_stream2list_rev)
(declare _ats2cljpre_stream_loop_15)
(declare ats2cljpre_stream_takeLte)
(declare _ats2cljpre_stream_patsfun_17)
(declare ats2cljpre_stream_take_opt)
(declare _ats2cljpre_stream_auxmain_19)
(declare ats2cljpre_stream_drop_opt)
(declare _ats2cljpre_stream_auxmain_21)
(declare ats2cljpre_stream_append)
(declare _ats2cljpre_stream_patsfun_23)
(declare ats2cljpre_stream_concat)
(declare _ats2cljpre_stream_patsfun_25)
(declare ats2cljpre_stream_map_cloref)
(declare _ats2cljpre_stream_patsfun_27)
(declare ats2cljpre_stream_map_method)
(declare _ats2cljpre_stream_patsfun_29)
(declare ats2cljpre_stream_filter_cloref)
(declare _ats2cljpre_stream_patsfun_31)
(declare ats2cljpre_stream_filter_method)
(declare _ats2cljpre_stream_patsfun_33)
(declare ats2cljpre_stream_forall_cloref)
(declare ats2cljpre_stream_forall_method)
(declare _ats2cljpre_stream_patsfun_36)
(declare ats2cljpre_stream_exists_cloref)
(declare ats2cljpre_stream_exists_method)
(declare _ats2cljpre_stream_patsfun_39)
(declare ats2cljpre_stream_foreach_cloref)
(declare ats2cljpre_stream_foreach_method)
(declare _ats2cljpre_stream_patsfun_42)
(declare ats2cljpre_stream_iforeach_cloref)
(declare _ats2cljpre_stream_loop_44)
(declare ats2cljpre_stream_iforeach_method)
(declare _ats2cljpre_stream_patsfun_46)
(declare ats2cljpre_stream_tabulate_cloref)
(declare _ats2cljpre_stream_auxmain_48)
(declare _ats2cljpre_stream_patsfun_49)
(declare ats2cljpre_cross_stream_list)
(declare _ats2cljpre_stream_auxmain_51)
(declare _ats2cljpre_stream_patsfun_52)
(declare _ats2cljpre_stream_patsfun_53)
(declare ats2cljpre_cross_stream_list0)
(declare ats2cljpre_stream2cloref_exn)
(declare _ats2cljpre_stream_patsfun_56)
(declare ats2cljpre_stream2cloref_opt)
(declare _ats2cljpre_stream_patsfun_58)
(declare ats2cljpre_stream2cloref_last)
(declare _ats2cljpre_stream_patsfun_60)
(declare ats2cljpre_stream_take_while_cloref)
(declare ats2cljpre_stream_rtake_while_cloref)
(declare _ats2cljpre_stream_loop_63)
(declare ats2cljpre_stream_take_until_cloref)
(declare _ats2cljpre_stream_patsfun_65)
(declare ats2cljpre_stream_rtake_until_cloref)
(declare _ats2cljpre_stream_patsfun_67)
(declare ats2cljpre_stream_list_xprod2)
(declare _ats2cljpre_stream_aux_69)
(declare _ats2cljpre_stream_patsfun_70)
(declare _ats2cljpre_stream_auxlst_71)
(declare _ats2cljpre_stream_patsfun_72)
;;;;;;


(defn
_ats2cljpre_stream_patsfun_6__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_6 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_17__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_17 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_23__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_23 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_25__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_25 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_27__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_27 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_29__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_29 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_31__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_31 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_33__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_33 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_36__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_36 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_39__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_39 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_42__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_42 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_46__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_patsfun_46 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_49__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_49 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_52__closurerize[xenv0 xenv1 xenv2 xenv3]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_52 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_) (ATSCCget_at _fcenvs_ 4))) xenv0 xenv1 xenv2 xenv3)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_53__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_53 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_56__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_56 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_58__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_58 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_60__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_60 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_65__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0 xarg1](_ats2cljpre_stream_patsfun_65 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_67__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0 xarg1](_ats2cljpre_stream_patsfun_67 (ATSCCget_1 _fcenvs_) xarg0 xarg1)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_70__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_70 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_patsfun_72__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_patsfun_72 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_))) xenv0 xenv1)
;;%}
) ;; end-of-defn


;;fun
(defn
 ats2cljpre_stream_make_list[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_make_list
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_6__closurerize arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_6[env0]
(
with-local-vars
[
;;knd = 0
  tmpret8 nil
  tmp9 nil
  tmp10 nil
  tmp11 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_6
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons env0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp9 (ATSSELcon env0 0))
       (ATSINStmpset tmp10 (ATSSELcon env0 1))
       (ATSINStmpset tmp11 (ats2cljpre_stream_make_list @tmp10))
       (ATSPMVtysum @tmp9 @tmp11)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_make_list0[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret12 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_make_list0
  (ats2cljpre_stream_make_list arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_nth_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret13 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_nth_opt
  (_ats2cljpre_stream_loop_9 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_loop_9[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret14 nil
  tmp15 nil
  tmp16 nil
  tmp17 nil
  tmp18 nil
  tmp19 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_loop_9
    (ATSINStmpset tmp15 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp15)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp16 (ATSSELcon @tmp15 0))
         (ATSINStmpset tmp17 (ATSSELcon @tmp15 1))
         (ATSINStmpset tmp18 (ats2cljpre_gt_int1_int1 arg1 0))
         (if @tmp18
           (do
            (ATSINStmpset tmp19 (ats2cljpre_pred_int1 arg1))
            ;; apy0 = @tmp17
            ;; apy1 = @tmp19
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_loop_9
            (_ats2cljpre_stream_loop_9 @tmp17 @tmp19)
           ) ;; if-then
           (do
            (ATSPMVtysum @tmp16)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret14;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret20 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_length
  (_ats2cljpre_stream_loop_11 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_loop_11[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret21 nil
  tmp22 nil
  tmp24 nil
  tmp25 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_loop_11
    (ATSINStmpset tmp22 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp22)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp24 (ATSSELcon @tmp22 1))
         (ATSINStmpset tmp25 (ats2cljpre_add_int1_int1 arg1 1))
         ;; apy0 = @tmp24
         ;; apy1 = @tmp25
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_loop_11
         (_ats2cljpre_stream_loop_11 @tmp24 @tmp25)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret21;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2list[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret26 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2list
  (_ats2cljpre_stream_aux_13 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_aux_13[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret27 nil
  tmp28 nil
  tmp29 nil
  tmp30 nil
  tmp31 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_aux_13
  (ATSINStmpset tmp28 (ATSPMVlazyval_eval arg0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp28)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp29 (ATSSELcon @tmp28 0))
       (ATSINStmpset tmp30 (ATSSELcon @tmp28 1))
       (ATSINStmpset tmp31 (_ats2cljpre_stream_aux_13 @tmp30))
       (ATSPMVtysum @tmp29 @tmp31)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2list_rev[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret32 nil
  tmp38 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2list_rev
  (ATSINStmpset tmp38 atscc2clj_null)
  (_ats2cljpre_stream_loop_15 arg0 @tmp38)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_loop_15[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret33 nil
  tmp34 nil
  tmp35 nil
  tmp36 nil
  tmp37 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_loop_15
    (ATSINStmpset tmp34 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp34)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp35 (ATSSELcon @tmp34 0))
         (ATSINStmpset tmp36 (ATSSELcon @tmp34 1))
         (ATSINStmpset tmp37 (ATSPMVtysum @tmp35 arg1))
         ;; apy0 = @tmp36
         ;; apy1 = @tmp37
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_loop_15
         (_ats2cljpre_stream_loop_15 @tmp36 @tmp37)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret33;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_takeLte[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret39 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_takeLte
  (ATSPMVllazyval (_ats2cljpre_stream_patsfun_17__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_17[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret40 nil
  tmp41 nil
  tmp42 nil
  tmp43 nil
  tmp44 nil
  tmp45 nil
  tmp46 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_17
  (if arg0
    (do
     (ATSINStmpset tmp41 (ats2cljpre_gt_int1_int1 env1 0))
     (if @tmp41
       (do
        (ATSINStmpset tmp42 (ATSPMVlazyval_eval env0))
        (let[
          casefnx
          (fn casefnx[tmplab](case tmplab
            ;; ATSbranchseq_beg
            1 (do
             (if (ATSCKptriscons @tmp42)
               (casefnx 4)
               (do
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            2 (do
             atscc2clj_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            3 (do
             (casefnx 4)
            ) ;; end-of-branch
            4 (do
             (ATSINStmpset tmp43 (ATSSELcon @tmp42 0))
             (ATSINStmpset tmp44 (ATSSELcon @tmp42 1))
             (ATSINStmpset tmp46 (ats2cljpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp45 (ats2cljpre_stream_takeLte @tmp44 @tmp46))
             (ATSPMVtysum @tmp43 @tmp45)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-casefnx
         ] (casefnx 1)
        ) ;; end-of-let(casefnx)
       ) ;; if-then
       (do
        atscc2clj_null
       ) ;; if-else
     )
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_take_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret47 nil
  tmp56 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_take_opt
  (ATSINStmpset tmp56 atscc2clj_null)
  (_ats2cljpre_stream_auxmain_19 arg1 arg0 0 @tmp56)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_auxmain_19[env0 arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmpret48 nil
  tmp49 nil
  tmp50 nil
  tmp51 nil
  tmp52 nil
  tmp53 nil
  tmp54 nil
  tmp55 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_auxmain_19
    (ATSINStmpset tmp49 (ats2cljpre_lt_int1_int1 arg1 env0))
    (if @tmp49
      (do
       (ATSINStmpset tmp50 (ATSPMVlazyval_eval arg0))
       (let[
         casefnx
         (fn casefnx[tmplab](case tmplab
           ;; ATSbranchseq_beg
           1 (do
            (if (ATSCKptriscons @tmp50)
              (casefnx 4)
              (do
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           2 (do
            atscc2clj_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           3 (do
            (casefnx 4)
           ) ;; end-of-branch
           4 (do
            (ATSINStmpset tmp51 (ATSSELcon @tmp50 0))
            (ATSINStmpset tmp52 (ATSSELcon @tmp50 1))
            (ATSINStmpset tmp53 (ats2cljpre_add_int1_int1 arg1 1))
            (ATSINStmpset tmp54 (ATSPMVtysum @tmp51 arg2))
            ;; apy0 = @tmp52
            ;; apy1 = @tmp53
            ;; apy2 = @tmp54
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; arg2 = apy2
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_auxmain_19
            (_ats2cljpre_stream_auxmain_19 env0 @tmp52 @tmp53 @tmp54)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
          ) ;; end-of-case
         ) ;; end-of-casefnx
        ] (casefnx 1)
       ) ;; end-of-let(casefnx)
      ) ;; if-then
      (do
       (ATSINStmpset tmp55 (ats2cljpre_list_reverse arg2))
       (ATSPMVtysum @tmp55)
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret48;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_drop_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret57 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_drop_opt
  (_ats2cljpre_stream_auxmain_21 arg1 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_auxmain_21[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret58 nil
  tmp59 nil
  tmp60 nil
  tmp62 nil
  tmp63 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_auxmain_21
    (ATSINStmpset tmp59 (ats2cljpre_lt_int1_int1 arg1 env0))
    (if @tmp59
      (do
       (ATSINStmpset tmp60 (ATSPMVlazyval_eval arg0))
       (let[
         casefnx
         (fn casefnx[tmplab](case tmplab
           ;; ATSbranchseq_beg
           1 (do
            (if (ATSCKptriscons @tmp60)
              (casefnx 4)
              (do
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           2 (do
            atscc2clj_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           3 (do
            (casefnx 4)
           ) ;; end-of-branch
           4 (do
            (ATSINStmpset tmp62 (ATSSELcon @tmp60 1))
            (ATSINStmpset tmp63 (ats2cljpre_add_int1_int1 arg1 1))
            ;; apy0 = @tmp62
            ;; apy1 = @tmp63
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_auxmain_21
            (_ats2cljpre_stream_auxmain_21 env0 @tmp62 @tmp63)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
          ) ;; end-of-case
         ) ;; end-of-casefnx
        ] (casefnx 1)
       ) ;; end-of-let(casefnx)
      ) ;; if-then
      (do
       (ATSPMVtysum arg0)
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret58;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret64 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_append
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_23__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_23[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret65 nil
  tmp66 nil
  tmp67 nil
  tmp68 nil
  tmp69 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_23
  (ATSINStmpset tmp66 (ATSPMVlazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp66)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       (ATSPMVlazyval_eval env1)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp67 (ATSSELcon @tmp66 0))
       (ATSINStmpset tmp68 (ATSSELcon @tmp66 1))
       (ATSINStmpset tmp69 (ats2cljpre_stream_append @tmp68 env1))
       (ATSPMVtysum @tmp67 @tmp69)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_concat[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret70 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_concat
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_25__closurerize arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_25[env0]
(
with-local-vars
[
;;knd = 0
  tmpret71 nil
  tmp72 nil
  tmp73 nil
  tmp74 nil
  tmp75 nil
  tmp76 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_25
  (ATSINStmpset tmp72 (ATSPMVlazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp72)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp73 (ATSSELcon @tmp72 0))
       (ATSINStmpset tmp74 (ATSSELcon @tmp72 1))
       (ATSINStmpset tmp76 (ats2cljpre_stream_concat @tmp74))
       (ATSINStmpset tmp75 (ats2cljpre_stream_append @tmp73 @tmp76))
       (ATSPMVlazyval_eval @tmp75)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret77 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_map_cloref
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_27__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_27[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret78 nil
  tmp79 nil
  tmp80 nil
  tmp81 nil
  tmp82 nil
  tmp83 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_27
  (ATSINStmpset tmp79 (ATSPMVlazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp79)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp80 (ATSSELcon @tmp79 0))
       (ATSINStmpset tmp81 (ATSSELcon @tmp79 1))
       (ATSINStmpset tmp82 ((ATSfunclo_fclo env1) env1 @tmp80))
       (ATSINStmpset tmp83 (ats2cljpre_stream_map_cloref @tmp81 env1))
       (ATSPMVtysum @tmp82 @tmp83)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret84 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_map_method
  (_ats2cljpre_stream_patsfun_29__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_29[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret85 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_29
  (ats2cljpre_stream_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_filter_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret86 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_filter_cloref
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_31__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_31[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret87 nil
  tmp88 nil
  tmp89 nil
  tmp90 nil
  tmp91 nil
  tmp92 nil
  tmp93 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_31
  (ATSINStmpset tmp88 (ATSPMVlazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp88)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp89 (ATSSELcon @tmp88 0))
       (ATSINStmpset tmp90 (ATSSELcon @tmp88 1))
       (ATSINStmpset tmp91 ((ATSfunclo_fclo env1) env1 @tmp89))
       (if @tmp91
         (do
          (ATSINStmpset tmp92 (ats2cljpre_stream_filter_cloref @tmp90 env1))
          (ATSPMVtysum @tmp89 @tmp92)
         ) ;; if-then
         (do
          (ATSINStmpset tmp93 (ats2cljpre_stream_filter_cloref @tmp90 env1))
          (ATSPMVlazyval_eval @tmp93)
         ) ;; if-else
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_filter_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret94 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_filter_method
  (_ats2cljpre_stream_patsfun_33__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_33[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret95 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_33
  (ats2cljpre_stream_filter_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_forall_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret96 nil
  tmp97 nil
  tmp98 nil
  tmp99 nil
  tmp100 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_stream_forall_cloref
    (ATSINStmpset tmp97 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp97)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp98 (ATSSELcon @tmp97 0))
         (ATSINStmpset tmp99 (ATSSELcon @tmp97 1))
         (ATSINStmpset tmp100 ((ATSfunclo_fclo arg1) arg1 @tmp98))
         (if @tmp100
           (do
            ;; apy0 = @tmp99
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_stream_forall_cloref
            (ats2cljpre_stream_forall_cloref @tmp99 arg1)
           ) ;; if-then
           (do
            atscc2clj_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret96;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret101 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_forall_method
  (_ats2cljpre_stream_patsfun_36__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_36[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret102 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_36
  (ats2cljpre_stream_forall_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_exists_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret103 nil
  tmp104 nil
  tmp105 nil
  tmp106 nil
  tmp107 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_stream_exists_cloref
    (ATSINStmpset tmp104 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp104)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp105 (ATSSELcon @tmp104 0))
         (ATSINStmpset tmp106 (ATSSELcon @tmp104 1))
         (ATSINStmpset tmp107 ((ATSfunclo_fclo arg1) arg1 @tmp105))
         (if @tmp107
           (do
            atscc2clj_true
           ) ;; if-then
           (do
            ;; apy0 = @tmp106
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_stream_exists_cloref
            (ats2cljpre_stream_exists_cloref @tmp106 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret103;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret108 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_exists_method
  (_ats2cljpre_stream_patsfun_39__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_39[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret109 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_39
  (ats2cljpre_stream_exists_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_foreach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp111 nil
  tmp112 nil
  tmp113 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_stream_foreach_cloref
    (ATSINStmpset tmp111 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp111)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp112 (ATSSELcon @tmp111 0))
         (ATSINStmpset tmp113 (ATSSELcon @tmp111 1))
         (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1 @tmp112))
         ;; apy0 = @tmp113
         ;; apy1 = arg1
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab_stream_foreach_cloref
         (ats2cljpre_stream_foreach_cloref @tmp113 arg1)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret115 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_foreach_method
  (_ats2cljpre_stream_patsfun_42__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_42[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_42
  (ATSINSmove1_void (ats2cljpre_stream_foreach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_iforeach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_iforeach_cloref
  (ATSINSmove1_void (_ats2cljpre_stream_loop_44 arg1 0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_loop_44[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp119 nil
  tmp120 nil
  tmp121 nil
  tmp123 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_loop_44
    (ATSINStmpset tmp119 (ATSPMVlazyval_eval arg1))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp119)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp120 (ATSSELcon @tmp119 0))
         (ATSINStmpset tmp121 (ATSSELcon @tmp119 1))
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 @tmp120))
         (ATSINStmpset tmp123 (ats2cljpre_add_int1_int1 arg0 1))
         ;; apy0 = @tmp123
         ;; apy1 = @tmp121
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_loop_44
         (_ats2cljpre_stream_loop_44 env0 @tmp123 @tmp121)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_iforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret124 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_iforeach_method
  (_ats2cljpre_stream_patsfun_46__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_46[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_46
  (ATSINSmove1_void (ats2cljpre_stream_iforeach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_tabulate_cloref[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret126 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_tabulate_cloref
  (_ats2cljpre_stream_auxmain_48 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_auxmain_48[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret127 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_auxmain_48
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_49__closurerize env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_49[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret128 nil
  tmp129 nil
  tmp130 nil
  tmp131 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_49
  (ATSINStmpset tmp129 ((ATSfunclo_fclo env0) env0 env1))
  (ATSINStmpset tmp131 (ats2cljpre_add_int1_int1 env1 1))
  (ATSINStmpset tmp130 (_ats2cljpre_stream_auxmain_48 env0 @tmp131))
  (ATSPMVtysum @tmp129 @tmp130)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_cross_stream_list[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret132 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_cross_stream_list
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_53__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_auxmain_51[arg0 arg1 arg2 arg3]
(
with-local-vars
[
;;knd = 0
  tmpret133 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_auxmain_51
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_52__closurerize arg0 arg1 arg2 arg3))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_52[env0 env1 env2 env3]
(
with-local-vars
[
;;knd = 0
  tmpret134 nil
  tmp135 nil
  tmp136 nil
  tmp137 nil
  tmp138 nil
  tmp139 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_52
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons env3)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       (ATSINStmpset tmp137 (ats2cljpre_cross_stream_list env1 env2))
       (ATSPMVlazyval_eval @tmp137)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp135 (ATSSELcon env3 0))
       (ATSINStmpset tmp136 (ATSSELcon env3 1))
       (ATSINStmpset tmp138 (ATSPMVtyrec env0 @tmp135))
       (ATSINStmpset tmp139 (_ats2cljpre_stream_auxmain_51 env0 env1 env2 @tmp136))
       (ATSPMVtysum @tmp138 @tmp139)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_53[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret140 nil
  tmp141 nil
  tmp142 nil
  tmp143 nil
  tmp144 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_53
  (ATSINStmpset tmp141 (ATSPMVlazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp141)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (if (ATSCKptrisnull @tmp141)
         (ATSINScaseof_fail "/Users/RyanKing/ATS2-contrib/contrib/libatscc/DATS/stream.dats: 6907(line=451, offs=1) -- 6999(line=453, offs=50)")
         (do
          (casefnx 4)
         )
       )
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp142 (ATSSELcon @tmp141 0))
       (ATSINStmpset tmp143 (ATSSELcon @tmp141 1))
       (ATSINStmpset tmp144 (_ats2cljpre_stream_auxmain_51 @tmp142 @tmp143 env1 env1))
       (ATSPMVlazyval_eval @tmp144)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_cross_stream_list0[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret145 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_cross_stream_list0
  (ats2cljpre_cross_stream_list arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2cloref_exn[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret146 nil
  tmp147 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2cloref_exn
  (ATSINStmpset tmp147 (ats2cljpre_ref arg0))
  (_ats2cljpre_stream_patsfun_56__closurerize @tmp147)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_56[env0]
(
with-local-vars
[
;;knd = 0
  tmpret148 nil
  tmp149 nil
  tmp150 nil
  tmp151 nil
  tmp152 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_56
  (ATSINStmpset tmp149 (ats2cljpre_ref_get_elt env0))
  (ATSINStmpset tmp150 (ATSPMVlazyval_eval @tmp149))
  (if (ATSCKptrisnull @tmp150) (ATSINScaseof_fail "/Users/RyanKing/ATS2-contrib/contrib/libatscc/DATS/stream.dats: 7300(line=479, offs=5) -- 7324(line=479, offs=29)"))
  (ATSINStmpset tmp151 (ATSSELcon @tmp150 0))
  (ATSINStmpset tmp152 (ATSSELcon @tmp150 1))
  (ATSINSmove1_void (ats2cljpre_ref_set_elt env0 @tmp152))
  @tmp151
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2cloref_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret154 nil
  tmp155 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2cloref_opt
  (ATSINStmpset tmp155 (ats2cljpre_ref arg0))
  (_ats2cljpre_stream_patsfun_58__closurerize @tmp155)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_58[env0]
(
with-local-vars
[
;;knd = 0
  tmpret156 nil
  tmp157 nil
  tmp158 nil
  tmp159 nil
  tmp160 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_58
  (ATSINStmpset tmp157 (ats2cljpre_ref_get_elt env0))
  (ATSINStmpset tmp158 (ATSPMVlazyval_eval @tmp157))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp158)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp159 (ATSSELcon @tmp158 0))
       (ATSINStmpset tmp160 (ATSSELcon @tmp158 1))
       (ATSINSmove1_void (ats2cljpre_ref_set_elt env0 @tmp160))
       (ATSPMVtysum @tmp159)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2cloref_last[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret162 nil
  tmp163 nil
  tmp164 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2cloref_last
  (ATSINStmpset tmp163 (ats2cljpre_ref arg0))
  (ATSINStmpset tmp164 (ats2cljpre_ref arg1))
  (_ats2cljpre_stream_patsfun_60__closurerize @tmp163 @tmp164)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_60[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret165 nil
  tmp166 nil
  tmp167 nil
  tmp168 nil
  tmp169 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_60
  (ATSINStmpset tmp166 (ats2cljpre_ref_get_elt env0))
  (ATSINStmpset tmp167 (ATSPMVlazyval_eval @tmp166))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp167)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       (ats2cljpre_ref_get_elt env1)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp168 (ATSSELcon @tmp167 0))
       (ATSINStmpset tmp169 (ATSSELcon @tmp167 1))
       (ATSINSmove1_void (ats2cljpre_ref_set_elt env0 @tmp169))
       (ATSINSmove1_void (ats2cljpre_ref_set_elt env1 @tmp168))
       @tmp168
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_take_while_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret172 nil
  tmp173 nil
  tmp174 nil
  tmp175 nil
  tmp176 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_take_while_cloref
  (ATSINStmpset tmp173 (ats2cljpre_stream_rtake_while_cloref arg0 arg1))
  (ATSINStmpset tmp174 (ATSSELboxrec @tmp173 0))
  (ATSINStmpset tmp175 (ATSSELboxrec @tmp173 1))
  (ATSINStmpset tmp176 (ats2cljpre_list_reverse @tmp175))
  (ATSPMVtyrec @tmp174 @tmp176)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_rtake_while_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret177 nil
  tmp185 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_rtake_while_cloref
  (ATSINStmpset tmp185 atscc2clj_null)
  (_ats2cljpre_stream_loop_63 arg1 arg0 0 @tmp185)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_loop_63[env0 arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmpret178 nil
  tmp179 nil
  tmp180 nil
  tmp181 nil
  tmp182 nil
  tmp183 nil
  tmp184 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_loop_63
    (ATSINStmpset tmp179 (ATSPMVlazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp179)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         (ATSPMVtyrec arg0 arg2)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp180 (ATSSELcon @tmp179 0))
         (ATSINStmpset tmp181 (ATSSELcon @tmp179 1))
         (ATSINStmpset tmp182 ((ATSfunclo_fclo env0) env0 arg1 @tmp180))
         (if @tmp182
           (do
            (ATSINStmpset tmp183 (ats2cljpre_add_int1_int1 arg1 1))
            (ATSINStmpset tmp184 (ATSPMVtysum @tmp180 arg2))
            ;; apy0 = @tmp181
            ;; apy1 = @tmp183
            ;; apy2 = @tmp184
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; arg2 = apy2
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_loop_63
            (_ats2cljpre_stream_loop_63 env0 @tmp181 @tmp183 @tmp184)
           ) ;; if-then
           (do
            (ATSPMVtyrec arg0 arg2)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret178;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_take_until_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret186 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_take_until_cloref
  (ats2cljpre_stream_take_while_cloref arg0 (_ats2cljpre_stream_patsfun_65__closurerize arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_65[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret187 nil
  tmp188 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_65
  (ATSINStmpset tmp188 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2cljpre_neg_bool0 @tmp188)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_rtake_until_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret189 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_rtake_until_cloref
  (ats2cljpre_stream_rtake_while_cloref arg0 (_ats2cljpre_stream_patsfun_67__closurerize arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_67[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret190 nil
  tmp191 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_67
  (ATSINStmpset tmp191 ((ATSfunclo_fclo env0) env0 arg0 arg1))
  (ats2cljpre_neg_bool0 @tmp191)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_list_xprod2[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret192 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_list_xprod2
  (_ats2cljpre_stream_auxlst_71 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_aux_69[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret193 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_aux_69
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_70__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_70[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret194 nil
  tmp195 nil
  tmp196 nil
  tmp197 nil
  tmp198 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_70
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons env1)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp195 (ATSSELcon env1 0))
       (ATSINStmpset tmp196 (ATSSELcon env1 1))
       (ATSINStmpset tmp197 (ATSPMVtyrec env0 @tmp195))
       (ATSINStmpset tmp198 (_ats2cljpre_stream_aux_69 env0 @tmp196))
       (ATSPMVtysum @tmp197 @tmp198)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_auxlst_71[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret199 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_auxlst_71
  (ATSPMVlazyval (_ats2cljpre_stream_patsfun_72__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_patsfun_72[env0 env1]
(
with-local-vars
[
;;knd = 0
  tmpret200 nil
  tmp201 nil
  tmp202 nil
  tmp203 nil
  tmp204 nil
  tmp205 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_patsfun_72
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons env0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp201 (ATSSELcon env0 0))
       (ATSINStmpset tmp202 (ATSSELcon env0 1))
       (ATSINStmpset tmp204 (_ats2cljpre_stream_aux_69 @tmp201 env1))
       (ATSINStmpset tmp205 (_ats2cljpre_stream_auxlst_71 @tmp202 env1))
       (ATSINStmpset tmp203 (ats2cljpre_stream_append @tmp204 @tmp205))
       (ATSPMVlazyval_eval @tmp203)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_stream_vt_aux_6)
(declare _ats2cljpre_stream_vt_patsfun_7)
(declare _ats2cljpre_stream_vt_auxmain_9)
(declare _ats2cljpre_stream_vt_patsfun_10)
(declare _ats2cljpre_stream_vt_loop_12)
(declare _ats2cljpre_stream_vt_aux_14)
(declare _ats2cljpre_stream_vt_loop_16)
(declare _ats2cljpre_stream_vt_auxmain_18)
(declare _ats2cljpre_stream_vt_patsfun_19)
(declare _ats2cljpre_stream_vt_auxmain_21)
(declare _ats2cljpre_stream_vt_patsfun_22)
(declare _ats2cljpre_stream_vt_auxmain_24)
(declare _ats2cljpre_stream_vt_patsfun_25)
(declare _ats2cljpre_stream_vt_patsfun_27)
(declare _ats2cljpre_stream_vt_auxmain_29)
(declare _ats2cljpre_stream_vt_patsfun_30)
(declare _ats2cljpre_stream_vt_patsfun_32)
(declare _ats2cljpre_stream_vt_loop_34)
(declare _ats2cljpre_stream_vt_patsfun_36)
(declare _ats2cljpre_stream_vt_loop_38)
(declare _ats2cljpre_stream_vt_patsfun_40)
(declare _ats2cljpre_stream_vt_loop_42)
(declare _ats2cljpre_stream_vt_patsfun_44)
(declare _ats2cljpre_stream_vt_loop_46)
(declare _ats2cljpre_stream_vt_patsfun_48)
(declare _ats2cljpre_stream_vt_auxmain_50)
(declare _ats2cljpre_stream_vt_patsfun_52)
(declare _ats2cljpre_stream_vt_auxmain_54)
(declare _ats2cljpre_stream_vt_patsfun_55)
(declare ats2cljpre_stream_vt_free)
(declare ats2cljpre_stream_vt2t)
(declare _ats2cljpre_stream_vt_aux_6)
(declare _ats2cljpre_stream_vt_patsfun_7)
(declare ats2cljpre_stream_vt_takeLte)
(declare _ats2cljpre_stream_vt_auxmain_9)
(declare _ats2cljpre_stream_vt_patsfun_10)
(declare ats2cljpre_stream_vt_length)
(declare _ats2cljpre_stream_vt_loop_12)
(declare ats2cljpre_stream2list_vt)
(declare _ats2cljpre_stream_vt_aux_14)
(declare ats2cljpre_stream2list_vt_rev)
(declare _ats2cljpre_stream_vt_loop_16)
(declare ats2cljpre_stream_vt_append)
(declare _ats2cljpre_stream_vt_auxmain_18)
(declare _ats2cljpre_stream_vt_patsfun_19)
(declare ats2cljpre_stream_vt_concat)
(declare _ats2cljpre_stream_vt_auxmain_21)
(declare _ats2cljpre_stream_vt_patsfun_22)
(declare ats2cljpre_stream_vt_map_cloref)
(declare _ats2cljpre_stream_vt_auxmain_24)
(declare _ats2cljpre_stream_vt_patsfun_25)
(declare ats2cljpre_stream_vt_map_method)
(declare _ats2cljpre_stream_vt_patsfun_27)
(declare ats2cljpre_stream_vt_filter_cloref)
(declare _ats2cljpre_stream_vt_auxmain_29)
(declare _ats2cljpre_stream_vt_patsfun_30)
(declare ats2cljpre_stream_vt_filter_method)
(declare _ats2cljpre_stream_vt_patsfun_32)
(declare ats2cljpre_stream_vt_exists_cloref)
(declare _ats2cljpre_stream_vt_loop_34)
(declare ats2cljpre_stream_vt_exists_method)
(declare _ats2cljpre_stream_vt_patsfun_36)
(declare ats2cljpre_stream_vt_forall_cloref)
(declare _ats2cljpre_stream_vt_loop_38)
(declare ats2cljpre_stream_vt_forall_method)
(declare _ats2cljpre_stream_vt_patsfun_40)
(declare ats2cljpre_stream_vt_foreach_cloref)
(declare _ats2cljpre_stream_vt_loop_42)
(declare ats2cljpre_stream_vt_foreach_method)
(declare _ats2cljpre_stream_vt_patsfun_44)
(declare ats2cljpre_stream_vt_iforeach_cloref)
(declare _ats2cljpre_stream_vt_loop_46)
(declare ats2cljpre_stream_vt_iforeach_method)
(declare _ats2cljpre_stream_vt_patsfun_48)
(declare ats2cljpre_stream_vt_rforeach_cloref)
(declare _ats2cljpre_stream_vt_auxmain_50)
(declare ats2cljpre_stream_vt_rforeach_method)
(declare _ats2cljpre_stream_vt_patsfun_52)
(declare ats2cljpre_stream_vt_tabulate_cloref)
(declare _ats2cljpre_stream_vt_auxmain_54)
(declare _ats2cljpre_stream_vt_patsfun_55)
;;;;;;


(defn
_ats2cljpre_stream_vt_patsfun_7__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_stream_vt_patsfun_7 (ATSCCget_1 _fcenvs_))) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_10__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_10 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_19__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_19 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_22__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_22 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_25__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_25 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_27__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_27 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_30__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_30 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_32__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_32 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_36__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_36 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_40__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_40 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_44__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_44 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_48__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_48 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_52__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_52 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_stream_vt_patsfun_55__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_stream_vt_patsfun_55 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


;;fun
(defn
 ats2cljpre_stream_vt_free[arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_free
  (ATSINSmove1_void (atspre_lazy_vt_free arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt2t[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret6 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt2t
  (_ats2cljpre_stream_vt_aux_6 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_aux_6[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_aux_6
  (ATSPMVlazyval (_ats2cljpre_stream_vt_patsfun_7__closurerize arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_7[env0]
(
with-local-vars
[
;;knd = 0
  tmpret8 nil
  tmp9 nil
  tmp10 nil
  tmp11 nil
  tmp12 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_7
  (ATSINStmpset tmp9 (ATSPMVllazyval_eval env0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp9)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp10 (ATSSELcon @tmp9 0))
       (ATSINStmpset tmp11 (ATSSELcon @tmp9 1))
       ;; ATSINSfreecon(@tmp9);
       (ATSINStmpset tmp12 (_ats2cljpre_stream_vt_aux_6 @tmp11))
       (ATSPMVtysum @tmp10 @tmp12)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_takeLte[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret13 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_takeLte
  (_ats2cljpre_stream_vt_auxmain_9 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_9[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret14 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_9
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_10__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_10[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret15 nil
  tmp16 nil
  tmp17 nil
  tmp18 nil
  tmp19 nil
  tmp20 nil
  tmp21 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_10
  (if arg0
    (do
     (ATSINStmpset tmp16 (ats2cljpre_gt_int1_int1 env1 0))
     (if @tmp16
       (do
        (ATSINStmpset tmp17 (ATSPMVllazyval_eval env0))
        (let[
          casefnx
          (fn casefnx[tmplab](case tmplab
            ;; ATSbranchseq_beg
            1 (do
             (if (ATSCKptriscons @tmp17)
               (casefnx 4)
               (do
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            2 (do
             atscc2clj_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            3 (do
             (casefnx 4)
            ) ;; end-of-branch
            4 (do
             (ATSINStmpset tmp18 (ATSSELcon @tmp17 0))
             (ATSINStmpset tmp19 (ATSSELcon @tmp17 1))
             ;; ATSINSfreecon(@tmp17);
             (ATSINStmpset tmp21 (ats2cljpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp20 (_ats2cljpre_stream_vt_auxmain_9 @tmp19 @tmp21))
             (ATSPMVtysum @tmp18 @tmp20)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-casefnx
         ] (casefnx 1)
        ) ;; end-of-let(casefnx)
       ) ;; if-then
       (do
        (ATSINSmove1_void (atspre_lazy_vt_free env0))
        atscc2clj_null
       ) ;; if-else
     )
    ) ;; if-then
    (do
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret24 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_length
  (_ats2cljpre_stream_vt_loop_12 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_12[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret25 nil
  tmp26 nil
  tmp28 nil
  tmp29 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_12
    (ATSINStmpset tmp26 (ATSPMVllazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp26)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp28 (ATSSELcon @tmp26 1))
         ;; ATSINSfreecon(@tmp26);
         (ATSINStmpset tmp29 (ats2cljpre_add_int1_int1 arg1 1))
         ;; apy0 = @tmp28
         ;; apy1 = @tmp29
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_12
         (_ats2cljpre_stream_vt_loop_12 @tmp28 @tmp29)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret25;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2list_vt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret30 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2list_vt
  (_ats2cljpre_stream_vt_aux_14 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_aux_14[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret31 nil
  tmp32 nil
  tmp33 nil
  tmp34 nil
  tmp35 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_aux_14
  (ATSINStmpset tmp32 (ATSPMVllazyval_eval arg0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp32)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp33 (ATSSELcon @tmp32 0))
       (ATSINStmpset tmp34 (ATSSELcon @tmp32 1))
       ;; ATSINSfreecon(@tmp32);
       (ATSINStmpset tmp35 (_ats2cljpre_stream_vt_aux_14 @tmp34))
       (ATSPMVtysum @tmp33 @tmp35)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream2list_vt_rev[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret36 nil
  tmp42 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream2list_vt_rev
  (ATSINStmpset tmp42 atscc2clj_null)
  (_ats2cljpre_stream_vt_loop_16 arg0 @tmp42)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_16[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret37 nil
  tmp38 nil
  tmp39 nil
  tmp40 nil
  tmp41 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_16
    (ATSINStmpset tmp38 (ATSPMVllazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp38)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg1
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp39 (ATSSELcon @tmp38 0))
         (ATSINStmpset tmp40 (ATSSELcon @tmp38 1))
         ;; ATSINSfreecon(@tmp38);
         (ATSINStmpset tmp41 (ATSPMVtysum @tmp39 arg1))
         ;; apy0 = @tmp40
         ;; apy1 = @tmp41
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_16
         (_ats2cljpre_stream_vt_loop_16 @tmp40 @tmp41)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret37;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret43 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_append
  (_ats2cljpre_stream_vt_auxmain_18 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_18[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret44 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_18
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_19__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_19[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret45 nil
  tmp46 nil
  tmp47 nil
  tmp48 nil
  tmp49 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_19
  (if arg0
    (do
     (ATSINStmpset tmp46 (ATSPMVllazyval_eval env0))
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons @tmp46)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          (ATSPMVllazyval_eval env1)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp47 (ATSSELcon @tmp46 0))
          (ATSINStmpset tmp48 (ATSSELcon @tmp46 1))
          ;; ATSINSfreecon(@tmp46);
          (ATSINStmpset tmp49 (_ats2cljpre_stream_vt_auxmain_18 @tmp48 env1))
          (ATSPMVtysum @tmp47 @tmp49)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_concat[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret52 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_concat
  (_ats2cljpre_stream_vt_auxmain_21 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_21[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret53 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_21
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_22__closurerize arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_22[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret54 nil
  tmp55 nil
  tmp56 nil
  tmp57 nil
  tmp58 nil
  tmp59 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_22
  (if arg0
    (do
     (ATSINStmpset tmp55 (ATSPMVllazyval_eval env0))
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons @tmp55)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp56 (ATSSELcon @tmp55 0))
          (ATSINStmpset tmp57 (ATSSELcon @tmp55 1))
          ;; ATSINSfreecon(@tmp55);
          (ATSINStmpset tmp59 (_ats2cljpre_stream_vt_auxmain_21 @tmp57))
          (ATSINStmpset tmp58 (ats2cljpre_stream_vt_append @tmp56 @tmp59))
          (ATSPMVllazyval_eval @tmp58)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
     (ATSINSmove1_void (atspre_lazy_vt_free env0))
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret61 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_map_cloref
  (_ats2cljpre_stream_vt_auxmain_24 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_24[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret62 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_24
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_25__closurerize env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_25[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret63 nil
  tmp64 nil
  tmp65 nil
  tmp66 nil
  tmp67 nil
  tmp68 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_25
  (if arg0
    (do
     (ATSINStmpset tmp64 (ATSPMVllazyval_eval env1))
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons @tmp64)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp65 (ATSSELcon @tmp64 0))
          (ATSINStmpset tmp66 (ATSSELcon @tmp64 1))
          ;; ATSINSfreecon(@tmp64);
          (ATSINStmpset tmp67 ((ATSfunclo_fclo env0) env0 @tmp65))
          (ATSINStmpset tmp68 (_ats2cljpre_stream_vt_auxmain_24 env0 @tmp66))
          (ATSPMVtysum @tmp67 @tmp68)
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret70 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_map_method
  (_ats2cljpre_stream_vt_patsfun_27__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_27[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret71 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_27
  (ats2cljpre_stream_vt_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_filter_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret72 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_filter_cloref
  (_ats2cljpre_stream_vt_auxmain_29 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_29[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret73 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_29
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_30__closurerize env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_30[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret74 nil
  tmp75 nil
  tmp76 nil
  tmp77 nil
  tmp78 nil
  tmp79 nil
  tmp80 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_30
  (if arg0
    (do
     (ATSINStmpset tmp75 (ATSPMVllazyval_eval env1))
     (let[
       casefnx
       (fn casefnx[tmplab](case tmplab
         ;; ATSbranchseq_beg
         1 (do
          (if (ATSCKptriscons @tmp75)
            (casefnx 4)
            (do
             (casefnx 2)
            )
          )
         ) ;; end-of-branch
         2 (do
          atscc2clj_null
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; ATSbranchseq_beg
         3 (do
          (casefnx 4)
         ) ;; end-of-branch
         4 (do
          (ATSINStmpset tmp76 (ATSSELcon @tmp75 0))
          (ATSINStmpset tmp77 (ATSSELcon @tmp75 1))
          ;; ATSINSfreecon(@tmp75);
          (ATSINStmpset tmp78 ((ATSfunclo_fclo env0) env0 @tmp76))
          (if @tmp78
            (do
             (ATSINStmpset tmp79 (_ats2cljpre_stream_vt_auxmain_29 env0 @tmp77))
             (ATSPMVtysum @tmp76 @tmp79)
            ) ;; if-then
            (do
             (ATSINStmpset tmp80 (_ats2cljpre_stream_vt_auxmain_29 env0 @tmp77))
             (ATSPMVllazyval_eval @tmp80)
            ) ;; if-else
          )
         ) ;; end-of-branch
         ;; ATSbranchseq_end
         ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
        ) ;; end-of-case
       ) ;; end-of-casefnx
      ] (casefnx 1)
     ) ;; end-of-let(casefnx)
    ) ;; if-then
    (do
     (ATSINSmove1_void (atspre_lazy_vt_free env1))
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_filter_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret82 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_filter_method
  (_ats2cljpre_stream_vt_patsfun_32__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_32[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret83 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_32
  (ats2cljpre_stream_vt_filter_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_exists_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret84 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_exists_cloref
  (_ats2cljpre_stream_vt_loop_34 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_34[env0 arg0]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
  tmpret85 nil
  tmp86 nil
  tmp87 nil
  tmp88 nil
  tmp89 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_34
    (ATSINStmpset tmp86 (ATSPMVllazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp86)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_false
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp87 (ATSSELcon @tmp86 0))
         (ATSINStmpset tmp88 (ATSSELcon @tmp86 1))
         ;; ATSINSfreecon(@tmp86);
         (ATSINStmpset tmp89 ((ATSfunclo_fclo env0) env0 @tmp87))
         (if @tmp89
           (do
            (ATSINSmove1_void (atspre_lazy_vt_free @tmp88))
            atscc2clj_true
           ) ;; if-then
           (do
            ;; apy0 = @tmp88
            ;; arg0 = apy0
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_34
            (_ats2cljpre_stream_vt_loop_34 env0 @tmp88)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret85;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret91 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_exists_method
  (_ats2cljpre_stream_vt_patsfun_36__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_36[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret92 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_36
  (ats2cljpre_stream_vt_exists_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_forall_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret93 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_forall_cloref
  (_ats2cljpre_stream_vt_loop_38 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_38[env0 arg0]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
  tmpret94 nil
  tmp95 nil
  tmp96 nil
  tmp97 nil
  tmp98 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_38
    (ATSINStmpset tmp95 (ATSPMVllazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp95)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_true
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp96 (ATSSELcon @tmp95 0))
         (ATSINStmpset tmp97 (ATSSELcon @tmp95 1))
         ;; ATSINSfreecon(@tmp95);
         (ATSINStmpset tmp98 ((ATSfunclo_fclo env0) env0 @tmp96))
         (if @tmp98
           (do
            ;; apy0 = @tmp97
            ;; arg0 = apy0
            ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_38
            (_ats2cljpre_stream_vt_loop_38 env0 @tmp97)
           ) ;; if-then
           (do
            (ATSINSmove1_void (atspre_lazy_vt_free @tmp97))
            atscc2clj_false
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret94;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret100 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_forall_method
  (_ats2cljpre_stream_vt_patsfun_40__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_40[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret101 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_40
  (ats2cljpre_stream_vt_forall_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_foreach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_foreach_cloref
  (ATSINSmove1_void (_ats2cljpre_stream_vt_loop_42 arg1 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_42[env0 arg0]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
  tmp104 nil
  tmp105 nil
  tmp106 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_42
    (ATSINStmpset tmp104 (ATSPMVllazyval_eval arg0))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp104)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp105 (ATSSELcon @tmp104 0))
         (ATSINStmpset tmp106 (ATSSELcon @tmp104 1))
         ;; ATSINSfreecon(@tmp104);
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 @tmp105))
         ;; apy0 = @tmp106
         ;; arg0 = apy0
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_42
         (_ats2cljpre_stream_vt_loop_42 env0 @tmp106)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret108 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_foreach_method
  (_ats2cljpre_stream_vt_patsfun_44__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_44[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_44
  (ATSINSmove1_void (ats2cljpre_stream_vt_foreach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_iforeach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_iforeach_cloref
  (ATSINSmove1_void (_ats2cljpre_stream_vt_loop_46 arg1 0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_loop_46[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp112 nil
  tmp113 nil
  tmp114 nil
  tmp116 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_stream_vt_loop_46
    (ATSINStmpset tmp112 (ATSPMVllazyval_eval arg1))
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons @tmp112)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         ATSINSmove0_void
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp113 (ATSSELcon @tmp112 0))
         (ATSINStmpset tmp114 (ATSSELcon @tmp112 1))
         ;; ATSINSfreecon(@tmp112);
         (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 arg0 @tmp113))
         (ATSINStmpset tmp116 (ats2cljpre_add_int1_int1 arg0 1))
         ;; apy0 = @tmp116
         ;; apy1 = @tmp114
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_stream_vt_loop_46
         (_ats2cljpre_stream_vt_loop_46 env0 @tmp116 @tmp114)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_iforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret117 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_iforeach_method
  (_ats2cljpre_stream_vt_patsfun_48__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_48[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_48
  (ATSINSmove1_void (ats2cljpre_stream_vt_iforeach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_rforeach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_rforeach_cloref
  (ATSINSmove1_void (_ats2cljpre_stream_vt_auxmain_50 arg1 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_50[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmp121 nil
  tmp122 nil
  tmp123 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_50
  (ATSINStmpset tmp121 (ATSPMVllazyval_eval arg0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp121)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       ATSINSmove0_void
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp122 (ATSSELcon @tmp121 0))
       (ATSINStmpset tmp123 (ATSSELcon @tmp121 1))
       ;; ATSINSfreecon(@tmp121);
       (ATSINSmove1_void (_ats2cljpre_stream_vt_auxmain_50 env0 @tmp123))
       (ATSINSmove1_void ((ATSfunclo_fclo env0) env0 @tmp122))
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_rforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret125 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_rforeach_method
  (_ats2cljpre_stream_vt_patsfun_52__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_52[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_52
  (ATSINSmove1_void (ats2cljpre_stream_vt_rforeach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_tabulate_cloref[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret127 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_tabulate_cloref
  (_ats2cljpre_stream_vt_auxmain_54 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_auxmain_54[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret128 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_auxmain_54
  (ATSPMVllazyval (_ats2cljpre_stream_vt_patsfun_55__closurerize env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_stream_vt_patsfun_55[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret129 nil
  tmp130 nil
  tmp131 nil
  tmp132 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_stream_vt_patsfun_55
  (if arg0
    (do
     (ATSINStmpset tmp130 ((ATSfunclo_fclo env0) env0 env1))
     (ATSINStmpset tmp132 (ats2cljpre_add_int1_int1 env1 1))
     (ATSINStmpset tmp131 (_ats2cljpre_stream_vt_auxmain_54 env0 @tmp132))
     (ATSPMVtysum @tmp130 @tmp131)
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_intrange_loop_2)
(declare _ats2cljpre_intrange_patsfun_4)
(declare _ats2cljpre_intrange_patsfun_9)
(declare _ats2cljpre_intrange_patsfun_11)
(declare _ats2cljpre_intrange_patsfun_13)
(declare _ats2cljpre_intrange_patsfun_16)
(declare _ats2cljpre_intrange_aux_18)
(declare _ats2cljpre_intrange_patsfun_20)
(declare _ats2cljpre_intrange_patsfun_23)
(declare _ats2cljpre_intrange_aux_25)
(declare _ats2cljpre_intrange_patsfun_26)
(declare _ats2cljpre_intrange_patsfun_28)
(declare _ats2cljpre_intrange_aux_30)
(declare _ats2cljpre_intrange_patsfun_31)
(declare _ats2cljpre_intrange_patsfun_33)
(declare _ats2cljpre_intrange_loop_38)
(declare _ats2cljpre_intrange_patsfun_40)
(declare _ats2cljpre_intrange_loop_42)
(declare _ats2cljpre_intrange_patsfun_44)
(declare _ats2cljpre_intrange_loop_46)
(declare _ats2cljpre_intrange_patsfun_48)
(declare _ats2cljpre_intrange_loop_50)
(declare _ats2cljpre_intrange_patsfun_52)
(declare _ats2cljpre_intrange_loop1_54)
(declare _ats2cljpre_intrange_loop1_57)
(declare _ats2cljpre_intrange_loop1_60)
(declare ats2cljpre_int_repeat_lazy)
(declare ats2cljpre_int_repeat_cloref)
(declare _ats2cljpre_intrange_loop_2)
(declare ats2cljpre_int_repeat_method)
(declare _ats2cljpre_intrange_patsfun_4)
(declare ats2cljpre_int_exists_cloref)
(declare ats2cljpre_int_forall_cloref)
(declare ats2cljpre_int_foreach_cloref)
(declare ats2cljpre_int_exists_method)
(declare _ats2cljpre_intrange_patsfun_9)
(declare ats2cljpre_int_forall_method)
(declare _ats2cljpre_intrange_patsfun_11)
(declare ats2cljpre_int_foreach_method)
(declare _ats2cljpre_intrange_patsfun_13)
(declare ats2cljpre_int_foldleft_cloref)
(declare ats2cljpre_int_foldleft_method)
(declare _ats2cljpre_intrange_patsfun_16)
(declare ats2cljpre_int_list_map_cloref)
(declare _ats2cljpre_intrange_aux_18)
(declare ats2cljpre_int_list_map_method)
(declare _ats2cljpre_intrange_patsfun_20)
(declare ats2cljpre_int_list0_map_cloref)
(declare ats2cljpre_int_list0_map_method)
(declare _ats2cljpre_intrange_patsfun_23)
(declare ats2cljpre_int_stream_map_cloref)
(declare _ats2cljpre_intrange_aux_25)
(declare _ats2cljpre_intrange_patsfun_26)
(declare ats2cljpre_int_stream_map_method)
(declare _ats2cljpre_intrange_patsfun_28)
(declare ats2cljpre_int_stream_vt_map_cloref)
(declare _ats2cljpre_intrange_aux_30)
(declare _ats2cljpre_intrange_patsfun_31)
(declare ats2cljpre_int_stream_vt_map_method)
(declare _ats2cljpre_intrange_patsfun_33)
(declare ats2cljpre_int2_exists_cloref)
(declare ats2cljpre_int2_forall_cloref)
(declare ats2cljpre_int2_foreach_cloref)
(declare ats2cljpre_intrange_exists_cloref)
(declare _ats2cljpre_intrange_loop_38)
(declare ats2cljpre_intrange_exists_method)
(declare _ats2cljpre_intrange_patsfun_40)
(declare ats2cljpre_intrange_forall_cloref)
(declare _ats2cljpre_intrange_loop_42)
(declare ats2cljpre_intrange_forall_method)
(declare _ats2cljpre_intrange_patsfun_44)
(declare ats2cljpre_intrange_foreach_cloref)
(declare _ats2cljpre_intrange_loop_46)
(declare ats2cljpre_intrange_foreach_method)
(declare _ats2cljpre_intrange_patsfun_48)
(declare ats2cljpre_intrange_foldleft_cloref)
(declare _ats2cljpre_intrange_loop_50)
(declare ats2cljpre_intrange_foldleft_method)
(declare _ats2cljpre_intrange_patsfun_52)
(declare ats2cljpre_intrange2_exists_cloref)
(declare _ats2cljpre_intrange_loop1_54)
(declare ats2cljpre_intrange2_forall_cloref)
(declare _ats2cljpre_intrange_loop1_57)
(declare ats2cljpre_intrange2_foreach_cloref)
(declare _ats2cljpre_intrange_loop1_60)
;;;;;;


(defn
_ats2cljpre_intrange_patsfun_4__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_4 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_9__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_9 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_11__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_11 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_13__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_13 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_16__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_16 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_20__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_20 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_23__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_23 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_26__closurerize[xenv0 xenv1 xenv2]
;;%{
  (list (fn[_fcenvs_](_ats2cljpre_intrange_patsfun_26 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_))) xenv0 xenv1 xenv2)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_28__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_28 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_31__closurerize[xenv0 xenv1 xenv2]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_31 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_) xarg0)) xenv0 xenv1 xenv2)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_33__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_33 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_40__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_40 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_44__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_44 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_48__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_48 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_intrange_patsfun_52__closurerize[xenv0 xenv1 xenv2]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_intrange_patsfun_52 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) (ATSCCget_3 _fcenvs_) xarg0)) xenv0 xenv1 xenv2)
;;%}
) ;; end-of-defn


;;fun
(defn
 ats2cljpre_int_repeat_lazy[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmp1 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_repeat_lazy
  (ATSINStmpset tmp1 (ats2cljpre_lazy2cloref arg1))
  (ATSINSmove1_void (ats2cljpre_int_repeat_cloref arg0 @tmp1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_repeat_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_repeat_cloref
  (ATSINSmove1_void (_ats2cljpre_intrange_loop_2 arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop_2[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmp4 nil
  tmp6 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_intrange_loop_2
    (ATSINStmpset tmp4 (ats2cljpre_gt_int0_int0 arg0 0))
    (if @tmp4
      (do
       (ATSINSmove1_void ((ATSfunclo_fclo arg1) arg1))
       (ATSINStmpset tmp6 (ats2cljpre_sub_int0_int0 arg0 1))
       ;; apy0 = @tmp6
       ;; apy1 = arg1
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop_2
       (recur @tmp6 arg1)
      ) ;; if-then
      (do
       ATSINSmove0_void
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_repeat_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_repeat_method
  (_ats2cljpre_intrange_patsfun_4__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_4[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_4
  (ATSINSmove1_void (ats2cljpre_int_repeat_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_exists_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret9 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_exists_cloref
  (ats2cljpre_intrange_exists_cloref 0 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_forall_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret10 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_forall_cloref
  (ats2cljpre_intrange_forall_cloref 0 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_foreach_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_foreach_cloref
  (ATSINSmove1_void (ats2cljpre_intrange_foreach_cloref 0 arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret12 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_exists_method
  (_ats2cljpre_intrange_patsfun_9__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_9[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret13 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_9
  (ats2cljpre_int_exists_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret14 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_forall_method
  (_ats2cljpre_intrange_patsfun_11__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_11[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret15 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_11
  (ats2cljpre_int_forall_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret16 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_foreach_method
  (_ats2cljpre_intrange_patsfun_13__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_13[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_13
  (ATSINSmove1_void (ats2cljpre_int_foreach_cloref env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_foldleft_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret18 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_foldleft_cloref
  (ats2cljpre_intrange_foldleft_cloref 0 arg0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_foldleft_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret19 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_foldleft_method
  (_ats2cljpre_intrange_patsfun_16__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_16[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret20 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_16
  (ats2cljpre_int_foldleft_cloref env0 env1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_list_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret21 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_list_map_cloref
  (_ats2cljpre_intrange_aux_18 arg0 arg1 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_aux_18[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret22 nil
  tmp23 nil
  tmp24 nil
  tmp25 nil
  tmp26 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_aux_18
  (ATSINStmpset tmp23 (ats2cljpre_lt_int1_int1 arg0 env0))
  (if @tmp23
    (do
     (ATSINStmpset tmp24 ((ATSfunclo_fclo env1) env1 arg0))
     (ATSINStmpset tmp26 (ats2cljpre_add_int1_int1 arg0 1))
     (ATSINStmpset tmp25 (_ats2cljpre_intrange_aux_18 env0 env1 @tmp26))
     (ATSPMVtysum @tmp24 @tmp25)
    ) ;; if-then
    (do
     atscc2clj_null
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_list_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret27 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_list_map_method
  (_ats2cljpre_intrange_patsfun_20__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_20[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret28 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_20
  (ats2cljpre_int_list_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_list0_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret29 nil
  tmp30 nil
  tmp31 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_list0_map_cloref
  (ATSINStmpset tmp30 (ats2cljpre_gte_int1_int1 arg0 0))
  (if @tmp30
    (do
     (ATSINStmpset tmp31 (ats2cljpre_int_list_map_cloref arg0 arg1))
     @tmp31
    ) ;; if-then
    (do
     atscc2clj_null
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_list0_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret32 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_list0_map_method
  (_ats2cljpre_intrange_patsfun_23__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_23[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret33 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_23
  (ats2cljpre_int_list0_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_stream_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret34 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_stream_map_cloref
  (_ats2cljpre_intrange_aux_25 arg0 arg1 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_aux_25[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret35 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_aux_25
  (ATSPMVlazyval (_ats2cljpre_intrange_patsfun_26__closurerize env0 env1 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_26[env0 env1 env2]
(
with-local-vars
[
;;knd = 0
  tmpret36 nil
  tmp37 nil
  tmp38 nil
  tmp39 nil
  tmp40 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_26
  (ATSINStmpset tmp37 (ats2cljpre_lt_int1_int1 env2 env0))
  (if @tmp37
    (do
     (ATSINStmpset tmp38 ((ATSfunclo_fclo env1) env1 env2))
     (ATSINStmpset tmp40 (ats2cljpre_add_int1_int1 env2 1))
     (ATSINStmpset tmp39 (_ats2cljpre_intrange_aux_25 env0 env1 @tmp40))
     (ATSPMVtysum @tmp38 @tmp39)
    ) ;; if-then
    (do
     atscc2clj_null
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_stream_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret41 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_stream_map_method
  (_ats2cljpre_intrange_patsfun_28__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_28[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret42 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_28
  (ats2cljpre_int_stream_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_stream_vt_map_cloref[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret43 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_stream_vt_map_cloref
  (_ats2cljpre_intrange_aux_30 arg0 arg1 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_aux_30[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret44 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_aux_30
  (ATSPMVllazyval (_ats2cljpre_intrange_patsfun_31__closurerize env0 env1 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_31[env0 env1 env2 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret45 nil
  tmp46 nil
  tmp47 nil
  tmp48 nil
  tmp49 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_31
  (if arg0
    (do
     (ATSINStmpset tmp46 (ats2cljpre_lt_int1_int1 env2 env0))
     (if @tmp46
       (do
        (ATSINStmpset tmp47 ((ATSfunclo_fclo env1) env1 env2))
        (ATSINStmpset tmp49 (ats2cljpre_add_int1_int1 env2 1))
        (ATSINStmpset tmp48 (_ats2cljpre_intrange_aux_30 env0 env1 @tmp49))
        (ATSPMVtysum @tmp47 @tmp48)
       ) ;; if-then
       (do
        atscc2clj_null
       ) ;; if-else
     )
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int_stream_vt_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret50 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int_stream_vt_map_method
  (_ats2cljpre_intrange_patsfun_33__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_33[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret51 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_33
  (ats2cljpre_int_stream_vt_map_cloref env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int2_exists_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret52 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int2_exists_cloref
  (ats2cljpre_intrange2_exists_cloref 0 arg0 0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int2_forall_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret53 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int2_forall_cloref
  (ats2cljpre_intrange2_forall_cloref 0 arg0 0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_int2_foreach_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_int2_foreach_cloref
  (ATSINSmove1_void (ats2cljpre_intrange2_foreach_cloref 0 arg0 0 arg1 arg2))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_exists_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret55 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_exists_cloref
  (_ats2cljpre_intrange_loop_38 arg0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop_38[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmpret56 nil
  tmp57 nil
  tmp58 nil
  tmp59 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_intrange_loop_38
    (ATSINStmpset tmp57 (ats2cljpre_lt_int0_int0 arg0 arg1))
    (if @tmp57
      (do
       (ATSINStmpset tmp58 ((ATSfunclo_fclo arg2) arg2 arg0))
       (if @tmp58
         (do
          atscc2clj_true
         ) ;; if-then
         (do
          (ATSINStmpset tmp59 (ats2cljpre_add_int0_int0 arg0 1))
          ;; apy0 = @tmp59
          ;; apy1 = arg1
          ;; apy2 = arg2
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; arg2 = apy2
          ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop_38
          (recur @tmp59 arg1 arg2)
         ) ;; if-else
       )
      ) ;; if-then
      (do
       atscc2clj_false
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret56;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret60 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_exists_method
  (_ats2cljpre_intrange_patsfun_40__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_40[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret61 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_40
  (ats2cljpre_intrange_exists_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_forall_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret62 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_forall_cloref
  (_ats2cljpre_intrange_loop_42 arg0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop_42[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmpret63 nil
  tmp64 nil
  tmp65 nil
  tmp66 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_intrange_loop_42
    (ATSINStmpset tmp64 (ats2cljpre_lt_int0_int0 arg0 arg1))
    (if @tmp64
      (do
       (ATSINStmpset tmp65 ((ATSfunclo_fclo arg2) arg2 arg0))
       (if @tmp65
         (do
          (ATSINStmpset tmp66 (ats2cljpre_add_int0_int0 arg0 1))
          ;; apy0 = @tmp66
          ;; apy1 = arg1
          ;; apy2 = arg2
          ;; arg0 = apy0
          ;; arg1 = apy1
          ;; arg2 = apy2
          ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop_42
          (recur @tmp66 arg1 arg2)
         ) ;; if-then
         (do
          atscc2clj_false
         ) ;; if-else
       )
      ) ;; if-then
      (do
       atscc2clj_true
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret63;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret67 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_forall_method
  (_ats2cljpre_intrange_patsfun_44__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_44[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret68 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_44
  (ats2cljpre_intrange_forall_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_foreach_cloref[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_foreach_cloref
  (ATSINSmove1_void (_ats2cljpre_intrange_loop_46 arg0 arg1 arg2))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop_46[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
  tmp71 nil
  tmp73 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
     arg2 arg2
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_intrange_loop_46
    (ATSINStmpset tmp71 (ats2cljpre_lt_int0_int0 arg0 arg1))
    (if @tmp71
      (do
       (ATSINSmove1_void ((ATSfunclo_fclo arg2) arg2 arg0))
       (ATSINStmpset tmp73 (ats2cljpre_add_int0_int0 arg0 1))
       ;; apy0 = @tmp73
       ;; apy1 = arg1
       ;; apy2 = arg2
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop_46
       (recur @tmp73 arg1 arg2)
      ) ;; if-then
      (do
       ATSINSmove0_void
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret74 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_foreach_method
  (_ats2cljpre_intrange_patsfun_48__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_48[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_48
  (ATSINSmove1_void (ats2cljpre_intrange_foreach_cloref (ATSSELboxrec env0 0) (ATSSELboxrec env0 1) arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_foldleft_cloref[arg0 arg1 arg2 arg3]
(
with-local-vars
[
;;knd = 0
  tmpret76 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_foldleft_cloref
  (_ats2cljpre_intrange_loop_50 arg3 arg0 arg1 arg2 arg3)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop_50[env0 arg0 arg1 arg2 arg3]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
  tmpret77 nil
  tmp78 nil
  tmp79 nil
  tmp80 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_intrange_loop_50
    (ATSINStmpset tmp78 (ats2cljpre_lt_int0_int0 arg0 arg1))
    (if @tmp78
      (do
       (ATSINStmpset tmp79 (ats2cljpre_add_int0_int0 arg0 1))
       (ATSINStmpset tmp80 ((ATSfunclo_fclo arg3) arg3 arg2 arg0))
       ;; apy0 = @tmp79
       ;; apy1 = arg1
       ;; apy2 = @tmp80
       ;; apy3 = env0
       ;; arg0 = apy0
       ;; arg1 = apy1
       ;; arg2 = apy2
       ;; arg3 = apy3
       ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop_50
       (recur env0 @tmp79 arg1 @tmp80 env0)
      ) ;; if-then
      (do
       arg2
      ) ;; if-else
    )
    ;; if (funlab_clj > 0) continue; else ;; return tmpret77;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange_foldleft_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmp81 nil
  tmp82 nil
  tmpret83 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange_foldleft_method
  (ATSINStmpset tmp81 (ATSSELboxrec arg0 0))
  (ATSINStmpset tmp82 (ATSSELboxrec arg0 1))
  (_ats2cljpre_intrange_patsfun_52__closurerize @tmp81 @tmp82 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_patsfun_52[env0 env1 env2 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret84 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_intrange_patsfun_52
  (ats2cljpre_intrange_foldleft_cloref env0 env1 env2 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange2_exists_cloref[arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 0
  tmpret85 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange2_exists_cloref
  (_ats2cljpre_intrange_loop1_54 arg2 arg3 arg4 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop1_54[env0 env1 env2 arg0 arg1 arg2 arg3 arg4]
(declare
 _ats2cljpre_intrange_loop1_54__
)
(_ats2cljpre_intrange_loop1_54__ 1 env0 env1 env2 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(defn
_ats2cljpre_intrange_loop1_54__[funlab env0 env1 env2 arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 2
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
;;apy4 nil
  tmpret86 nil
  tmp87 nil
;;a2rg0 nil
;;a2rg1 nil
;;a2rg2 nil
;;a2rg3 nil
;;a2rg4 nil
;;a2py0 nil
;;a2py1 nil
;;a2py2 nil
;;a2py3 nil
;;a2py4 nil
  tmpret88 nil
  tmp89 nil
  tmp90 nil
  tmp91 nil
  tmp92 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; funlab_clj = 1;
  ;while(true){
   (loop [
     funlab
     funlab
     env0 env0
     env1 env1
     env2 env2
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
     arg4 arg4
    ] ;switch(funlab_clj) {
    (case funlab
      ;case 1: {
      1 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp87 (ats2cljpre_lt_int0_int0 arg0 arg1))
        (if @tmp87
          (do
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = env2
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_55
           (recur 2 env0 env1 env2 arg0 arg1 arg2 arg3 env2)
          ) ;; if-then
          (do
           atscc2clj_false
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return tmpret86;
      ) ;} // end-of-case
      ;case 2: {
      2 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp89 (ats2cljpre_lt_int0_int0 arg2 arg3))
        (if @tmp89
          (do
           (ATSINStmpset tmp90 ((ATSfunclo_fclo arg4) arg4 arg0 arg2))
           (if @tmp90
             (do
              atscc2clj_true
             ) ;; if-then
             (do
              (ATSINStmpset tmp91 (ats2cljpre_add_int0_int0 arg2 1))
              ;; a2py0 = arg0
              ;; a2py1 = arg1
              ;; a2py2 = @tmp91
              ;; a2py3 = arg3
              ;; a2py4 = arg4
              ;; a2rg0 = a2py0
              ;; a2rg1 = a2py1
              ;; a2rg2 = a2py2
              ;; a2rg3 = a2py3
              ;; a2rg4 = a2py4
              ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_55
              (recur 2 env0 env1 env2 arg0 arg1 @tmp91 arg3 arg4)
             ) ;; if-else
           )
          ) ;; if-then
          (do
           (ATSINStmpset tmp92 (ats2cljpre_add_int0_int0 arg0 1))
           ;; apy0 = @tmp92
           ;; apy1 = arg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = arg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop1_54
           (recur 1 env0 env1 env2 @tmp92 arg1 env0 env1 arg4)
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return tmpret88;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange2_forall_cloref[arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 0
  tmpret93 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange2_forall_cloref
  (_ats2cljpre_intrange_loop1_57 arg2 arg3 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop1_57[env0 env1 arg0 arg1 arg2 arg3 arg4]
(declare
 _ats2cljpre_intrange_loop1_57__
)
(_ats2cljpre_intrange_loop1_57__ 1 env0 env1 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(defn
_ats2cljpre_intrange_loop1_57__[funlab env0 env1 arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 2
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
;;apy4 nil
  tmpret94 nil
  tmp95 nil
;;a2rg0 nil
;;a2rg1 nil
;;a2rg2 nil
;;a2rg3 nil
;;a2rg4 nil
;;a2py0 nil
;;a2py1 nil
;;a2py2 nil
;;a2py3 nil
;;a2py4 nil
  tmpret96 nil
  tmp97 nil
  tmp98 nil
  tmp99 nil
  tmp100 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; funlab_clj = 1;
  ;while(true){
   (loop [
     funlab
     funlab
     env0 env0
     env1 env1
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
     arg4 arg4
    ] ;switch(funlab_clj) {
    (case funlab
      ;case 1: {
      1 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp95 (ats2cljpre_lt_int0_int0 arg0 arg1))
        (if @tmp95
          (do
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = arg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_58
           (recur 2 env0 env1 arg0 arg1 arg2 arg3 arg4)
          ) ;; if-then
          (do
           atscc2clj_true
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return tmpret94;
      ) ;} // end-of-case
      ;case 2: {
      2 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp97 (ats2cljpre_lt_int0_int0 arg2 arg3))
        (if @tmp97
          (do
           (ATSINStmpset tmp98 ((ATSfunclo_fclo arg4) arg4 arg0 arg2))
           (if @tmp98
             (do
              (ATSINStmpset tmp99 (ats2cljpre_add_int0_int0 arg2 1))
              ;; a2py0 = arg0
              ;; a2py1 = arg1
              ;; a2py2 = @tmp99
              ;; a2py3 = arg3
              ;; a2py4 = arg4
              ;; a2rg0 = a2py0
              ;; a2rg1 = a2py1
              ;; a2rg2 = a2py2
              ;; a2rg3 = a2py3
              ;; a2rg4 = a2py4
              ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_58
              (recur 2 env0 env1 arg0 arg1 @tmp99 arg3 arg4)
             ) ;; if-then
             (do
              atscc2clj_false
             ) ;; if-else
           )
          ) ;; if-then
          (do
           (ATSINStmpset tmp100 (ats2cljpre_add_int0_int0 arg0 1))
           ;; apy0 = @tmp100
           ;; apy1 = arg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = arg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop1_57
           (recur 1 env0 env1 @tmp100 arg1 env0 env1 arg4)
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return tmpret96;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_intrange2_foreach_cloref[arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_intrange2_foreach_cloref
  (ATSINSmove1_void (_ats2cljpre_intrange_loop1_60 arg2 arg3 arg0 arg1 arg2 arg3 arg4))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_intrange_loop1_60[env0 env1 arg0 arg1 arg2 arg3 arg4]
(declare
 _ats2cljpre_intrange_loop1_60__
)
(_ats2cljpre_intrange_loop1_60__ 1 env0 env1 arg0 arg1 arg2 arg3 arg4)
) ;; end-of-fun
(defn
_ats2cljpre_intrange_loop1_60__[funlab env0 env1 arg0 arg1 arg2 arg3 arg4]
(
with-local-vars
[
;;knd = 2
;;apy0 nil
;;apy1 nil
;;apy2 nil
;;apy3 nil
;;apy4 nil
  tmp103 nil
;;a2rg0 nil
;;a2rg1 nil
;;a2rg2 nil
;;a2rg3 nil
;;a2rg4 nil
;;a2py0 nil
;;a2py1 nil
;;a2py2 nil
;;a2py3 nil
;;a2py4 nil
  tmp105 nil
  tmp107 nil
  tmp108 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; funlab_clj = 1;
  ;while(true){
   (loop [
     funlab
     funlab
     env0 env0
     env1 env1
     arg0 arg0
     arg1 arg1
     arg2 arg2
     arg3 arg3
     arg4 arg4
    ] ;switch(funlab_clj) {
    (case funlab
      ;case 1: {
      1 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp103 (ats2cljpre_lt_int0_int0 arg0 arg1))
        (if @tmp103
          (do
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = arg2
           ;; a2py3 = arg3
           ;; a2py4 = arg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_61
           (recur 2 env0 env1 arg0 arg1 arg2 arg3 arg4)
          ) ;; if-then
          (do
           ATSINSmove0_void
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
      ) ;} // end-of-case
      ;case 2: {
      2 (do
        ;; funlab_clj = 0;
        (ATSINStmpset tmp105 (ats2cljpre_lt_int0_int0 arg2 arg3))
        (if @tmp105
          (do
           (ATSINSmove1_void ((ATSfunclo_fclo arg4) arg4 arg0 arg2))
           (ATSINStmpset tmp107 (ats2cljpre_add_int0_int0 arg2 1))
           ;; a2py0 = arg0
           ;; a2py1 = arg1
           ;; a2py2 = @tmp107
           ;; a2py3 = arg3
           ;; a2py4 = arg4
           ;; a2rg0 = a2py0
           ;; a2rg1 = a2py1
           ;; a2rg2 = a2py2
           ;; a2rg3 = a2py3
           ;; a2rg4 = a2py4
           ;; funlab_clj = 2; // __patsflab__ats2cljpre_intrange_loop2_61
           (recur 2 env0 env1 arg0 arg1 @tmp107 arg3 arg4)
          ) ;; if-then
          (do
           (ATSINStmpset tmp108 (ats2cljpre_succ_int0 arg0))
           ;; apy0 = @tmp108
           ;; apy1 = arg1
           ;; apy2 = env0
           ;; apy3 = env1
           ;; apy4 = arg4
           ;; arg0 = apy0
           ;; arg1 = apy1
           ;; arg2 = apy2
           ;; arg3 = apy3
           ;; arg4 = apy4
           ;; funlab_clj = 1; // __patsflab__ats2cljpre_intrange_loop1_60
           (recur 1 env0 env1 @tmp108 arg1 env0 env1 arg4)
          ) ;; if-else
        );
        ;; if (funlab_clj > 0) continue; else ;; return/*_void*/;
      ) ;} // end-of-case
    ) ;} // end-of-switch
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare slistref_make_nil)
(declare slistref_length)
(declare slistref_push)
(declare slistref_pop_opt)
(declare slistref_foldleft)
(declare slistref_foldright)
;;;;;;


;; ATSassume(_057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2clj_057_SATS_057_slistref_056_sats__slistref_type)

;;fun
(defn
 slistref_make_nil[]
(
with-local-vars
[
;;knd = 0
  tmpret0 nil
  tmp1 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_make_nil
  (ATSINStmpset tmp1 atscc2clj_null)
  (ats2cljpre_ref @tmp1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 slistref_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret2 nil
  tmp3 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_length
  (ATSINStmpset tmp3 (ats2cljpre_ref_get_elt arg0))
  (ats2cljpre_list_length @tmp3)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 slistref_push[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmp5 nil
  tmp6 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_push
  (ATSINStmpset tmp6 (ats2cljpre_ref_get_elt arg0))
  (ATSINStmpset tmp5 (ATSPMVtysum arg1 @tmp6))
  (ATSINSmove1_void (ats2cljpre_ref_set_elt arg0 @tmp5))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 slistref_pop_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
  tmp8 nil
  tmp9 nil
  tmp10 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_pop_opt
  (ATSINStmpset tmp8 (ats2cljpre_ref_get_elt arg0))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp8)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp9 (ATSSELcon @tmp8 0))
       (ATSINStmpset tmp10 (ATSSELcon @tmp8 1))
       (ATSINSmove1_void (ats2cljpre_ref_set_elt arg0 @tmp10))
       (ATSPMVtysum @tmp9)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 slistref_foldleft[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret12 nil
  tmp13 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_foldleft
  (ATSINStmpset tmp13 (ats2cljpre_ref_get_elt arg0))
  (ats2cljpre_list_foldleft @tmp13 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 slistref_foldright[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret14 nil
  tmp15 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_slistref_foldright
  (ATSINStmpset tmp15 (ats2cljpre_ref_get_elt arg0))
  (ats2cljpre_list_foldright @tmp15 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_qlistref_auxl_5)
(declare _ats2cljpre_qlistref_auxr_6)
(declare _ats2cljpre_qlistref_auxl_8)
(declare _ats2cljpre_qlistref_auxr_9)
(declare ats2cljpre_qlistref_make_nil)
(declare ats2cljpre_qlistref_length)
(declare ats2cljpre_qlistref_enqueue)
(declare ats2cljpre_qlistref_dequeue_opt)
(declare ats2cljpre_qlistref_foldleft)
(declare _ats2cljpre_qlistref_auxl_5)
(declare _ats2cljpre_qlistref_auxr_6)
(declare ats2cljpre_qlistref_foldright)
(declare _ats2cljpre_qlistref_auxl_8)
(declare _ats2cljpre_qlistref_auxr_9)
;;;;;;


;; ATSassume(_057_Users_057_RyanKing_057_ATS2_055_contrib_057_contrib_057_libatscc_057_libatscc2clj_057_SATS_057_qlistref_056_sats__qlistref_type)

;;fun
(defn
 ats2cljpre_qlistref_make_nil[]
(
with-local-vars
[
;;knd = 0
  tmpret0 nil
  tmp1 nil
  tmp2 nil
  tmp3 nil
  tmp4 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_make_nil
  (ATSINStmpset tmp2 atscc2clj_null)
  (ATSINStmpset tmp1 (ats2cljpre_ref @tmp2))
  (ATSINStmpset tmp4 atscc2clj_null)
  (ATSINStmpset tmp3 (ats2cljpre_ref @tmp4))
  (ATSPMVtysum @tmp1 @tmp3)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_qlistref_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret5 nil
  tmp6 nil
  tmp7 nil
  tmp8 nil
  tmp9 nil
  tmp10 nil
  tmp11 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_length
  (ATSINStmpset tmp6 (ATSSELcon arg0 0))
  (ATSINStmpset tmp7 (ATSSELcon arg0 1))
  (ATSINStmpset tmp9 (ats2cljpre_ref_get_elt @tmp6))
  (ATSINStmpset tmp8 (ats2cljpre_list_length @tmp9))
  (ATSINStmpset tmp11 (ats2cljpre_ref_get_elt @tmp7))
  (ATSINStmpset tmp10 (ats2cljpre_list_length @tmp11))
  (ats2cljpre_add_int1_int1 @tmp8 @tmp10)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_qlistref_enqueue[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmp13 nil
  tmp14 nil
  tmp15 nil
  tmp16 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_enqueue
  (ATSINStmpset tmp13 (ATSSELcon arg0 0))
  (ATSINStmpset tmp14 (ATSSELcon arg0 1))
  (ATSINStmpset tmp16 (ats2cljpre_ref_get_elt @tmp13))
  (ATSINStmpset tmp15 (ATSPMVtysum arg1 @tmp16))
  (ATSINSmove1_void (ats2cljpre_ref_set_elt @tmp13 @tmp15))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_qlistref_dequeue_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret17 nil
  tmp18 nil
  tmp19 nil
  tmp20 nil
  tmp21 nil
  tmp22 nil
  tmp23 nil
  tmp25 nil
  tmp26 nil
  tmp27 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_dequeue_opt
  (ATSINStmpset tmp18 (ATSSELcon arg0 0))
  (ATSINStmpset tmp19 (ATSSELcon arg0 1))
  (ATSINStmpset tmp20 (ats2cljpre_ref_get_elt @tmp19))
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons @tmp20)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       (ATSINStmpset tmp23 (ats2cljpre_ref_get_elt @tmp18))
       (ATSINStmpset tmp25 atscc2clj_null)
       (ATSINSmove1_void (ats2cljpre_ref_set_elt @tmp18 @tmp25))
       (let[
         casefnx
         (fn casefnx[tmplab](case tmplab
           ;; ATSbranchseq_beg
           1 (do
            (if (ATSCKptriscons @tmp23)
              (casefnx 4)
              (do
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           2 (do
            atscc2clj_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           3 (do
            (casefnx 4)
           ) ;; end-of-branch
           4 (do
            (ATSINStmpset tmp26 (ATSSELcon @tmp23 0))
            (ATSINStmpset tmp27 (ATSSELcon @tmp23 1))
            (ATSINSmove1_void (ats2cljpre_ref_set_elt @tmp19 @tmp27))
            (ATSPMVtysum @tmp26)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
          ) ;; end-of-case
         ) ;; end-of-casefnx
        ] (casefnx 1)
       ) ;; end-of-let(casefnx)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp21 (ATSSELcon @tmp20 0))
       (ATSINStmpset tmp22 (ATSSELcon @tmp20 1))
       (ATSINSmove1_void (ats2cljpre_ref_set_elt @tmp19 @tmp22))
       (ATSPMVtysum @tmp21)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_qlistref_foldleft[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret30 nil
  tmp31 nil
  tmp32 nil
  tmp41 nil
  tmp42 nil
  tmp43 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_foldleft
  (ATSINStmpset tmp31 (ATSSELcon arg0 0))
  (ATSINStmpset tmp32 (ATSSELcon arg0 1))
  (ATSINStmpset tmp41 (ats2cljpre_ref_get_elt @tmp31))
  (ATSINStmpset tmp43 (ats2cljpre_ref_get_elt @tmp32))
  (ATSINStmpset tmp42 (_ats2cljpre_qlistref_auxl_5 arg2 arg1 @tmp43))
  (_ats2cljpre_qlistref_auxr_6 arg2 @tmp41 @tmp42)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_qlistref_auxl_5[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret33 nil
  tmp34 nil
  tmp35 nil
  tmp36 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_qlistref_auxl_5
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp34 (ATSSELcon arg1 0))
         (ATSINStmpset tmp35 (ATSSELcon arg1 1))
         (ATSINStmpset tmp36 ((ATSfunclo_fclo env0) env0 arg0 @tmp34))
         ;; apy0 = @tmp36
         ;; apy1 = @tmp35
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_qlistref_auxl_5
         (_ats2cljpre_qlistref_auxl_5 env0 @tmp36 @tmp35)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret33;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_qlistref_auxr_6[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret37 nil
  tmp38 nil
  tmp39 nil
  tmp40 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_qlistref_auxr_6
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp38 (ATSSELcon arg0 0))
       (ATSINStmpset tmp39 (ATSSELcon arg0 1))
       (ATSINStmpset tmp40 (_ats2cljpre_qlistref_auxr_6 env0 @tmp39 arg1))
       ((ATSfunclo_fclo env0) env0 @tmp40 @tmp38)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_qlistref_foldright[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret44 nil
  tmp45 nil
  tmp46 nil
  tmp55 nil
  tmp56 nil
  tmp57 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_qlistref_foldright
  (ATSINStmpset tmp45 (ATSSELcon arg0 0))
  (ATSINStmpset tmp46 (ATSSELcon arg0 1))
  (ATSINStmpset tmp55 (ats2cljpre_ref_get_elt @tmp46))
  (ATSINStmpset tmp57 (ats2cljpre_ref_get_elt @tmp45))
  (ATSINStmpset tmp56 (_ats2cljpre_qlistref_auxl_8 arg1 arg2 @tmp57))
  (_ats2cljpre_qlistref_auxr_9 arg1 @tmp55 @tmp56)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_qlistref_auxl_8[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret47 nil
  tmp48 nil
  tmp49 nil
  tmp50 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_qlistref_auxl_8
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp48 (ATSSELcon arg1 0))
         (ATSINStmpset tmp49 (ATSSELcon arg1 1))
         (ATSINStmpset tmp50 ((ATSfunclo_fclo env0) env0 @tmp48 arg0))
         ;; apy0 = @tmp50
         ;; apy1 = @tmp49
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_qlistref_auxl_8
         (_ats2cljpre_qlistref_auxl_8 env0 @tmp50 @tmp49)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret47;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_qlistref_auxr_9[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret51 nil
  tmp52 nil
  tmp53 nil
  tmp54 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_qlistref_auxr_9
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp52 (ATSSELcon arg0 0))
       (ATSINStmpset tmp53 (ATSSELcon arg0 1))
       (ATSINStmpset tmp54 (_ats2cljpre_qlistref_auxr_9 env0 @tmp53 arg1))
       ((ATSfunclo_fclo env0) env0 @tmp52 @tmp54)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
;;;;;;
;;
;; The Clojure code is generated by atscc2clj
;; The starting compilation time is: 2016-12-25: 17h:42m
;;
;;;;;;
(declare _ats2cljpre_ML_list0_loop_7)
(declare _ats2cljpre_ML_list0_aux_23)
(declare _ats2cljpre_ML_list0_patsfun_26)
(declare _ats2cljpre_ML_list0_patsfun_29)
(declare _ats2cljpre_ML_list0_patsfun_32)
(declare _ats2cljpre_ML_list0_patsfun_35)
(declare _ats2cljpre_ML_list0_patsfun_39)
(declare _ats2cljpre_ML_list0_patsfun_42)
(declare _ats2cljpre_ML_list0_patsfun_45)
(declare _ats2cljpre_ML_list0_patsfun_48)
(declare _ats2cljpre_ML_list0_patsfun_51)
(declare _ats2cljpre_ML_list0_aux_55)
(declare _ats2cljpre_ML_list0_aux_57)
(declare _ats2cljpre_ML_list0_patsfun_59)
(declare _ats2cljpre_ML_list0_aux_61)
(declare _ats2cljpre_ML_list0_aux_63)
(declare _ats2cljpre_ML_list0_auxmain_69)
(declare _ats2cljpre_ML_list0_patsfun_70)
(declare _ats2cljpre_ML_list0_patsfun_71)
(declare ats2cljpre_stream_vt_make_nil__72__1)
(declare _ats2cljpre_ML_list0_patsfun_73__73__1)
(declare _ats2cljpre_ML_list0_auxmain_77)
(declare _ats2cljpre_ML_list0_patsfun_78)
(declare _ats2cljpre_ML_list0_patsfun_79)
(declare _ats2cljpre_ML_list0_patsfun_80)
(declare ats2cljpre_stream_vt_make_nil__72__2)
(declare _ats2cljpre_ML_list0_patsfun_73__73__2)
(declare ats2cljpre_ML_list0_head_opt)
(declare ats2cljpre_ML_list0_tail_opt)
(declare ats2cljpre_ML_list0_length)
(declare ats2cljpre_ML_list0_last_opt)
(declare _ats2cljpre_ML_list0_loop_7)
(declare ats2cljpre_ML_list0_get_at_opt)
(declare ats2cljpre_ML_list0_make_intrange_2)
(declare ats2cljpre_ML_list0_make_intrange_3)
(declare ats2cljpre_ML_list0_snoc)
(declare ats2cljpre_ML_list0_extend)
(declare ats2cljpre_ML_list0_append)
(declare ats2cljpre_ML_list0_reverse)
(declare ats2cljpre_ML_list0_reverse_append)
(declare ats2cljpre_ML_list0_concat)
(declare ats2cljpre_ML_list0_remove_at_opt)
(declare _ats2cljpre_ML_list0_aux_23)
(declare ats2cljpre_ML_list0_exists)
(declare ats2cljpre_ML_list0_exists_method)
(declare _ats2cljpre_ML_list0_patsfun_26)
(declare ats2cljpre_ML_list0_iexists)
(declare ats2cljpre_ML_list0_iexists_method)
(declare _ats2cljpre_ML_list0_patsfun_29)
(declare ats2cljpre_ML_list0_forall)
(declare ats2cljpre_ML_list0_forall_method)
(declare _ats2cljpre_ML_list0_patsfun_32)
(declare ats2cljpre_ML_list0_iforall)
(declare ats2cljpre_ML_list0_iforall_method)
(declare _ats2cljpre_ML_list0_patsfun_35)
(declare ats2cljpre_ML_list0_app)
(declare ats2cljpre_ML_list0_foreach)
(declare ats2cljpre_ML_list0_foreach_method)
(declare _ats2cljpre_ML_list0_patsfun_39)
(declare ats2cljpre_ML_list0_iforeach)
(declare ats2cljpre_ML_list0_iforeach_method)
(declare _ats2cljpre_ML_list0_patsfun_42)
(declare ats2cljpre_ML_list0_rforeach)
(declare ats2cljpre_ML_list0_rforeach_method)
(declare _ats2cljpre_ML_list0_patsfun_45)
(declare ats2cljpre_ML_list0_filter)
(declare ats2cljpre_ML_list0_filter_method)
(declare _ats2cljpre_ML_list0_patsfun_48)
(declare ats2cljpre_ML_list0_map)
(declare ats2cljpre_ML_list0_map_method)
(declare _ats2cljpre_ML_list0_patsfun_51)
(declare ats2cljpre_ML_list0_mapcons)
(declare ats2cljpre_ML_list0_find_opt)
(declare ats2cljpre_ML_list0_zip)
(declare _ats2cljpre_ML_list0_aux_55)
(declare ats2cljpre_ML_list0_zipwith)
(declare _ats2cljpre_ML_list0_aux_57)
(declare ats2cljpre_ML_list0_zipwith_method)
(declare _ats2cljpre_ML_list0_patsfun_59)
(declare ats2cljpre_ML_list0_foldleft)
(declare _ats2cljpre_ML_list0_aux_61)
(declare ats2cljpre_ML_list0_foldright)
(declare _ats2cljpre_ML_list0_aux_63)
(declare ats2cljpre_ML_list0_sort_2)
(declare ats2cljpre_ML_streamize_list0_zip)
(declare ats2cljpre_ML_streamize_list0_cross)
(declare ats2cljpre_ML_streamize_list0_nchoose)
(declare _ats2cljpre_ML_list0_auxmain_69)
(declare _ats2cljpre_ML_list0_patsfun_70)
(declare _ats2cljpre_ML_list0_patsfun_71)
(declare ats2cljpre_stream_vt_make_nil__72__1)
(declare _ats2cljpre_ML_list0_patsfun_73__73__1)
(declare ats2cljpre_ML_streamize_list0_nchoose_rest)
(declare _ats2cljpre_ML_list0_auxmain_77)
(declare _ats2cljpre_ML_list0_patsfun_78)
(declare _ats2cljpre_ML_list0_patsfun_79)
(declare _ats2cljpre_ML_list0_patsfun_80)
(declare ats2cljpre_stream_vt_make_nil__72__2)
(declare _ats2cljpre_ML_list0_patsfun_73__73__2)
;;;;;;


(defn
_ats2cljpre_ML_list0_patsfun_26__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_26 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_29__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_29 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_32__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_32 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_35__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_35 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_39__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_39 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_42__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_42 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_45__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_45 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_48__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_48 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_51__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_51 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_59__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_59 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_70__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_70 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_71__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_71 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_73__73__1__closurerize[]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_73__73__1 xarg0)))
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_78__closurerize[xenv0 xenv1]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_78 (ATSCCget_1 _fcenvs_) (ATSCCget_2 _fcenvs_) xarg0)) xenv0 xenv1)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_79__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_79 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_80__closurerize[xenv0]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_80 (ATSCCget_1 _fcenvs_) xarg0)) xenv0)
;;%}
) ;; end-of-defn


(defn
_ats2cljpre_ML_list0_patsfun_73__73__2__closurerize[]
;;%{
  (list (fn[_fcenvs_ xarg0](_ats2cljpre_ML_list0_patsfun_73__73__2 xarg0)))
;;%}
) ;; end-of-defn


;;fun
(defn
 ats2cljpre_ML_list0_head_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret4 nil
  tmp5 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_head_opt
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp5 (ATSSELcon arg0 0))
       (ATSPMVtysum @tmp5)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_tail_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret7 nil
  tmp9 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_tail_opt
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp9 (ATSSELcon arg0 1))
       (ATSPMVtysum @tmp9)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_length[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret10 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_length
  (ats2cljpre_list_length arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_last_opt[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret11 nil
  tmp15 nil
  tmp16 nil
  tmp17 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_last_opt
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp15 (ATSSELcon arg0 0))
       (ATSINStmpset tmp16 (ATSSELcon arg0 1))
       (ATSINStmpset tmp17 (_ats2cljpre_ML_list0_loop_7 @tmp15 @tmp16))
       (ATSPMVtysum @tmp17)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_loop_7[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret12 nil
  tmp13 nil
  tmp14 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_ML_list0_loop_7
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp13 (ATSSELcon arg1 0))
         (ATSINStmpset tmp14 (ATSSELcon arg1 1))
         ;; apy0 = @tmp13
         ;; apy1 = @tmp14
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_ML_list0_loop_7
         (_ats2cljpre_ML_list0_loop_7 @tmp13 @tmp14)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret12;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_get_at_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret18 nil
  tmp19 nil
  tmp20 nil
  tmp21 nil
  tmp22 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list0_get_at_opt
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp19 (ATSSELcon arg0 0))
         (ATSINStmpset tmp20 (ATSSELcon arg0 1))
         (ATSINStmpset tmp21 (ats2cljpre_gt_int1_int1 arg1 0))
         (if @tmp21
           (do
            (ATSINStmpset tmp22 (ats2cljpre_sub_int1_int1 arg1 1))
            ;; apy0 = @tmp20
            ;; apy1 = @tmp22
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_list0_get_at_opt
            (ats2cljpre_ML_list0_get_at_opt @tmp20 @tmp22)
           ) ;; if-then
           (do
            (ATSPMVtysum @tmp19)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret18;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_make_intrange_2[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret23 nil
  tmp24 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_make_intrange_2
  (ATSINStmpset tmp24 (ats2cljpre_list_make_intrange_2 arg0 arg1))
  @tmp24
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_make_intrange_3[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret25 nil
  tmp26 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_make_intrange_3
  (ATSINStmpset tmp26 (ats2cljpre_list_make_intrange_3 arg0 arg1 arg2))
  @tmp26
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_snoc[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret38 nil
  tmp39 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_snoc
  (ATSINStmpset tmp39 (ats2cljpre_list_snoc arg0 arg1))
  @tmp39
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_extend[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret40 nil
  tmp41 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_extend
  (ATSINStmpset tmp41 (ats2cljpre_list_extend arg0 arg1))
  @tmp41
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret42 nil
  tmp43 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_append
  (ATSINStmpset tmp43 (ats2cljpre_list_append arg0 arg1))
  @tmp43
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_reverse[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret44 nil
  tmp45 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_reverse
  (ATSINStmpset tmp45 (ats2cljpre_list_reverse arg0))
  @tmp45
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_reverse_append[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret46 nil
  tmp47 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_reverse_append
  (ATSINStmpset tmp47 (ats2cljpre_list_reverse_append arg0 arg1))
  @tmp47
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_concat[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret48 nil
  tmp49 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_concat
  (ATSINStmpset tmp49 (ats2cljpre_list_concat arg0))
  @tmp49
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_remove_at_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret50 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_remove_at_opt
  (_ats2cljpre_ML_list0_aux_23 arg0 0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_aux_23[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret51 nil
  tmp52 nil
  tmp53 nil
  tmp54 nil
  tmp55 nil
  tmp56 nil
  tmp57 nil
  tmp58 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_aux_23
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp52 (ATSSELcon arg0 0))
       (ATSINStmpset tmp53 (ATSSELcon arg0 1))
       (ATSINStmpset tmp54 (ats2cljpre_gt_int1_int1 arg1 0))
       (if @tmp54
         (do
          (ATSINStmpset tmp56 (ats2cljpre_sub_int1_int1 arg1 1))
          (ATSINStmpset tmp55 (_ats2cljpre_ML_list0_aux_23 @tmp53 @tmp56))
          (let[
            casefnx
            (fn casefnx[tmplab](case tmplab
              ;; ATSbranchseq_beg
              1 (do
               (if (ATSCKptriscons @tmp55)
                 (casefnx 4)
                 (do
                  (casefnx 2)
                 )
               )
              ) ;; end-of-branch
              2 (do
               atscc2clj_null
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; ATSbranchseq_beg
              3 (do
               (casefnx 4)
              ) ;; end-of-branch
              4 (do
               (ATSINStmpset tmp57 (ATSSELcon @tmp55 0))
               (ATSINStmpset tmp58 (ATSPMVtysum @tmp52 @tmp57))
               (ATSPMVtysum @tmp58)
              ) ;; end-of-branch
              ;; ATSbranchseq_end
              ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
             ) ;; end-of-case
            ) ;; end-of-casefnx
           ] (casefnx 1)
          ) ;; end-of-let(casefnx)
         ) ;; if-then
         (do
          (ATSPMVtysum @tmp53)
         ) ;; if-else
       )
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_exists[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret59 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_exists
  (ats2cljpre_list_exists arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_exists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret60 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_exists_method
  (_ats2cljpre_ML_list0_patsfun_26__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_26[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret61 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_26
  (ats2cljpre_ML_list0_exists env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iexists[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret62 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iexists
  (ats2cljpre_list_iexists arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iexists_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret63 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iexists_method
  (_ats2cljpre_ML_list0_patsfun_29__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_29[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret64 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_29
  (ats2cljpre_ML_list0_iexists env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_forall[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret65 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_forall
  (ats2cljpre_list_forall arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_forall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret66 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_forall_method
  (_ats2cljpre_ML_list0_patsfun_32__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_32[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret67 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_32
  (ats2cljpre_ML_list0_forall env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iforall[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret68 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iforall
  (ats2cljpre_list_iforall arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iforall_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret69 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iforall_method
  (_ats2cljpre_ML_list0_patsfun_35__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_35[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret70 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_35
  (ats2cljpre_ML_list0_iforall env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_app[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_app
  (ATSINSmove1_void (ats2cljpre_ML_list0_foreach arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_foreach[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_foreach
  (ATSINSmove1_void (ats2cljpre_list_foreach arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_foreach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret73 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_foreach_method
  (_ats2cljpre_ML_list0_patsfun_39__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_39[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_39
  (ATSINSmove1_void (ats2cljpre_ML_list0_foreach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iforeach[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iforeach
  (ATSINSmove1_void (ats2cljpre_list_iforeach arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_iforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret76 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_iforeach_method
  (_ats2cljpre_ML_list0_patsfun_42__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_42[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_42
  (ATSINSmove1_void (ats2cljpre_ML_list0_iforeach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_rforeach[arg0 arg1]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_rforeach
  (ATSINSmove1_void (ats2cljpre_list_rforeach arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_rforeach_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret79 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_rforeach_method
  (_ats2cljpre_ML_list0_patsfun_45__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_45[env0 arg0]
(
with-local-vars
[
;;knd = 0
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_45
  (ATSINSmove1_void (ats2cljpre_ML_list0_rforeach env0 arg0))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_filter[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret81 nil
  tmp82 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_filter
  (ATSINStmpset tmp82 (ats2cljpre_list_filter arg0 arg1))
  @tmp82
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_filter_method[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret83 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_filter_method
  (_ats2cljpre_ML_list0_patsfun_48__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_48[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret84 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_48
  (ats2cljpre_ML_list0_filter env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_map[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret85 nil
  tmp86 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_map
  (ATSINStmpset tmp86 (ats2cljpre_list_map arg0 arg1))
  @tmp86
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_map_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret87 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_map_method
  (_ats2cljpre_ML_list0_patsfun_51__closurerize arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_51[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret88 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_51
  (ats2cljpre_ML_list0_map env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_mapcons[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret89 nil
  tmp90 nil
  tmp91 nil
  tmp92 nil
  tmp93 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_mapcons
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg1)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp90 (ATSSELcon arg1 0))
       (ATSINStmpset tmp91 (ATSSELcon arg1 1))
       (ATSINStmpset tmp92 (ATSPMVtysum arg0 @tmp90))
       (ATSINStmpset tmp93 (ats2cljpre_ML_list0_mapcons arg0 @tmp91))
       (ATSPMVtysum @tmp92 @tmp93)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_find_opt[arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret94 nil
  tmp95 nil
  tmp96 nil
  tmp97 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab_list0_find_opt
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg0)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         atscc2clj_null
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp95 (ATSSELcon arg0 0))
         (ATSINStmpset tmp96 (ATSSELcon arg0 1))
         (ATSINStmpset tmp97 ((ATSfunclo_fclo arg1) arg1 @tmp95))
         (if @tmp97
           (do
            (ATSPMVtysum @tmp95)
           ) ;; if-then
           (do
            ;; apy0 = @tmp96
            ;; apy1 = arg1
            ;; arg0 = apy0
            ;; arg1 = apy1
            ;; funlab_clj = 1; // __patsflab_list0_find_opt
            (ats2cljpre_ML_list0_find_opt @tmp96 arg1)
           ) ;; if-else
         )
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret94;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_zip[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret98 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_zip
  (_ats2cljpre_ML_list0_aux_55 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_aux_55[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret99 nil
  tmp100 nil
  tmp101 nil
  tmp102 nil
  tmp103 nil
  tmp104 nil
  tmp105 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_aux_55
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp100 (ATSSELcon arg0 0))
       (ATSINStmpset tmp101 (ATSSELcon arg0 1))
       (let[
         casefnx
         (fn casefnx[tmplab](case tmplab
           ;; ATSbranchseq_beg
           1 (do
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (do
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           2 (do
            atscc2clj_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           3 (do
            (casefnx 4)
           ) ;; end-of-branch
           4 (do
            (ATSINStmpset tmp102 (ATSSELcon arg1 0))
            (ATSINStmpset tmp103 (ATSSELcon arg1 1))
            (ATSINStmpset tmp104 (ATSPMVtyrec @tmp100 @tmp102))
            (ATSINStmpset tmp105 (_ats2cljpre_ML_list0_aux_55 @tmp101 @tmp103))
            (ATSPMVtysum @tmp104 @tmp105)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
          ) ;; end-of-case
         ) ;; end-of-casefnx
        ] (casefnx 1)
       ) ;; end-of-let(casefnx)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_zipwith[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret106 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_zipwith
  (_ats2cljpre_ML_list0_aux_57 arg0 arg1 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_aux_57[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret107 nil
  tmp108 nil
  tmp109 nil
  tmp110 nil
  tmp111 nil
  tmp112 nil
  tmp113 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_aux_57
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       atscc2clj_null
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp108 (ATSSELcon arg0 0))
       (ATSINStmpset tmp109 (ATSSELcon arg0 1))
       (let[
         casefnx
         (fn casefnx[tmplab](case tmplab
           ;; ATSbranchseq_beg
           1 (do
            (if (ATSCKptriscons arg1)
              (casefnx 4)
              (do
               (casefnx 2)
              )
            )
           ) ;; end-of-branch
           2 (do
            atscc2clj_null
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; ATSbranchseq_beg
           3 (do
            (casefnx 4)
           ) ;; end-of-branch
           4 (do
            (ATSINStmpset tmp110 (ATSSELcon arg1 0))
            (ATSINStmpset tmp111 (ATSSELcon arg1 1))
            (ATSINStmpset tmp112 ((ATSfunclo_fclo arg2) arg2 @tmp108 @tmp110))
            (ATSINStmpset tmp113 (_ats2cljpre_ML_list0_aux_57 @tmp109 @tmp111 arg2))
            (ATSPMVtysum @tmp112 @tmp113)
           ) ;; end-of-branch
           ;; ATSbranchseq_end
           ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
          ) ;; end-of-case
         ) ;; end-of-casefnx
        ] (casefnx 1)
       ) ;; end-of-let(casefnx)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_zipwith_method[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret114 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_zipwith_method
  (_ats2cljpre_ML_list0_patsfun_59__closurerize arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_59[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret115 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_59
  (ats2cljpre_ML_list0_zipwith env0 env1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_foldleft[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret116 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_foldleft
  (_ats2cljpre_ML_list0_aux_61 arg2 arg1 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_aux_61[env0 arg0 arg1]
(
with-local-vars
[
;;knd = 1
;;apy0 nil
;;apy1 nil
  tmpret117 nil
  tmp118 nil
  tmp119 nil
  tmp120 nil
;;var funlab_clj
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;while(true){
   (loop [
     env0 env0
     arg0 arg0
     arg1 arg1
    ] ; funlab_clj = 0;
    ;; __patsflab__ats2cljpre_ML_list0_aux_61
    (let[
      casefnx
      (fn casefnx[tmplab](case tmplab
        ;; ATSbranchseq_beg
        1 (do
         (if (ATSCKptriscons arg1)
           (casefnx 4)
           (do
            (casefnx 2)
           )
         )
        ) ;; end-of-branch
        2 (do
         arg0
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; ATSbranchseq_beg
        3 (do
         (casefnx 4)
        ) ;; end-of-branch
        4 (do
         (ATSINStmpset tmp118 (ATSSELcon arg1 0))
         (ATSINStmpset tmp119 (ATSSELcon arg1 1))
         (ATSINStmpset tmp120 ((ATSfunclo_fclo env0) env0 arg0 @tmp118))
         ;; apy0 = @tmp120
         ;; apy1 = @tmp119
         ;; arg0 = apy0
         ;; arg1 = apy1
         ;; funlab_clj = 1; // __patsflab__ats2cljpre_ML_list0_aux_61
         (_ats2cljpre_ML_list0_aux_61 env0 @tmp120 @tmp119)
        ) ;; end-of-branch
        ;; ATSbranchseq_end
        ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
       ) ;; end-of-case
      ) ;; end-of-casefnx
     ] (casefnx 1)
    ) ;; end-of-let(casefnx)
    ;; if (funlab_clj > 0) continue; else ;; return tmpret117;
  ) ;} // endwhile-fun
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_foldright[arg0 arg1 arg2]
(
with-local-vars
[
;;knd = 0
  tmpret121 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_foldright
  (_ats2cljpre_ML_list0_aux_63 arg1 arg2 arg0 arg2)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_aux_63[env0 env1 arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret122 nil
  tmp123 nil
  tmp124 nil
  tmp125 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_aux_63
  (let[
    casefnx
    (fn casefnx[tmplab](case tmplab
      ;; ATSbranchseq_beg
      1 (do
       (if (ATSCKptriscons arg0)
         (casefnx 4)
         (do
          (casefnx 2)
         )
       )
      ) ;; end-of-branch
      2 (do
       arg1
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; ATSbranchseq_beg
      3 (do
       (casefnx 4)
      ) ;; end-of-branch
      4 (do
       (ATSINStmpset tmp123 (ATSSELcon arg0 0))
       (ATSINStmpset tmp124 (ATSSELcon arg0 1))
       (ATSINStmpset tmp125 (_ats2cljpre_ML_list0_aux_63 env0 env1 @tmp124 env1))
       ((ATSfunclo_fclo env0) env0 @tmp123 @tmp125)
      ) ;; end-of-branch
      ;; ATSbranchseq_end
      ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
     ) ;; end-of-case
    ) ;; end-of-casefnx
   ] (casefnx 1)
  ) ;; end-of-let(casefnx)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_list0_sort_2[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret128 nil
  tmp129 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_list0_sort_2
  (ATSINStmpset tmp129 (ats2cljpre_list_sort_2 arg0 arg1))
  @tmp129
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_streamize_list0_zip[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret130 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list0_zip
  (ats2cljpre_streamize_list_zip arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_streamize_list0_cross[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret131 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list0_cross
  (ats2cljpre_streamize_list_cross arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_streamize_list0_nchoose[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret132 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list0_nchoose
  (_ats2cljpre_ML_list0_auxmain_69 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_auxmain_69[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret133 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_auxmain_69
  (ATSPMVllazyval (_ats2cljpre_ML_list0_patsfun_70__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_70[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret134 nil
  tmp135 nil
  tmp136 nil
  tmp137 nil
  tmp138 nil
  tmp139 nil
  tmp140 nil
  tmp141 nil
  tmp142 nil
  tmp144 nil
  tmp145 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_70
  (if arg0
    (do
     (ATSINStmpset tmp135 (ats2cljpre_gt_int1_int1 env1 0))
     (if @tmp135
       (do
        (let[
          casefnx
          (fn casefnx[tmplab](case tmplab
            ;; ATSbranchseq_beg
            1 (do
             (if (ATSCKptriscons env0)
               (casefnx 4)
               (do
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            2 (do
             atscc2clj_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            3 (do
             (casefnx 4)
            ) ;; end-of-branch
            4 (do
             (ATSINStmpset tmp136 (ATSSELcon env0 0))
             (ATSINStmpset tmp137 (ATSSELcon env0 1))
             (ATSINStmpset tmp139 (ats2cljpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp138 (_ats2cljpre_ML_list0_auxmain_69 @tmp137 @tmp139))
             (ATSINStmpset tmp140 (_ats2cljpre_ML_list0_auxmain_69 @tmp137 env1))
             (ATSINStmpset tmp142 (ats2cljpre_stream_vt_map_cloref @tmp138 (_ats2cljpre_ML_list0_patsfun_71__closurerize @tmp136)))
             (ATSINStmpset tmp141 (ats2cljpre_stream_vt_append @tmp142 @tmp140))
             (ATSPMVllazyval_eval @tmp141)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-casefnx
         ] (casefnx 1)
        ) ;; end-of-let(casefnx)
       ) ;; if-then
       (do
        (ATSINStmpset tmp144 atscc2clj_null)
        (ATSINStmpset tmp145 (ats2cljpre_stream_vt_make_nil__72__1))
        (ATSPMVtysum @tmp144 @tmp145)
       ) ;; if-else
     )
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_71[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret143 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_71
  (ATSPMVtysum env0 arg0)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_make_nil__72__1[]
(
with-local-vars
[
;;knd = 0
  tmpret146__1 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_make_nil
  (ATSPMVllazyval (_ats2cljpre_ML_list0_patsfun_73__73__1__closurerize))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_73__73__1[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret147__1 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_73
  (if arg0
    (do
     atscc2clj_null
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_ML_streamize_list0_nchoose_rest[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret150 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_streamize_list0_nchoose_rest
  (_ats2cljpre_ML_list0_auxmain_77 arg0 arg1)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_auxmain_77[arg0 arg1]
(
with-local-vars
[
;;knd = 0
  tmpret151 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_auxmain_77
  (ATSPMVllazyval (_ats2cljpre_ML_list0_patsfun_78__closurerize arg0 arg1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_78[env0 env1 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret152 nil
  tmp153 nil
  tmp154 nil
  tmp155 nil
  tmp156 nil
  tmp157 nil
  tmp158 nil
  tmp159 nil
  tmp160 nil
  tmp163 nil
  tmp166 nil
  tmp167 nil
  tmp168 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_78
  (if arg0
    (do
     (ATSINStmpset tmp153 (ats2cljpre_gt_int1_int1 env1 0))
     (if @tmp153
       (do
        (let[
          casefnx
          (fn casefnx[tmplab](case tmplab
            ;; ATSbranchseq_beg
            1 (do
             (if (ATSCKptriscons env0)
               (casefnx 4)
               (do
                (casefnx 2)
               )
             )
            ) ;; end-of-branch
            2 (do
             atscc2clj_null
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; ATSbranchseq_beg
            3 (do
             (casefnx 4)
            ) ;; end-of-branch
            4 (do
             (ATSINStmpset tmp154 (ATSSELcon env0 0))
             (ATSINStmpset tmp155 (ATSSELcon env0 1))
             (ATSINStmpset tmp157 (ats2cljpre_sub_int1_int1 env1 1))
             (ATSINStmpset tmp156 (_ats2cljpre_ML_list0_auxmain_77 @tmp155 @tmp157))
             (ATSINStmpset tmp158 (_ats2cljpre_ML_list0_auxmain_77 @tmp155 env1))
             (ATSINStmpset tmp160 (ats2cljpre_stream_vt_map_cloref @tmp156 (_ats2cljpre_ML_list0_patsfun_79__closurerize @tmp154)))
             (ATSINStmpset tmp163 (ats2cljpre_stream_vt_map_cloref @tmp158 (_ats2cljpre_ML_list0_patsfun_80__closurerize @tmp154)))
             (ATSINStmpset tmp159 (ats2cljpre_stream_vt_append @tmp160 @tmp163))
             (ATSPMVllazyval_eval @tmp159)
            ) ;; end-of-branch
            ;; ATSbranchseq_end
            ;; (else (atscc2clj_caseof_deadcode _FILE_ _LINE_))
           ) ;; end-of-case
          ) ;; end-of-casefnx
         ] (casefnx 1)
        ) ;; end-of-let(casefnx)
       ) ;; if-then
       (do
        (ATSINStmpset tmp167 atscc2clj_null)
        (ATSINStmpset tmp166 (ATSPMVtyrec @tmp167 env0))
        (ATSINStmpset tmp168 (ats2cljpre_stream_vt_make_nil__72__2))
        (ATSPMVtysum @tmp166 @tmp168)
       ) ;; if-else
     )
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_79[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret161 nil
  tmp162 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_79
  (ATSINStmpset tmp162 (ATSPMVtysum env0 (ATSSELboxrec arg0 0)))
  (ATSPMVtyrec @tmp162 (ATSSELboxrec arg0 1))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_80[env0 arg0]
(
with-local-vars
[
;;knd = 0
  tmpret164 nil
  tmp165 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_80
  (ATSINStmpset tmp165 (ATSPMVtysum env0 (ATSSELboxrec arg0 1)))
  (ATSPMVtyrec (ATSSELboxrec arg0 0) @tmp165)
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 ats2cljpre_stream_vt_make_nil__72__2[]
(
with-local-vars
[
;;knd = 0
  tmpret146__2 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab_stream_vt_make_nil
  (ATSPMVllazyval (_ats2cljpre_ML_list0_patsfun_73__73__2__closurerize))
) ;; end-of-with-local-vars
) ;; end-of-fun


;;fun
(defn
 _ats2cljpre_ML_list0_patsfun_73__73__2[arg0]
(
with-local-vars
[
;;knd = 0
  tmpret147__2 nil
;;var tmplab,tmplab_clj
] ;; with-local-vars
  ;; __patsflab__ats2cljpre_ML_list0_patsfun_73
  (if arg0
    (do
     atscc2clj_null
    ) ;; if-then
    (do
    ) ;; if-else
  )
) ;; end-of-with-local-vars
) ;; end-of-fun

;;;;;;
;;
;; end-of-compilation-unit
;;
;;;;;;
-en \n;; ****** ****** ;;\n
-en \n;; end of [libatscc2clj_all.clj] ;;\n
