######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

###### beg of [basics_cats.py] ######

############################################
#
def ATSCKiseqz(x): return (x == 0)
def ATSCKisneqz(x): return (x != 0)
#
def ATSCKptrisnil(xs): return (xs == None)
def ATSCKptriscons(xs): return (xs != None)
#
############################################
#
def atspre2py_list_nil(): return (0)
def atspre2py_list_cons(x, xs): return (x, xs)
#
############################################

###### end of [basics_cats.py] ######
