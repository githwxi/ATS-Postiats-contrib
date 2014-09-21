(**
  A convenient way to wrap errors from C functions.
*)

#define ATS_STALOADFLAG 0

datatype Error (result:t@ype, error: t@ype) =
  | Ok of (result)
  | Error of (error)
  
typedef ErrorString (result:t@ype) = Error (result, string)