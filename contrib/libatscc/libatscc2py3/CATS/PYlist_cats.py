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
from ats2pypre_basics_cats import *
######

############################################

def PYlist_nil(): return []
def PYlist_sing(x): return [x]
def PYlist_pair(x1, x2): return [x1, x2]

############################################

def PYlist_cons(x0, xs): return xs.insert(0, x0)

############################################

def PYlist_make_elt(n, x):
  res = []
  while(n > 0):
    n -= 1; res = res.append (res, x)
  return res

############################################

def PYlist_is_nil(xs): return not(xs)
def PYlist_is_cons(xs): return True if xs else False
def PYlist_isnot_nil(xs): return True if xs else False

############################################

def PYlist_length(xs): return xs.__len__()

############################################

def PYlist_get_at(xs, ind): return xs[ind]
def PYlist_set_at(xs, ind, x): xs[ind] = x; return

############################################

def PYlist_copy(xs):
  res = []
  for x in iter(xs): res.append(x)
  return res

############################################

def PYlist_append(xs, x): xs.append(x); return
def PYlist_extend(xs1, xs2): xs1.extend(xs2); return

############################################

def PYlist_pop_0(xs): return xs.pop()
def PYlist_pop_1(xs, i): return xs.pop(i)

############################################

def PYlist_insert(xs, i, x): xs.insert(i, x); return

############################################

def PYlist_map(xs, f): return list(map(f, xs))
def PYlist_filter(xs, f): return list(filter(f, xs))

############################################

def PYlist_string_join(xs): return ''.join(xs)

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
