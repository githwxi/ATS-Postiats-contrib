(**
  An interface for a stack.
*)

absvtype stack (a:vt@ype+) = ptr

fun {a:vt@ype} 
stack_nil (): stack (a)

fun {a:vt@ype} 
stack_listize  (stack (a)): List0_vt (a)

fun {a:vt@ype}
stack_head (stack (a)): a 

fun {a:vt@ype} 
stack_push  (&stack (a) >> _, a): void

fun {a:vt@ype} 
stack_pop  (&stack (a) >> _): Option_vt (a)

(**
  Apply a function to the head of a stack.
*)
fun {a:vt@ype}
stack_fhead$foper (&a >> _): void

fun {a:vt@ype}
stack_fhead (&stack (a) >> _): void
