######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
# beg of [PYlist_cats.py]
######

######
from basics_cats import *
######

############################################

def PYlist_nil(): return []

############################################

def PYlist_is_nil(xs): return not(xs)
def PYlist_isnot_nil(xs): return True if xs else False

############################################

def PYlist_append(xs, x): xs.append(x); return
def PYlist_extend(xs1, xs2): xs1.append(xs2); return

############################################

def PYlist_pop_0(xs): return xs.pop()
def PYlist_pop_1(xs, i): return xs.pop(i)

############################################

def PYlist_insert(xs, i, x): xs.insert(i, x); return

############################################

def PYlist_map(xs, f): return list(map(f, xs))
def PYlist_filter(xs, f): return list(filter(f, xs))

############################################

def \
PYlist_reduce(xs, ini, f):
  res = ini
  for x in iter(xs): res = f(res, x)
  return res

############################################

def \
PYlist2list_rev(xs):
  res = ats2pypre_list_nil()
  for x in iter(xs): res = ats2pypre_list_cons(x, res)
  return res

############################################

###### end of [PYlist_cats.py] ######
