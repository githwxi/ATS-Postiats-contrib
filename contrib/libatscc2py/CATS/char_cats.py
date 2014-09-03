######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [char_cats.py]
######

######
from ats2pypre_basics_cats import *
######

############################################
#
def ats2pypre_print_char(c):
  return ats2pypre_fprint_char(sys.__stdout__, c)
def ats2pypre_prerr_char(c):
  return ats2pypre_fprint_char(sys.__stderr__, c)
#
def ats2pypre_fprint_char(out, c): return ats2pypre_fprint_obj(out, c)
#
############################################

###### end of [char_cats.py] ######
