(**
  Integers indexed by fixed width bit vectors.
*)

staload "contrib/libats-/wdblair/patsolve/SATS/bitvector.sats"

abst@ype int_bv32 (bv:bv32) = int
typedef int (bv:bv32) = int_bv32 (bv)

castfn
bv32_of_int {n:nat} (int n): int (bv32(n))

castfn
bv32_of_bool {b:bool} (bool b): int (bv32(b))

fun
neg_int_bv32 {x:bv32}
  (x: int(x)): int (~x) = "mac#%"

overload ~ with neg_int_bv32

fun 
add_int_int_bv32 {x,y:bv32} 
  (x:int (x), y: int (y)): int (x + y) = "mac#%"

overload + with add_int_int_bv32

fun 
sub_int_int_bv32 {x,y:bv32} 
  (x:int (x), y: int (y)): int (x - y) = "mac#%"

overload - with sub_int_int_bv32

fun
sub_int_bv32_int_int {x:bv32} {y:int}
  (x:int (x), y: int (y)): int (x - bv32(y)) = "mac#%"

overload - with sub_int_bv32_int_int

fun 
mul_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): int (x * y) = "mac#%"

overload * with mul_int_int_bv32

fun 
div_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): int (x / y) = "mac#%"
  
overload / with div_int_int_bv32

fun
udiv_int_int_bv32 {x,y:bv32}
  (x: int (x), y: int (y)): int (udiv (x, y)) = "mac#%"

overload udiv with udiv_int_int_bv32
  
fun 
eq_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): bool (x == y) = "mac#%"
  
overload = with eq_int_int_bv32  

fun
eq_int_bv32_int_int {x:bv32} {y:int}
  (x: int(x), y: int(y)): bool (x == bv32(y)) = "mac#%"

overload = with eq_int_bv32_int_int

fun
lt_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): bool (x < y) = "mac#%"
  
overload < with lt_int_int_bv32

fun
lte_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): bool (x <= y) = "mac#%"
  
overload <= with lte_int_int_bv32

fun
gte_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): bool (x >= y) = "mac#%"

overload >= with gte_int_int_bv32

fun
gt_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): bool (x > y) = "mac#%"

overload > with gt_int_int_bv32

fun
gt_int_bv32_int_int {x:bv32} {y:int}
  (x: int (x), y: int (y)): bool (x > bv32(y)) = "mac#%"
  
overload > with gt_int_bv32_int_int

fun
land_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): int (x land y) = "mac#%"
  
overload land with land_int_int_bv32

fun
land_int_bv32_int_int {x:bv32} {y:int} (
  x: int (x), y: int (y)
): int (x land bv32(y)) = "mac#%"

overload land with land_int_bv32_int_int

fun
lor_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): int (x lor y) = "mac#%"

overload lor with lor_int_int_bv32

fun
lxor_int_int_bv32 {x,y:bv32}
  (x:int (x), y: int (y)): int (x lxor y) = "mac#%"

overload lxor with lxor_int_int_bv32

fun
lnot_int_bv32 {x:bv32}
  (x:int (x)): int (lnot x) = "mac#%"

overload lnot with lnot_int_bv32
  
fun
lshl_int_bv32_int {x,i:bv32}
  (x: int (x), i: int (i)): int (x << i) = "mac#%"

overload << with lshl_int_bv32_int

(**
  This may be a wrong assumption, but if our argument
  is signed, then shifting right incurs an arithmetic
  shift. Therefore, a logical shift is unavailable for
  signed integers.
  
  I'm basing this off of information I read about gcc's
  behavior for this case.
*)
fun
ashr_int_bv32_int {x,i:bv32}
  (x: int (x), i: int (i)): int (ashr(x, i)) = "mac#%"
  
overload >> with ashr_int_bv32_int