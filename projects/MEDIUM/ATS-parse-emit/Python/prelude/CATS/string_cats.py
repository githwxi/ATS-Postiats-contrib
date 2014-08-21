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
from basics_cats import *
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

def ats2pypre_print_string(x): ats2pypre_print_obj(x); return

############################################

###### end of [string_cats.py] ######
