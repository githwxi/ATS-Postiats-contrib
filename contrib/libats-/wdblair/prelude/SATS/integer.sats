(**
  Integers indexed by fixed width bit vectors.
*)

staload "contrib/libats-/wdblair/patsolve/SATS/bitvector.sats"

abst@ype int_bv16 (bv:bv16) = int
typedef int (bv:bv16) = int_bv16 (bv)

castfn
bv16_of_int {n:nat}(int n): int (bv16(n))

fun 
add_int_int_bv16 {x,y:bv16} 
  (x:int (x), y: int (y)): int (x + y) = "mac#%"

overload + with add_int_int_bv16

fun 
sub_int_int_bv16 {x,y:bv16} 
  (x:int (x), y: int (y)): int (x - y) = "mac#%"

overload - with sub_int_int_bv16

fun
sub_int_bv16_int_int {x:bv16} {y:int}
  (x:int (x), y: int (y)): int (x - bv16(y)) = "mac#%"

overload - with sub_int_bv16_int_int

fun 
mul_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): int (x * y) = "mac#%"

overload + with mul_int_int_bv16

fun 
div_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): int (x / y) = "mac#%"
  
overload / with div_int_int_bv16

fun 
eq_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): bool (x == y) = "mac#%"
  
overload = with eq_int_int_bv16  
  
fun
eq_int_bv16_int_int {x:bv16} {y:int}
  (x: int(x), y: int(y)): bool (x == bv16(y)) = "mac#%"

overload = with eq_int_bv16_int_int

fun
lt_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): bool (x < y) = "mac#%"
  
overload < with lt_int_int_bv16

fun
lte_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): bool (x <= y) = "mac#%"
  
overload <= with lte_int_int_bv16

fun
gte_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): bool (x >= y) = "mac#%"

overload >= with gte_int_int_bv16

fun
gt_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): bool (x > y) = "mac#%"

overload > with gt_int_int_bv16

fun
land_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): int (x land y) = "mac#%"

overload land with land_int_int_bv16
  
fun
lor_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): int (x lor y) = "mac#%"

overload lor with lor_int_int_bv16

fun
lxor_int_int_bv16 {x,y:bv16}
  (x:int (x), y: int (y)): int (x lxor y) = "mac#%"

fun
lnot_int_bv16 {x:bv16}
  (x:int (x)): int (lnot x) = "mac#%"

overload not with lnot_int_bv16
  
fun
lshl_int_bv16_int {x:bv16} {i:nat}
  (x: int (x), i: int (i)): int (x << i) = "mac#%"

overload << with lshl_int_bv16_int

(**
  This may be a wrong assumption, but if our argument
  is signed, then shifting right incurs an arithmetic
  shift. Therefore, a logical shift is unavailable for
  signed integers.
  
  I'm basing this off of information I read about gcc's
  behavior for this case.
*)
fun
ashr_int_bv16_int {x:bv16} {i:nat}
  (x: int (x), i: int (i)): int (ashr (x, i)) = "mac#%"
  
overload >> with ashr_int_bv16_int