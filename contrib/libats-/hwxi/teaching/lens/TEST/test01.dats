(* ****** ****** *)
(*
Mostly copied from:
https://github.com/August-Alm/ATS-Experiments/blob/master/lens.dats
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

#staload "./../DATS/lens.dats"

(* ****** ****** *)

typedef
Address = '{_street = string, _zip = int}
typedef
Person = '{_name = string, _age = int, _address = Address}

val
address: lens(Person, Address) =
  let val address_get: cfun(Person, Address) =
        lam(p: Person) =<cloref1> p._address
      val address_set: cfun(Person, Address, Person) =
        lam( p: Person
           , a: Address
           ) =<cloref1> '{ _name = p._name
                         , _age = p._age
                         , _address = a }
  in lens_make_get_set(address_get, address_set) end
//
val
zip: lens(Address, int) =
  let val zip_get: cfun(Address, int) =
        lam(a: Address) =<cloref1> a._zip
      val zip_set: cfun(Address, int, Address) =
        lam( a: Address
           , x: int
           ) =<cloref1> '{ _street = a._street, _zip = x }
  in lens_make_get_set(zip_get, zip_set) end

(* ****** ****** *)

val
john = '{ _name = "John"
        , _age = 23
        , _address = '{ _street = "venusbergstrasse"
                      , _zip = 123 }}: Person
(* ****** ****** *)

val () = println!(john._address._zip)

(* ****** ****** *)

val
john = let
  val
  addresszip = compose(address, zip)
in
  addresszip.over2(lam(x) => x+x, john)
end // end of [val]

(* ****** ****** *)

val () = println!(john._address._zip)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)
