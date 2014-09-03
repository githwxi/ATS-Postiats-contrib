######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [bool_cats.py]
######

######
from ats2pypre_basics_cats import *
######

############################################
#
def ats2pypre_not_bool0(x): return (not(x))
def ats2pypre_not_bool1(x): return (not(x))
#
############################################
#
def ats2pypre_print_bool(b):
  return ats2pypre_fprint_bool(sys.__stdout__, b)
def ats2pypre_prerr_bool(b):
  return ats2pypre_fprint_bool(sys.__stderr__, b)
#
def ats2pypre_fprint_bool(out, b): return ats2pypre_fprint_obj(out, b)
#
############################################

###### end of [bool_cats.py] ######
