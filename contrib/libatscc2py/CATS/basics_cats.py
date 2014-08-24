######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [basics_cats.py]
######

######
import sys
######

############################################
#
def ATSCKiseqz(x): return (x == 0)
def ATSCKisneqz(x): return (x != 0)
#
def ATSCKptrisnil(xs): return (xs == None)
def ATSCKptriscons(xs): return (xs != None)
#
def ATSCKpat_int(tmp, given): return (tmp == given)
def ATSCKpat_bool(tmp, given): return (tmp == given)
def ATSCKpat_char(tmp, given): return (tmp == given)
def ATSCKpat_float(tmp, given): return (tmp == given)
#
############################################
#
def ats2pypre_print_obj(x):
  out = sys.__stdout__
  ats2pypre_fprint_obj(out, x); return
def ats2pypre_println_obj(x):
  out = sys.__stdout__
  ats2pypre_fprintln_obj(out, x); return
#
def ats2pypre_prerr_obj(x):
  out = sys.__stderr__
  ats2pypre_fprint_obj(out, x); return
def ats2pypre_prerrln_obj(x):
  out = sys.__stderr__
  ats2pypre_fprintln_obj(out, x); return
#
def ats2pypre_fprint_obj(out, x):
  print(x, file=out, end=''); return
def ats2pypre_fprintln_obj(out, x):
  print(x, file=out, end='\n'); return
#
############################################
#
def ats2pypre_print_newline():
  out = sys.__stdout__
  ats2pypre_fprint_newline(out); return
def ats2pypre_prerr_newline():
  out = sys.__stderr__
  ats2pypre_fprint_newline(out); return
#
def ats2pypre_fprint_newline(out):
  print(file=out, end='\n'); sys.stdout.flush(); return
#
############################################
#
def ats2pypre_list_nil(): return None
def ats2pypre_list_cons(x, xs): return (x, xs)
#
############################################

###### end of [basics_cats.py] ######
