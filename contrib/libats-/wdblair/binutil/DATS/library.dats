(**
  Implementing routines that act on binary libraries.
*)

#define ATS_DYNLOADFLAG 0

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "contrib/libats-/wdblair/prelude/SATS/error.sats"

staload "contrib/libats-/wdblair/binutil/SATS/symbol.sats"
staload "contrib/libats-/wdblair/binutil/SATS/library.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

typedef so = ptr

abstype bfd = ptr
assume bfd = $extype "bfd*"

typedef asymbol = ptr

extern
fun elt_type_is_null {a:type} (a): bool = "mac#"

overload iseqz with elt_type_is_null of 50

(* ****** ****** *)

typedef library_struct = @{
  object_file= so,
  file= bfd
}

(* ****** ****** *)

assume library = ref (library_struct)

local

  (**
    We need some pieces of the bfd and c library
    here...
  *)
  extern
  fun dlopen (
    string, int
  ): so = "mac#"

  extern
  fun dlsym (
    so, string
  ): ptr = "mac#"
  
  extern
  fun dlclose (
    so
  ): int = "mac#"
  
  macdef RTLD_LAZY = $extval (int, "RTLD_LAZY")

  typedef bfd_format = $extype "bfd_format"
  macdef bfd_object = $extval (bfd_format, "bfd_object")
  
  extern
  fun bfd_init (): void = "mac#"
  
  extern
  fun bfd_openr (
    filename: string, target: string
  ): bfd = "mac#"

  extern
  fun bfd_close (
    bfd
  ): int = "mac#"
  
  extern
  fun bfd_check_format (
    bfd, bfd_format
  ): bool = "mac#"
  
  extern
  fun bfd_get_symtab_upper_bound (
    bfd
  ): [n:int] size_t (n) = "mac#"
  
  extern
  fun bfd_canonicalize_symtab {l:addr} {n:nat} (
    b0ytes(n) @ l | bfd, ptr l
  ): [m: nat] (@[asymbol][m] @ l | size_t m) = "mac#"
  
  extern
  praxi b0ytes_of_array_lemma {a:t@ype}{l:addr}{n:nat} (
    @[a][n] @ l
  ): b0ytes (n*sizeof(a)) @ l
  
  extern
  fun bfd_asymbol_get_name (
    asymbol
  ): string = "mac#"
    
in

  implement 
  library_open_lazy (filename) = let
    val () = bfd_init ()
    val so = dlopen (filename, RTLD_LAZY)
    val bfd = bfd_openr (filename, "default")
  in
    if iseqz (so) orelse iseqz (bfd) then
      Error ("Could not load library")
    else let
      val (pfat, pfgc | p) = ptr_alloc<library_struct> ()
      val () = p->object_file := so;
      val () = p->file := bfd;
      val lib = $UN.castvwtp0{library}((pfat, pfgc | p))
    in
      Ok (lib)
    end
  end // end of [library_open_lazy]
  
  implement 
  library_get_symbols (lib) = let
    val (pf, pfree | p) = $UN.ref_vtake (lib)
    val file = p->file
    //
    val storage_needed = bfd_get_symtab_upper_bound (file)
  in
    if storage_needed <= 0 then
      Error ("No symbols found in binary file") where {
        prval () = pfree (pf)
      }
    else let
      val (pfat, pfmf | p) = memory$alloc (storage_needed)
      val (pfsym | n) = bfd_canonicalize_symtab (pfat | file, p)
      //
      var rs : symbollst = list_nil ()
      //
      implement
      array_foreach$fwork<asymbol><void> (x, v) = {
        val name = bfd_asymbol_get_name (x)
        val newname = strptr2string (copy (name))
        val sym = symbol_make (name)
        val (pfat, pfree | prs) = $UN.ptr1_vtake{symbollst} (addr@ rs)
        val () =  !prs := list_cons (sym, !prs)
        //
        prval () = pfree (pfat)
      }
      //

      //
      val _ = array_foreach<asymbol> (
        !p, n
      )
      //
      prval () = pfree (pf)
      prval pfat = b0ytes_of_array_lemma (pfsym)
      //
      val () = memory$free (pfat, pfmf | p)
    in
        Ok (rs)
    end
  end // end of [library_get_symbols]
  
  implement
  library_fetch_symbol {a} (lib, name) = let
    val (pfat, pfree | p) = $UN.ref_vtake (lib)
    val addr = dlsym (p->object_file, name)
  in
    if iseqz (addr) then
      Error("Symbol mapped to null.") where {
        prval () = pfree (pfat)
      }
    else let 
      prval () = pfree (pfat)
    in
      Ok ($UN.cast{a}{ptr} (addr))
    end
  end // end of [library_fetch_symbol]
  
  implement
  library_close (lib) = {
    val (pfat, pfree | p) = $UN.ref_vtake (lib)
    val _ = dlclose (p->object_file)
    val _ = bfd_close (p->file)
    prval () = pfree (pfat)
  } // end of [library_close]
  
end // end of [local]