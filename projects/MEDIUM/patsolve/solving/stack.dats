staload "solving/stack.sats"

assume stack (a) = List0_vt (a)

implement{a}
stack_nil () = list_vt_nil ()

implement{a}
stack_listize (xs) = xs

implement{a}
stack_push (xs, x) = let
  val sum = list_vt_cons (x, xs)
in
  xs := sum
end

implement{a}
stack_pop (xs) =
  case+ xs of
    | list_vt_nil () => None_vt ()
    | ~list_vt_cons (x, xss) => let
      val () = xs := xss
    in
      Some_vt (x)
    end

implement{a}
stack_fhead (xs) =
  case+ xs of
    | list_vt_nil () => ()
    | ~list_vt_cons (x, xss) => let
      var res : a = x
    in
      stack_fhead$foper (res);
      xs := list_vt_cons (res, xss)
    end