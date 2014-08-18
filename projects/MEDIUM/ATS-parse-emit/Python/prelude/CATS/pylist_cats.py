######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

###### beg of [pylist_cats.py] ######

############################################

def pylist_nil(): return []

############################################

def pylist_is_nil(xs): return not(xs)
def pylist_isnot_nil(xs): return True if xs else False

############################################

def pylist_append(xs, x): xs.append(x); return
def pylist_extend(xs1, xs2): xs1.append(xs2); return

############################################

def pylist_pop_0(xs): return xs.pop()
def pylist_pop_1(xs, i): return xs.pop(i)

############################################

def pylist_insert(xs, i, x): xs.insert(i, x); return

############################################

def pylist_map(xs, f): return list(map(f, xs))
def pylist_filter(xs, f): return list(filter(f, xs))

############################################

def pylist_reduce(xs, ini, f):
  res = ini
  for x in iter(xs): res = f(res, x)
  return res

############################################

###### end of [pylist_cats.py] ######
