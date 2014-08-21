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
def ats2pypre_print_obj(x): print(x, end=''); return
def ats2pypre_println_obj(x): print(x, end='\n'); return
#
############################################
#
def ats2pypre_print_newline():
  print(end='\n'); sys.stdout.flush(); return
#
#for Python 3.3
#def ats2pypre_print_newline(): print(end='\n', flush=True); return
#
############################################
#
def ats2pypre_list_nil(): return None
def ats2pypre_list_cons(x, xs): return (x, xs)
#
############################################

###### end of [basics_cats.py] ######
