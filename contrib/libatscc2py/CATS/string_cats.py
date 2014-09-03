######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [string_cats.py]
######

######
from ats2pypre_basics_cats import *
######

############################################

def atspre_strlen(x): return (x.__len__())

############################################

def ats2pypre_string_get_at(x, i): return(x[i])

############################################

def ats2pypre_string_isalnum(x): return (x.isalnum())
def ats2pypre_string_isalpha(x): return (x.isalpha())
def ats2pypre_string_isdecimal(x): return (x.isdecimal())

############################################

def ats2pypre_string_lower(x): return (x.lower())
def ats2pypre_string_upper(x): return (x.upper())

############################################
#
def ats2pypre_print_string(x):
  return ats2pypre_fprint_string(sys.__stdout__, x)
def ats2pypre_prerr_string(x):
  return ats2pypre_fprint_string(sys.__stderr__, x)
#
def ats2pypre_fprint_string(out, x): return ats2pypre_fprint_obj(out, x)
#
############################################

###### end of [string_cats.py] ######
