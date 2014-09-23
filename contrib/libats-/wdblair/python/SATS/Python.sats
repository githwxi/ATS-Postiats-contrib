%{#
#include "contrib/libats-/wdblair/python/CATS/Python.cats"
%}

abstype PyObject = ptr

fun Py_SetProgramName (string): void = "mac#"

(* ****** ****** *)

macdef Py_file_input = $extval(int, "Py_file_input")

(* ****** ****** *)

fun Py_Initialize (): void = "mac#"

(**
  1 - load signal handlers
  0 - don't
  
  This is good for when you want to embed python and
  not worry about it initializing extra things like its
  signal handlers.
*)
fun Py_InitializeEx (int): void = "mac#"

fun Py_Finalize (): void = "mac#"

(* ****** ****** *)

fun Py_InitModule (string, ptr): PyObject = "mac#"

(* ****** ****** *)

fun PyImport_Import (PyObject): PyObject = "mac#"
fun PyImport_AddModule (string): PyObject = "mac#"

(* ****** ****** *)

fun PyModule_GetDict (PyObject): PyObject = "mac#"

(* ****** ****** *)

fun PyRun_SimpleString (string): PyObject = "mac#"

fun PyRun_File (
  FILEref, string, int, PyObject, PyObject
): PyObject = "mac#"

(* ****** ****** *)

fun PyDict_GetItemString (PyObject, string): PyObject = "mac#"
fun PyDict_SetItemString (PyObject, string, PyObject): PyObject = "mac#"

fun PyDict_Keys (PyObject): PyObject = "mac#"

fun PyDict_Copy (PyObject): PyObject = "mac#"

(* ****** ****** *)

fun PyList_Size (PyObject): ssize_t = "mac#"
fun PyList_GetItem (PyObject, ssize_t): PyObject = "mac#"

(* ****** ****** *)

fun PyTuple_New (ssize_t): PyObject = "mac#"
fun PyTuple_SetItem (PyObject, ssize_t, PyObject): int = "mac#"

(* ****** ****** *)

fun PyObject_GetAttrString (PyObject, string): PyObject = "mac#"
fun PyObject_SetAttrString (PyObject, string, PyObject): int = "mac#"

fun PyObject_CallObject (PyObject, PyObject): PyObject = "mac#"

fun PyObject_Str (PyObject): PyObject = "mac#"

(* ****** ****** *)

fun PyLong_FromVoidPtr (ptr): PyObject = "mac#"
fun PyLong_AsVoidPtr (PyObject): ptr = "mac#"

(* ****** ****** *)

fun PyString_FromString (string): PyObject = "mac#"
fun PyString_AsString (PyObject): string = "mac#"

(* ****** ****** *)

fun PyErr_Fetch (
  &PyObject? >> PyObject, 
  &PyObject? >> PyObject, 
  &PyObject? >> PyObject
): void = "mac#"

fun PyErr_NormalizeException (
  &PyObject >> _,
  &PyObject >> _,
  &PyObject >> _
): void = "mac#"

(* ****** ****** *)

macdef Py_None = $extval (PyObject, "Py_None")

(* ****** ****** *)

fun Py_INCREF (PyObject): void = "mac#"
fun Py_DECREF (PyObject): void = "mac#"

(* ****** ****** *)