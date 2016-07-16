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
 CLJlist_nil[] `())
(defmacro
 CLJlist_sing[x] `(list ~x))
(defmacro
 CLJlist_pair[x1 x2] `(list ~x1 ~x2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 CLJlist_cons[x0 xs] `(cons ~x0 ~xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 CLJlist_make_elt[n x0] `(repeat ~n ~x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 CLJlist_is_nil[xs] `(empty? ~xs))
(defmacro
 CLJlist_is_cons[xs] `(not (empty? ~xs)))
(defmacro
 CLJlist_isnot_nil[xs] `(not (empty? ~xs)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 CLJlist_length[xs] `(count ~xs)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro CLJlist_tail[xs] `(rest ~xs))
(defmacro CLJlist_head[xs] `(first ~xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro
 CLJlist_get_at[xs i] `(nth ~xs ~i)
) ; defmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(defmacro
 CLJlist_append[xs ys] `(concat ~xs ~ys)
)
;;
(defmacro CLJlist_reverse[xs] `(reverse ~xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; end of [CLJlist_cats.clj] ;;;;;;
