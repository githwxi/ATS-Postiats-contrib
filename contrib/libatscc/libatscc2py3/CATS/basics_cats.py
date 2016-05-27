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
def ATSCKptrisnull(xs): return (xs == None)
def ATSCKptriscons(xs): return (xs != None)
#
def ATSCKpat_int(tmp, given): return (tmp == given)
def ATSCKpat_bool(tmp, given): return (tmp == given)
def ATSCKpat_char(tmp, given): return (tmp == given)
def ATSCKpat_float(tmp, given): return (tmp == given)
#
def ATSCKpat_con0 (con, tag): return (con == tag)
def ATSCKpat_con1 (con, tag): return (con[0] == tag)
#
############################################
#
def ats2pypre_list_nil(): return None
def ats2pypre_list_cons(x, xs): return (x, xs)
#
############################################
#
def ATSINScaseof_fail(em):
  print("ATSINScaseof_fail:", em, file=sys.__stderr__); sys.exit(1)
  return
#
def ATSINSdeadcode_fail():
  print("ATSINSdeadcode_fail(", ")", file=sys.__stderr__); sys.exit(1)
  return
#
############################################

def ATSPMVempty(): return

############################################

def ATSPMVlazyval_eval(lazyval):
  flag = lazyval[0]
  thunk = None
  if (flag==0):
    lazyval[0] = 1
    thunk = lazyval[1]
    lazyval[1] = thunk[0](thunk)
  else:
    lazyval[0] = flag + 1
  return
#end-of-[ATSPMVlazyval_eval]

############################################
#
def ats2pypre_assert_bool0(tfv):
  if not(tfv): sys.exit(1)
  return
def ats2pypre_assert_bool1(tfv):
  if not(tfv): sys.exit(1)
  return
#
def ats2pypre_assert_errmsg_bool0(tfv, errmsg):
  if not(tfv):
    print(errmsg, file=sys.__stderr__); sys.exit(1)
  return
def ats2pypre_assert_errmsg_bool1(tfv, errmsg):
  if not(tfv):
    print(errmsg, file=sys.__stderr__); sys.exit(1)
  return
#
############################################

###### end of [atscc2py_basics.py] ######
