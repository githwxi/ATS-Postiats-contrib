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

castfn
int_of_bv32 {b:bv32} (int b): int (signed_int_of_bv32(b))

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
udiv_int_bv32_int_int {x:bv32}{y:int}
  (x: int (x), y: int (y)): int (udiv (x, bv32(y))) = "mac#%"
  
overload udiv with udiv_int_bv32_int_int
  
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
lnot_int_int {x:int}
  (x: int (x)): int (lnot (bv32(x))) = "mac#%"

overload lnot with lnot_int_int

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

(**
  Unsigned ints.
*)
abst@ype uint_bv32 (bv:bv32) = uint
typedef uint (bv:bv32) = uint_bv32 (bv)

castfn
ubv32_of_uint {n:nat} (uint n): uint (bv32(n))

castfn
ubv32_of_bool {b:bool} (bool b): uint (bv32(b))

castfn
uint_of_bv32 {b:bv32} (uint b): uint (int_of_bv32(b))

fun
lshr_int_bv32_int {x,i:bv32}
  (x: uint (x), i: uint (i)): uint (lshr(x, i)) = "mac#%"
  
overload >> with lshr_int_bv32_int

fun
lshr_int_bv32_int_int {x:bv32}{i:int}
  (x: uint (x), i: uint (i)): uint (lshr(x, bv32(i))) = "mac#%"

overload >> with lshr_int_bv32_int_int

fun
neg_uint_bv32 {x:bv32}
  (x: uint(x)): uint (~x) = "mac#%"

overload ~ with neg_uint_bv32

fun 
add_uint_uint_bv32 {x,y:bv32} 
  (x:uint (x), y: uint (y)): uint (x + y) = "mac#%"

overload + with add_uint_uint_bv32

fun 
sub_uint_uint_bv32 {x,y:bv32} 
  (x:uint (x), y: uint (y)): uint (x - y) = "mac#%"

overload - with sub_uint_uint_bv32

fun
sub_uint_bv32_uint_uint {x:bv32} {y:int}
  (x:uint (x), y: uint (y)): uint (x - bv32(y)) = "mac#%"

overload - with sub_uint_bv32_uint_uint

fun 
mul_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): uint (x * y) = "mac#%"

overload * with mul_uint_uint_bv32

fun 
div_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): uint (x / y) = "mac#%"
  
overload / with div_uint_uint_bv32

fun
udiv_uint_uint_bv32 {x,y:bv32}
  (x: uint (x), y: uint (y)): uint (udiv (x, y)) = "mac#%"

overload udiv with udiv_uint_uint_bv32

fun
udiv_uint_bv32_uint_uint {x:bv32} {y:int}
  (x: uint (x), y: uint (y)): uint (udiv (x, bv32(y))) = "mac#%"
  
overload udiv with udiv_uint_bv32_uint_uint
  
fun 
eq_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): bool (x == y) = "mac#%"
  
overload = with eq_uint_uint_bv32  

fun
eq_uint_bv32_uint_uint {x:bv32} {y:int}
  (x: uint(x), y: uint(y)): bool (x == bv32(y)) = "mac#%"

overload = with eq_uint_bv32_uint_uint

fun
lt_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): bool (x < y) = "mac#%"
  
overload < with lt_uint_uint_bv32

fun
lte_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): bool (x <= y) = "mac#%"
  
overload <= with lte_uint_uint_bv32

fun
gte_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): bool (x >= y) = "mac#%"

overload >= with gte_uint_uint_bv32

fun
gt_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): bool (x > y) = "mac#%"

overload > with gt_uint_uint_bv32

fun
gt_uint_bv32_uint_uint {x:bv32} {y:int}
  (x: uint (x), y: uint (y)): bool (x > bv32(y)) = "mac#%"
  
overload > with gt_uint_bv32_uint_uint

fun
land_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): uint (x land y) = "mac#%"
  
overload land with land_uint_uint_bv32

fun
land_uint_bv32_uint_uint {x:bv32} {y:int} (
  x: uint (x), y: uint (y)
): uint (x land bv32(y)) = "mac#%"

overload land with land_uint_bv32_uint_uint

fun
lor_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): uint (x lor y) = "mac#%"

overload lor with lor_uint_uint_bv32

fun
lxor_uint_uint_bv32 {x,y:bv32}
  (x:uint (x), y: uint (y)): uint (x lxor y) = "mac#%"

overload lxor with lxor_uint_uint_bv32

fun
lnot_uint_bv32 {x:bv32}
  (x:uint (x)): uint (lnot x) = "mac#%"

overload lnot with lnot_uint_bv32 of 100

fun
lnot_uint_uint {x:int}
  (x: uint (x)): uint (lnot (bv32(x))) = "mac#%"

overload lnot with lnot_uint_uint of 100

fun
lshl_uint_bv32_uint {x,i:bv32}
  (x: uint (x), i: uint (i)): uint (x << i) = "mac#%"

overload << with lshl_uint_bv32_uint