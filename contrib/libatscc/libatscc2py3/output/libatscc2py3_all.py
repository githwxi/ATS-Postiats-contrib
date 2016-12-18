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
  if (flag==0):
    lazyval[0] = 1
    mythunk = lazyval[1]
    lazyval[1] = mythunk[0](mythunk)
  else:
    lazyval[0] = flag + 1
  #endif
  return lazyval[1]
#end-of-[ATSPMVlazyval_eval]

############################################
#
def ATSPMVllazyval_eval(llazyval):
  return llazyval[0](llazyval, True)
def atspre_lazy_vt_free(llazyval):
  return llazyval[0](llazyval, False)
#
############################################

def ats2pypre_tostring(x): return str(x)
def ats2pypre_toString(x): return str(x)

############################################

def ats2pypre_lazy2cloref(lazyval): return lazyval[1]

############################################
#
def ats2pypre_exit(ecode):
  sys.exit(ecode); return
#
def ats2pypre_exit_errmsg(ecode, errmsg):
  print(errmsg, file=sys.__stderr__); sys.exit(1); return
#
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
#
def ats2pypre_cloref0_app(cf): return cf[0](cf)
def ats2pypre_cloref1_app(cf, x): return cf[0](cf, x)
def ats2pypre_cloref2_app(cf, x1, x2): return cf[0](cf, x1, x2)
def ats2pypre_cloref3_app(cf, x1, x2, x3): return cf[0](cf, x1, x2, x3)
#
############################################
#
def ats2pypre_cloref2fun0(cf):
  return lambda: ats2pypre_cloref0_app(cf)
def ats2pypre_cloref2fun1(cf):
  return lambda x: ats2pypre_cloref1_app(cf, x)
def ats2pypre_cloref2fun2(cf):
  return lambda x1, x2: ats2pypre_cloref2_app(cf, x1, x2)
def ats2pypre_cloref2fun3(cf):
  return lambda x1, x2, x3: ats2pypre_cloref3_app(cf, x1, x2, x3)
#
############################################

###### end of [basics_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [integer_cats.py]
######

############################################
#
def ats2pypre_abs_int0(x): return abs(x)
def ats2pypre_neg_int0(x): return ( -x )
#
def ats2pypre_succ_int0(x): return (x + 1)
def ats2pypre_succ_int1(x): return (x + 1)
#
def ats2pypre_pred_int0(x): return (x - 1)
def ats2pypre_pred_int1(x): return (x - 1)
#
############################################
#
def ats2pypre_add_int0_int0(x, y): return (x + y)
def ats2pypre_add_int1_int1(x, y): return (x + y)
#
def ats2pypre_sub_int0_int0(x, y): return (x - y)
def ats2pypre_sub_int1_int1(x, y): return (x - y)
#
def ats2pypre_mul_int0_int0(x, y): return (x * y)
def ats2pypre_mul_int1_int1(x, y): return (x * y)
#
def ats2pypre_div_int0_int0(x, y): return (x // y)
def ats2pypre_div_int1_int1(x, y): return (x // y)
#
def ats2pypre_mod_int0_int0(x, y): return (x % y)
def ats2pypre_mod_int1_int1(x, y): return (x % y)
def ats2pypre_nmod_int1_int1(x, y): return (x % y)
#
############################################
#
def ats2pypre_lt_int0_int0(x, y): return (x < y)
def ats2pypre_lt_int1_int1(x, y): return (x < y)
#
def ats2pypre_lte_int0_int0(x, y): return (x <= y)
def ats2pypre_lte_int1_int1(x, y): return (x <= y)
#
def ats2pypre_gt_int0_int0(x, y): return (x > y)
def ats2pypre_gt_int1_int1(x, y): return (x > y)
#
def ats2pypre_gte_int0_int0(x, y): return (x >= y)
def ats2pypre_gte_int1_int1(x, y): return (x >= y)
#
def ats2pypre_eq_int0_int0(x, y): return (x == y)
def ats2pypre_eq_int1_int1(x, y): return (x == y)
#
def ats2pypre_neq_int0_int0(x, y): return (x != y)
def ats2pypre_neq_int1_int1(x, y): return (x != y)
#
############################################
#
def ats2pypre_compare_int0_int0(x, y):
  return -1 if (x < y) else (1 if (x > y) else 0)
#
############################################
#
def ats2pypre_max_int0_int0(x, y): return (max(x, y))
def ats2pypre_max_int1_int1(x, y): return (max(x, y))
#
def ats2pypre_min_int0_int0(x, y): return (min(x, y))
def ats2pypre_min_int1_int1(x, y): return (min(x, y))
#
############################################
#
# HX-2016-06
# The code is in print_cats.py:
#
# def ats2pypre_print_int(i):
#   return ats2pypre_fprint_int(sys.__stdout__, i)
# def ats2pypre_prerr_int(i):
#   return ats2pypre_fprint_int(sys.__stderr__, i)
# def ats2pypre_fprint_int(out, i): return ats2pypre_fprint_obj(out, i)
#
############################################

###### end of [integer_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [bool_cats.py]
######

############################################
#
def ats2pypre_neg_bool0(x): return(not(x))
def ats2pypre_neg_bool1(x): return(not(x))
#
############################################

def ats2pypre_add_bool0_bool0(x, y): return(x or y)
def ats2pypre_add_bool0_bool1(x, y): return(x or y)
def ats2pypre_add_bool1_bool0(x, y): return(x or y)
def ats2pypre_add_bool1_bool1(x, y): return(x or y)

############################################

def ats2pypre_mul_bool0_bool0(x, y): return(x and y)
def ats2pypre_mul_bool0_bool1(x, y): return(x and y)
def ats2pypre_mul_bool1_bool0(x, y): return(x and y)
def ats2pypre_mul_bool1_bool1(x, y): return(x and y)

############################################
#
def ats2pypre_eq_bool0_bool0(x, y): return(x == y)
def ats2pypre_eq_bool1_bool1(x, y): return(x == y)
#
def ats2pypre_neq_bool0_bool0(x, y): return(x != y)
def ats2pypre_neq_bool1_bool1(x, y): return(x != y)
#
############################################

def ats2pypre_bool2int0(x): return(1 if x else 0)
def ats2pypre_bool2int1(x): return(1 if x else 0) 

############################################

def ats2pypre_int2bool0(x): return(True if x != 0 else False)
def ats2pypre_int2bool1(x): return(True if x != 0 else False)

############################################

###### end of [bool_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [char_cats.py]
######

############################################

###### end of [char_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [float_cats.py]
######

############################################
#
def ats2pypre_double2int(x): return int(x)
def ats2pypre_int_of_double(x): return int(x)
#
def ats2pypre_int2double(x): return float(x)
def ats2pypre_double_of_int(x): return float(x)
#
############################################
#
def ats2pypre_abs_double(x): return abs(x)
def ats2pypre_neg_double(x): return ( -x )
#
def ats2pypre_succ_double(x): return (x + 1)
def ats2pypre_pred_double(x): return (x + 1)
#
############################################
#
def ats2pypre_add_int_double(x, y): return (x + y)
def ats2pypre_sub_int_double(x, y): return (x - y)
def ats2pypre_mul_int_double(x, y): return (x * y)
def ats2pypre_div_int_double(x, y): return (x / y)
#
def ats2pypre_add_double_int(x, y): return (x + y)
def ats2pypre_sub_double_int(x, y): return (x - y)
def ats2pypre_mul_double_int(x, y): return (x * y)
def ats2pypre_div_double_int(x, y): return (x / y)
#
def ats2pypre_add_double_double(x, y): return (x + y)
def ats2pypre_sub_double_double(x, y): return (x - y)
def ats2pypre_mul_double_double(x, y): return (x * y)
def ats2pypre_div_double_double(x, y): return (x / y)
#
############################################
#
def ats2pypre_lt_int_double(x, y): return (x < y)
def ats2pypre_lte_int_double(x, y): return (x <= y)
def ats2pypre_gt_int_double(x, y): return (x > y)
def ats2pypre_gte_int_double(x, y): return (x >= y)
#
def ats2pypre_lt_double_int(x, y): return (x < y)
def ats2pypre_lte_double_int(x, y): return (x <= y)
def ats2pypre_gt_double_int(x, y): return (x > y)
def ats2pypre_gte_double_int(x, y): return (x >= y)
#
############################################
#
def ats2pypre_lt_double_double(x, y): return (x < y)
def ats2pypre_lte_double_double(x, y): return (x <= y)
def ats2pypre_gt_double_double(x, y): return (x > y)
def ats2pypre_gte_double_double(x, y): return (x >= y)
#
def ats2pypre_eq_double_double(x, y): return (x == y)
def ats2pypre_neq_double_double(x, y): return (x != y)
#
def ats2pypre_compare_double_double(x, y): return cmp(x, y)
#
############################################

###### end of [float_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [string_cats.py]
######

def ats2pypre_strchr_chr(x): return chr(x)
def ats2pypre_strchr_ord(x): return ord(x)

############################################

def ats2pypre_strlen(x): return (x.__len__())

############################################

def ats2pypre_string_length(x): return len(x)

############################################

def ats2pypre_string_get_at(x, i): return(x[i])

############################################

def ats2pypre_string_substring_beg_end(x, i, j): return(x[i:j])
def ats2pypre_string_substring_beg_len(x, i, n): return(x[i:i+n])

############################################
#
def ats2pypre_lt_string_string(x, y): return (x < y)
def ats2pypre_lte_string_string(x, y): return (x <= y)
#
def ats2pypre_gt_string_string(x, y): return (x > y)
def ats2pypre_gte_string_string(x, y): return (x >= y)
#
def ats2pypre_eq_string_string(x, y): return (x == y)
def ats2pypre_neq_string_string(x, y): return (x != y)
#
############################################
#
def ats2pypre_compare_string_string(x, y):
  return -1 if (x < y) else (1 if (x > y) else 0)
#
############################################

def ats2pypre_string_isalnum(x): return (x.isalnum())
def ats2pypre_string_isalpha(x): return (x.isalpha())
def ats2pypre_string_isdecimal(x): return (x.isdecimal())

############################################

def ats2pypre_string_lower(x): return (x.lower())
def ats2pypre_string_upper(x): return (x.upper())

############################################

def ats2pypre_string_append_2(x1, x2): return (x1+x2)
def ats2pypre_string_append_3(x1, x2, x3): return "".join((x1, x2, x3))
def ats2pypre_string_append_4(x1, x2, x3, x4): return "".join((x1, x2, x3, x4))

############################################

###### end of [string_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [print_cats.py]
######

############################################
#
def ats2pypre_print_int(i):
  return ats2pypre_fprint_int(sys.__stdout__, i)
def ats2pypre_prerr_int(i):
  return ats2pypre_fprint_int(sys.__stderr__, i)
#
def ats2pypre_fprint_int(out, i): return ats2pypre_fprint_obj(out, i)
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
#
def ats2pypre_print_char(c):
  return ats2pypre_fprint_char(sys.__stdout__, c)
def ats2pypre_prerr_char(c):
  return ats2pypre_fprint_char(sys.__stderr__, c)
#
def ats2pypre_fprint_char(out, c): return ats2pypre_fprint_obj(out, c)
#
############################################
#
def ats2pypre_print_double(i):
  return ats2pypre_fprint_double(sys.__stdout__, i)
def ats2pypre_prerr_double(i):
  return ats2pypre_fprint_double(sys.__stderr__, i)
#
def ats2pypre_fprint_double(out, i): return ats2pypre_fprint_obj(out, i)
#
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
#
def ats2pypre_print_obj(x):
  out = sys.__stdout__
  ats2pypre_fprint_obj(out, x); return
def ats2pypre_println_obj(x):
  out = sys.__stdout__
  ats2pypre_fprintln_obj(out, x); return
#
def ats2pypre_prerr_obj(x):
  out = sys.__stderr__
  ats2pypre_fprint_obj(out, x); return
def ats2pypre_prerrln_obj(x):
  out = sys.__stderr__
  ats2pypre_fprintln_obj(out, x); return
#
def ats2pypre_fprint_obj(out, x):
  print(x, file=out, end=''); return
def ats2pypre_fprintln_obj(out, x):
  print(x, file=out, end='\n'); return
#
############################################
#
def ats2pypre_print_newline():
  out = sys.__stdout__
  ats2pypre_fprint_newline(out); return
def ats2pypre_prerr_newline():
  out = sys.__stderr__
  ats2pypre_fprint_newline(out); return
#
def ats2pypre_fprint_newline(out):
  print(file=out, end='\n'); sys.stdout.flush(); return
#
############################################

###### end of [print_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
#beg of [filebas_cats.py]
######

############################################
#
ats2pypre_stdin = sys.__stdin__
ats2pypre_stdout = sys.__stdout__
ats2pypre_stderr = sys.__stderr__
#
############################################
#
def \
ats2pypre_fileref_open_exn(path, fm):
  return open(path, fm)
def \
ats2pypre_fileref_open_opt(path, fm):
  try:
    filr = open(path, fm)
    return ats2pypre_option_some(filr)
  except IOError:
    return ats2pypre_option_none()
#
def \
ats2pypre_fileref_close(filr): return filr.close()
#
def \
ats2pypre_fileref_get_file_string(filr): return filr.read(-1)
#
############################################

###### end of [filebas_cats.py] ######
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
import functools
######

############################################

def ats2pypre_PYlist_nil(): return []
def ats2pypre_PYlist_sing(x): return [x]
def ats2pypre_PYlist_pair(x1, x2): return [x1, x2]

############################################

def ats2pypre_PYlist_cons(x0, xs): return xs.insert(0, x0)

############################################

def ats2pypre_PYlist_make_elt(n, x):
  res = []
  while (n > 0): n = n - 1; res.append(x)
  return res

############################################

def ats2pypre_PYlist_is_nil(xs): return not(xs)
def ats2pypre_PYlist_is_cons(xs): return True if xs else False
def ats2pypre_PYlist_isnot_nil(xs): return True if xs else False

############################################

def ats2pypre_PYlist_length(xs): return xs.__len__()

############################################

def ats2pypre_PYlist_get_at(xs, ind): return xs[ind]
def ats2pypre_PYlist_set_at(xs, ind, x): xs[ind] = x; return

############################################

def ats2pypre_PYlist_copy(xs):
  res = []
  for x in iter(xs): res.append(x)
  return res

############################################

def ats2pypre_PYlist_append(xs, x): xs.append(x); return
def ats2pypre_PYlist_extend(xs1, xs2): xs1.extend(xs2); return

############################################

def ats2pypre_PYlist_pop_0(xs): return xs.pop()
def ats2pypre_PYlist_pop_1(xs, i): return xs.pop(i)

############################################

def ats2pypre_PYlist_insert(xs, i, x): xs.insert(i, x); return

############################################

def ats2pypre_PYlist_map(xs, f): return list(map(f, xs))
def ats2pypre_PYlist_filter(xs, f): return list(filter(f, xs))

############################################

def ats2pypre_PYlist_string_join(xs): return ''.join(xs)

############################################

def \
ats2pypre_PYlist_reduce(xs, ini, f):
  res = ini
  for x in iter(xs): res = f(res, x)
  return res

############################################

def ats2pypre_PYlist2list_rev(xs):
  res = ats2pypre_list_nil()
  for x in iter(xs): res = ats2pypre_list_cons(x, res)
  return res

############################################
#
def ats2pypre_PYlist_sort_2(xs, cmp):
  xs.sort(key=functools.cmp_to_key(ats2pypre_cloref2fun2(cmp))); return
#
############################################

###### end of [PYlist_cats.py] ######
######
#
# HX-2014-08:
# for Python code translated from ATS
#
######

######
# beg of [reference_cats.py]
######

############################################

def ats2pypre_ref(x): return [x]
def ats2pypre_ref_make_elt(x): return [x]

############################################
#
def ats2pypre_ref_get_elt(ref): return ref[0]
def ats2pypre_ref_set_elt(ref, x0): ref[0] = x0; return
#
def ats2pypre_ref_exch_elt(ref, x0): x1 = ref[0]; ref[0] = x0; return x1
#
############################################

###### end of [reference_cats.py] ######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def ats2pypre_string_fset_at(arg0, arg1, arg2):
  tmpret0 = None
  tmp1 = None
  tmp2 = None
  tmp3 = None
  tmp4 = None
  tmp5 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_string_fset_at
  tmp1 = ats2pypre_string_length(arg0)
  tmp2 = ats2pypre_string_substring_beg_end(arg0, 0, arg1)
  tmp4 = ats2pypre_add_int1_int1(arg1, 1)
  tmp3 = ats2pypre_string_substring_beg_end(arg0, tmp4, tmp1)
  tmp5 = ats2pypre_string_append_3(tmp2, arg2, tmp3)
  tmpret0 = tmp5
  return tmpret0

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######
######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_list_patsfun_31__closurerize(env0):
  def _ats2pypre_list_patsfun_31__cfun(cenv, arg0): return _ats2pypre_list_patsfun_31(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_31__cfun, env0)

def _ats2pypre_list_patsfun_35__closurerize(env0):
  def _ats2pypre_list_patsfun_35__cfun(cenv, arg0): return _ats2pypre_list_patsfun_35(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_35__cfun, env0)

def _ats2pypre_list_patsfun_38__closurerize(env0):
  def _ats2pypre_list_patsfun_38__cfun(cenv, arg0): return _ats2pypre_list_patsfun_38(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_38__cfun, env0)

def _ats2pypre_list_patsfun_42__closurerize(env0):
  def _ats2pypre_list_patsfun_42__cfun(cenv, arg0): return _ats2pypre_list_patsfun_42(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_42__cfun, env0)

def _ats2pypre_list_patsfun_46__closurerize(env0):
  def _ats2pypre_list_patsfun_46__cfun(cenv, arg0): return _ats2pypre_list_patsfun_46(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_46__cfun, env0)

def _ats2pypre_list_patsfun_50__closurerize(env0):
  def _ats2pypre_list_patsfun_50__cfun(cenv, arg0): return _ats2pypre_list_patsfun_50(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_50__cfun, env0)

def _ats2pypre_list_patsfun_53__closurerize(env0):
  def _ats2pypre_list_patsfun_53__cfun(cenv, arg0): return _ats2pypre_list_patsfun_53(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_53__cfun, env0)

def _ats2pypre_list_patsfun_57__closurerize(env0):
  def _ats2pypre_list_patsfun_57__cfun(cenv, arg0): return _ats2pypre_list_patsfun_57(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_57__cfun, env0)

def _ats2pypre_list_patsfun_61__closurerize(env0):
  def _ats2pypre_list_patsfun_61__cfun(cenv, arg0): return _ats2pypre_list_patsfun_61(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_61__cfun, env0)

def _ats2pypre_list_patsfun_65__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_65__cfun(cenv, arg0): return _ats2pypre_list_patsfun_65(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_65__cfun, env0, env1)

def _ats2pypre_list_patsfun_69__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_69__cfun(cenv, arg0): return _ats2pypre_list_patsfun_69(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_69__cfun, env0, env1)

def _ats2pypre_list_patsfun_73__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_73__cfun(cenv, arg0): return _ats2pypre_list_patsfun_73(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_73__cfun, env0, env1)

def _ats2pypre_list_patsfun_77__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_77__cfun(cenv, arg0): return _ats2pypre_list_patsfun_77(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_77__cfun, env0, env1)

def _ats2pypre_list_patsfun_82__closurerize(env0):
  def _ats2pypre_list_patsfun_82__cfun(cenv, arg0): return _ats2pypre_list_patsfun_82(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_82__cfun, env0)

def _ats2pypre_list_patsfun_85__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_85__cfun(cenv, arg0): return _ats2pypre_list_patsfun_85(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_85__cfun, env0, env1)

def _ats2pypre_list_patsfun_88__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_88__cfun(cenv, arg0): return _ats2pypre_list_patsfun_88(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_88__cfun, env0, env1)

def _ats2pypre_list_patsfun_90__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_90__cfun(cenv, arg0): return _ats2pypre_list_patsfun_90(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_90__cfun, env0, env1)

def ats2pypre_list_make_intrange_2(arg0, arg1):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_make_intrange_2
  tmpret2 = ats2pypre_list_make_intrange_3(arg0, arg1, 1)
  return tmpret2


def ats2pypre_list_make_intrange_3(arg0, arg1, arg2):
  tmpret3 = None
  tmp14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  tmp18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  tmp25 = None
  tmp26 = None
  tmp27 = None
  tmp28 = None
  tmp29 = None
  tmp30 = None
  tmp31 = None
  tmp32 = None
  tmp33 = None
  tmp34 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab6():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp14 = ats2pypre_gt_int0_int0(arg2, 0)
    if not(ATSCKpat_bool(tmp14, True)): tmplab_py = 2 ; return#__atstmplab7
    tmp15 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp15):
      tmp19 = ats2pypre_sub_int0_int0(arg1, arg0)
      tmp18 = ats2pypre_add_int0_int0(tmp19, arg2)
      tmp17 = ats2pypre_sub_int0_int0(tmp18, 1)
      tmp16 = ats2pypre_div_int0_int0(tmp17, arg2)
      tmp22 = ats2pypre_sub_int0_int0(tmp16, 1)
      tmp21 = ats2pypre_mul_int0_int0(tmp22, arg2)
      tmp20 = ats2pypre_add_int0_int0(arg0, tmp21)
      tmp23 = None
      tmpret3 = _ats2pypre_list_loop1_4(tmp16, tmp20, arg2, tmp23)
    else:
      tmpret3 = None
    #endif
    return
  def __atstmplab7():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp24 = ats2pypre_lt_int0_int0(arg2, 0)
    if not(ATSCKpat_bool(tmp24, True)): tmplab_py = 3 ; return#__atstmplab8
    tmp25 = ats2pypre_gt_int0_int0(arg0, arg1)
    if (tmp25):
      tmp26 = ats2pypre_neg_int0(arg2)
      tmp30 = ats2pypre_sub_int0_int0(arg0, arg1)
      tmp29 = ats2pypre_add_int0_int0(tmp30, tmp26)
      tmp28 = ats2pypre_sub_int0_int0(tmp29, 1)
      tmp27 = ats2pypre_div_int0_int0(tmp28, tmp26)
      tmp33 = ats2pypre_sub_int0_int0(tmp27, 1)
      tmp32 = ats2pypre_mul_int0_int0(tmp33, tmp26)
      tmp31 = ats2pypre_sub_int0_int0(arg0, tmp32)
      tmp34 = None
      tmpret3 = _ats2pypre_list_loop2_5(tmp27, tmp31, tmp26, tmp34)
    else:
      tmpret3 = None
    #endif
    return
  def __atstmplab8():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret3 = None
    return
  mbranch_1 = { 1: __atstmplab6, 2: __atstmplab7, 3: __atstmplab8 }
  #__patsflab_list_make_intrange_3
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret3


def _ats2pypre_list_loop1_4(arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret4 = None
  tmp5 = None
  tmp6 = None
  tmp7 = None
  tmp8 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop1_4
    tmp5 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp5):
      tmp6 = ats2pypre_sub_int0_int0(arg0, 1)
      tmp7 = ats2pypre_sub_int0_int0(arg1, arg2)
      tmp8 = (arg1, arg3)
      #ATStailcalseq_beg
      apy0 = tmp6
      apy1 = tmp7
      apy2 = arg2
      apy3 = tmp8
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_list_loop1_4
      #ATStailcalseq_end
    else:
      tmpret4 = arg3
    #endif
    if (funlab_py == 0): break
  return tmpret4


def _ats2pypre_list_loop2_5(arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret9 = None
  tmp10 = None
  tmp11 = None
  tmp12 = None
  tmp13 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop2_5
    tmp10 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp10):
      tmp11 = ats2pypre_sub_int0_int0(arg0, 1)
      tmp12 = ats2pypre_add_int0_int0(arg1, arg2)
      tmp13 = (arg1, arg3)
      #ATStailcalseq_beg
      apy0 = tmp11
      apy1 = tmp12
      apy2 = arg2
      apy3 = tmp13
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_list_loop2_5
      #ATStailcalseq_end
    else:
      tmpret9 = arg3
    #endif
    if (funlab_py == 0): break
  return tmpret9


def ats2pypre_list_length(arg0):
  tmpret46 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_length
  tmpret46 = _ats2pypre_list_loop_12(arg0, 0)
  return tmpret46


def _ats2pypre_list_loop_12(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret47 = None
  tmp49 = None
  tmp50 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab13():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab16
    __atstmplab14()
    return
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret47 = arg1
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab16()
    return
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp49 = arg0[1]
    tmp50 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp49
    apy1 = tmp50
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_12
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab13, 2: __atstmplab14, 3: __atstmplab15, 4: __atstmplab16 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_12
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret47


def ats2pypre_list_last(arg0):
  apy0 = None
  tmpret51 = None
  tmp52 = None
  tmp53 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab17():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp53)): tmplab_py = 4 ; return#__atstmplab20
    __atstmplab18()
    return
  def __atstmplab18():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret51 = tmp52
    return
  def __atstmplab19():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab20()
    return
  def __atstmplab20():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    #ATStailcalseq_beg
    apy0 = tmp53
    arg0 = apy0
    funlab_py = 1 #__patsflab_list_last
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab17, 2: __atstmplab18, 3: __atstmplab19, 4: __atstmplab20 }
  while(1):
    funlab_py = 0
    #__patsflab_list_last
    tmp52 = arg0[0]
    tmp53 = arg0[1]
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret51


def ats2pypre_list_get_at(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret54 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  tmp58 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab_list_get_at
    tmp55 = ats2pypre_eq_int1_int1(arg1, 0)
    if (tmp55):
      tmp56 = arg0[0]
      tmpret54 = tmp56
    else:
      tmp57 = arg0[1]
      tmp58 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp57
      apy1 = tmp58
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_get_at
      #ATStailcalseq_end
    #endif
    if (funlab_py == 0): break
  return tmpret54


def ats2pypre_list_snoc(arg0, arg1):
  tmpret59 = None
  tmp60 = None
  tmp61 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_snoc
  tmp61 = None
  tmp60 = (arg1, tmp61)
  tmpret59 = ats2pypre_list_append(arg0, tmp60)
  return tmpret59


def ats2pypre_list_extend(arg0, arg1):
  tmpret62 = None
  tmp63 = None
  tmp64 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_extend
  tmp64 = None
  tmp63 = (arg1, tmp64)
  tmpret62 = ats2pypre_list_append(arg0, tmp63)
  return tmpret62


def ats2pypre_list_append(arg0, arg1):
  tmpret65 = None
  tmp66 = None
  tmp67 = None
  tmp68 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab21():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab24
    __atstmplab22()
    return
  def __atstmplab22():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret65 = arg1
    return
  def __atstmplab23():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab24()
    return
  def __atstmplab24():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp66 = arg0[0]
    tmp67 = arg0[1]
    tmp68 = ats2pypre_list_append(tmp67, arg1)
    tmpret65 = (tmp66, tmp68)
    return
  mbranch_1 = { 1: __atstmplab21, 2: __atstmplab22, 3: __atstmplab23, 4: __atstmplab24 }
  #__patsflab_list_append
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret65


def ats2pypre_list_reverse(arg0):
  tmpret69 = None
  tmp70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_reverse
  tmp70 = None
  tmpret69 = ats2pypre_list_reverse_append(arg0, tmp70)
  return tmpret69


def ats2pypre_list_reverse_append(arg0, arg1):
  tmpret71 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_reverse_append
  tmpret71 = _ats2pypre_list_loop_20(arg0, arg1)
  return tmpret71


def _ats2pypre_list_loop_20(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret72 = None
  tmp73 = None
  tmp74 = None
  tmp75 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab25():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab28
    __atstmplab26()
    return
  def __atstmplab26():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret72 = arg1
    return
  def __atstmplab27():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab28()
    return
  def __atstmplab28():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp73 = arg0[0]
    tmp74 = arg0[1]
    tmp75 = (tmp73, arg1)
    #ATStailcalseq_beg
    apy0 = tmp74
    apy1 = tmp75
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_20
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab25, 2: __atstmplab26, 3: __atstmplab27, 4: __atstmplab28 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_20
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret72


def ats2pypre_list_concat(arg0):
  tmpret76 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_concat
  tmpret76 = _ats2pypre_list_auxlst_22(arg0)
  return tmpret76


def _ats2pypre_list_auxlst_22(arg0):
  tmpret77 = None
  tmp78 = None
  tmp79 = None
  tmp80 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab29():
    nonlocal arg0
    nonlocal tmpret77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab32
    __atstmplab30()
    return
  def __atstmplab30():
    nonlocal arg0
    nonlocal tmpret77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret77 = None
    return
  def __atstmplab31():
    nonlocal arg0
    nonlocal tmpret77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab32()
    return
  def __atstmplab32():
    nonlocal arg0
    nonlocal tmpret77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp78 = arg0[0]
    tmp79 = arg0[1]
    tmp80 = _ats2pypre_list_auxlst_22(tmp79)
    tmpret77 = ats2pypre_list_append(tmp78, tmp80)
    return
  mbranch_1 = { 1: __atstmplab29, 2: __atstmplab30, 3: __atstmplab31, 4: __atstmplab32 }
  #__patsflab__ats2pypre_list_auxlst_22
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret77


def ats2pypre_list_take(arg0, arg1):
  tmpret81 = None
  tmp82 = None
  tmp83 = None
  tmp84 = None
  tmp85 = None
  tmp86 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_take
  tmp82 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp82):
    tmp83 = arg0[0]
    tmp84 = arg0[1]
    tmp86 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp85 = ats2pypre_list_take(tmp84, tmp86)
    tmpret81 = (tmp83, tmp85)
  else:
    tmpret81 = None
  #endif
  return tmpret81


def ats2pypre_list_drop(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret87 = None
  tmp88 = None
  tmp89 = None
  tmp90 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab_list_drop
    tmp88 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp88):
      tmp89 = arg0[1]
      tmp90 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp89
      apy1 = tmp90
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_drop
      #ATStailcalseq_end
    else:
      tmpret87 = arg0
    #endif
    if (funlab_py == 0): break
  return tmpret87


def ats2pypre_list_split_at(arg0, arg1):
  tmpret91 = None
  tmp92 = None
  tmp93 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_split_at
  tmp92 = ats2pypre_list_take(arg0, arg1)
  tmp93 = ats2pypre_list_drop(arg0, arg1)
  tmpret91 = (tmp92, tmp93)
  return tmpret91


def ats2pypre_list_insert_at(arg0, arg1, arg2):
  tmpret94 = None
  tmp95 = None
  tmp96 = None
  tmp97 = None
  tmp98 = None
  tmp99 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_insert_at
  tmp95 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp95):
    tmp96 = arg0[0]
    tmp97 = arg0[1]
    tmp99 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp98 = ats2pypre_list_insert_at(tmp97, tmp99, arg2)
    tmpret94 = (tmp96, tmp98)
  else:
    tmpret94 = (arg2, arg0)
  #endif
  return tmpret94


def ats2pypre_list_remove_at(arg0, arg1):
  tmpret100 = None
  tmp101 = None
  tmp102 = None
  tmp103 = None
  tmp104 = None
  tmp105 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_remove_at
  tmp101 = arg0[0]
  tmp102 = arg0[1]
  tmp103 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp103):
    tmp105 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp104 = ats2pypre_list_remove_at(tmp102, tmp105)
    tmpret100 = (tmp101, tmp104)
  else:
    tmpret100 = tmp102
  #endif
  return tmpret100


def ats2pypre_list_takeout_at(arg0, arg1):
  tmpret106 = None
  tmp107 = None
  tmp108 = None
  tmp109 = None
  tmp110 = None
  tmp111 = None
  tmp112 = None
  tmp113 = None
  tmp114 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_takeout_at
  tmp107 = arg0[0]
  tmp108 = arg0[1]
  tmp109 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp109):
    tmp111 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp110 = ats2pypre_list_takeout_at(tmp108, tmp111)
    tmp112 = tmp110[0]
    tmp113 = tmp110[1]
    tmp114 = (tmp107, tmp113)
    tmpret106 = (tmp112, tmp114)
  else:
    tmpret106 = (tmp107, tmp108)
  #endif
  return tmpret106


def ats2pypre_list_exists(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret115 = None
  tmp116 = None
  tmp117 = None
  tmp118 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab33():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret115, tmp116, tmp117, tmp118
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab36
    __atstmplab34()
    return
  def __atstmplab34():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret115, tmp116, tmp117, tmp118
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret115 = False
    return
  def __atstmplab35():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret115, tmp116, tmp117, tmp118
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab36()
    return
  def __atstmplab36():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret115, tmp116, tmp117, tmp118
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp116 = arg0[0]
    tmp117 = arg0[1]
    tmp118 = arg1[0](arg1, tmp116)
    if (tmp118):
      tmpret115 = True
    else:
      #ATStailcalseq_beg
      apy0 = tmp117
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_exists
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab33, 2: __atstmplab34, 3: __atstmplab35, 4: __atstmplab36 }
  while(1):
    funlab_py = 0
    #__patsflab_list_exists
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret115


def ats2pypre_list_exists_method(arg0):
  tmpret119 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_exists_method
  tmpret119 = _ats2pypre_list_patsfun_31__closurerize(arg0)
  return tmpret119


def _ats2pypre_list_patsfun_31(env0, arg0):
  tmpret120 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_31
  tmpret120 = ats2pypre_list_exists(env0, arg0)
  return tmpret120


def ats2pypre_list_iexists(arg0, arg1):
  tmpret121 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iexists
  tmpret121 = _ats2pypre_list_loop_33(arg1, 0, arg0)
  return tmpret121


def _ats2pypre_list_loop_33(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret122 = None
  tmp123 = None
  tmp124 = None
  tmp125 = None
  tmp126 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab37():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret122, tmp123, tmp124, tmp125, tmp126
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab40
    __atstmplab38()
    return
  def __atstmplab38():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret122, tmp123, tmp124, tmp125, tmp126
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret122 = False
    return
  def __atstmplab39():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret122, tmp123, tmp124, tmp125, tmp126
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab40()
    return
  def __atstmplab40():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret122, tmp123, tmp124, tmp125, tmp126
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp123 = arg1[0]
    tmp124 = arg1[1]
    tmp125 = env0[0](env0, arg0, tmp123)
    if (tmp125):
      tmpret122 = True
    else:
      tmp126 = ats2pypre_add_int1_int1(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp126
      apy1 = tmp124
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_list_loop_33
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab37, 2: __atstmplab38, 3: __atstmplab39, 4: __atstmplab40 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_33
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret122


def ats2pypre_list_iexists_method(arg0):
  tmpret127 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iexists_method
  tmpret127 = _ats2pypre_list_patsfun_35__closurerize(arg0)
  return tmpret127


def _ats2pypre_list_patsfun_35(env0, arg0):
  tmpret128 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_35
  tmpret128 = ats2pypre_list_iexists(env0, arg0)
  return tmpret128


def ats2pypre_list_forall(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret129 = None
  tmp130 = None
  tmp131 = None
  tmp132 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab41():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret129, tmp130, tmp131, tmp132
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab44
    __atstmplab42()
    return
  def __atstmplab42():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret129, tmp130, tmp131, tmp132
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret129 = True
    return
  def __atstmplab43():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret129, tmp130, tmp131, tmp132
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab44()
    return
  def __atstmplab44():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret129, tmp130, tmp131, tmp132
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp130 = arg0[0]
    tmp131 = arg0[1]
    tmp132 = arg1[0](arg1, tmp130)
    if (tmp132):
      #ATStailcalseq_beg
      apy0 = tmp131
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_forall
      #ATStailcalseq_end
    else:
      tmpret129 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab41, 2: __atstmplab42, 3: __atstmplab43, 4: __atstmplab44 }
  while(1):
    funlab_py = 0
    #__patsflab_list_forall
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret129


def ats2pypre_list_forall_method(arg0):
  tmpret133 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_forall_method
  tmpret133 = _ats2pypre_list_patsfun_38__closurerize(arg0)
  return tmpret133


def _ats2pypre_list_patsfun_38(env0, arg0):
  tmpret134 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_38
  tmpret134 = ats2pypre_list_forall(env0, arg0)
  return tmpret134


def ats2pypre_list_iforall(arg0, arg1):
  tmpret135 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforall
  tmpret135 = _ats2pypre_list_loop_40(arg1, 0, arg0)
  return tmpret135


def _ats2pypre_list_loop_40(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret136 = None
  tmp137 = None
  tmp138 = None
  tmp139 = None
  tmp140 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab45():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret136, tmp137, tmp138, tmp139, tmp140
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab48
    __atstmplab46()
    return
  def __atstmplab46():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret136, tmp137, tmp138, tmp139, tmp140
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret136 = True
    return
  def __atstmplab47():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret136, tmp137, tmp138, tmp139, tmp140
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab48()
    return
  def __atstmplab48():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret136, tmp137, tmp138, tmp139, tmp140
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp137 = arg1[0]
    tmp138 = arg1[1]
    tmp139 = env0[0](env0, arg0, tmp137)
    if (tmp139):
      tmp140 = ats2pypre_add_int1_int1(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp140
      apy1 = tmp138
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_list_loop_40
      #ATStailcalseq_end
    else:
      tmpret136 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab45, 2: __atstmplab46, 3: __atstmplab47, 4: __atstmplab48 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_40
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret136


def ats2pypre_list_iforall_method(arg0):
  tmpret141 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforall_method
  tmpret141 = _ats2pypre_list_patsfun_42__closurerize(arg0)
  return tmpret141


def _ats2pypre_list_patsfun_42(env0, arg0):
  tmpret142 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_42
  tmpret142 = ats2pypre_list_iforall(env0, arg0)
  return tmpret142


def ats2pypre_list_app(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_app
  ats2pypre_list_foreach(arg0, arg1)
  return#_void


def ats2pypre_list_foreach(arg0, arg1):
  apy0 = None
  apy1 = None
  tmp145 = None
  tmp146 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab49():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp145, tmp146
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab52
    __atstmplab50()
    return
  def __atstmplab50():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp145, tmp146
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab51():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp145, tmp146
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab52()
    return
  def __atstmplab52():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp145, tmp146
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp145 = arg0[0]
    tmp146 = arg0[1]
    arg1[0](arg1, tmp145)
    #ATStailcalseq_beg
    apy0 = tmp146
    apy1 = arg1
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab_list_foreach
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab49, 2: __atstmplab50, 3: __atstmplab51, 4: __atstmplab52 }
  while(1):
    funlab_py = 0
    #__patsflab_list_foreach
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_list_foreach_method(arg0):
  tmpret148 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foreach_method
  tmpret148 = _ats2pypre_list_patsfun_46__closurerize(arg0)
  return tmpret148


def _ats2pypre_list_patsfun_46(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_46
  ats2pypre_list_foreach(env0, arg0)
  return#_void


def ats2pypre_list_iforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforeach
  _ats2pypre_list_aux_48(arg1, 0, arg0)
  return#_void


def _ats2pypre_list_aux_48(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmp152 = None
  tmp153 = None
  tmp155 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab53():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp152, tmp153, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab56
    __atstmplab54()
    return
  def __atstmplab54():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp152, tmp153, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab55():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp152, tmp153, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab56()
    return
  def __atstmplab56():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp152, tmp153, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp152 = arg1[0]
    tmp153 = arg1[1]
    env0[0](env0, arg0, tmp152)
    tmp155 = ats2pypre_add_int1_int1(arg0, 1)
    #ATStailcalseq_beg
    apy0 = tmp155
    apy1 = tmp153
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_aux_48
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab53, 2: __atstmplab54, 3: __atstmplab55, 4: __atstmplab56 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_48
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_list_iforeach_method(arg0):
  tmpret156 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforeach_method
  tmpret156 = _ats2pypre_list_patsfun_50__closurerize(arg0)
  return tmpret156


def _ats2pypre_list_patsfun_50(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_50
  ats2pypre_list_iforeach(env0, arg0)
  return#_void


def ats2pypre_list_rforeach(arg0, arg1):
  tmp159 = None
  tmp160 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab57():
    nonlocal arg0, arg1
    nonlocal tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab60
    __atstmplab58()
    return
  def __atstmplab58():
    nonlocal arg0, arg1
    nonlocal tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab59():
    nonlocal arg0, arg1
    nonlocal tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab60()
    return
  def __atstmplab60():
    nonlocal arg0, arg1
    nonlocal tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp159 = arg0[0]
    tmp160 = arg0[1]
    ats2pypre_list_rforeach(tmp160, arg1)
    arg1[0](arg1, tmp159)
    return
  mbranch_1 = { 1: __atstmplab57, 2: __atstmplab58, 3: __atstmplab59, 4: __atstmplab60 }
  #__patsflab_list_rforeach
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return#_void


def ats2pypre_list_rforeach_method(arg0):
  tmpret162 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_rforeach_method
  tmpret162 = _ats2pypre_list_patsfun_53__closurerize(arg0)
  return tmpret162


def _ats2pypre_list_patsfun_53(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_53
  ats2pypre_list_rforeach(env0, arg0)
  return#_void


def ats2pypre_list_filter(arg0, arg1):
  tmpret164 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_filter
  tmpret164 = _ats2pypre_list_aux_55(arg1, arg0)
  return tmpret164


def _ats2pypre_list_aux_55(env0, arg0):
  apy0 = None
  tmpret165 = None
  tmp166 = None
  tmp167 = None
  tmp168 = None
  tmp169 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab61():
    nonlocal env0, arg0
    nonlocal apy0, tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab64
    __atstmplab62()
    return
  def __atstmplab62():
    nonlocal env0, arg0
    nonlocal apy0, tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret165 = None
    return
  def __atstmplab63():
    nonlocal env0, arg0
    nonlocal apy0, tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab64()
    return
  def __atstmplab64():
    nonlocal env0, arg0
    nonlocal apy0, tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp166 = arg0[0]
    tmp167 = arg0[1]
    tmp168 = env0[0](env0, tmp166)
    if (tmp168):
      tmp169 = _ats2pypre_list_aux_55(env0, tmp167)
      tmpret165 = (tmp166, tmp169)
    else:
      #ATStailcalseq_beg
      apy0 = tmp167
      arg0 = apy0
      funlab_py = 1 #__patsflab__ats2pypre_list_aux_55
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab61, 2: __atstmplab62, 3: __atstmplab63, 4: __atstmplab64 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_55
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret165


def ats2pypre_list_filter_method(arg0):
  tmpret170 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_filter_method
  tmpret170 = _ats2pypre_list_patsfun_57__closurerize(arg0)
  return tmpret170


def _ats2pypre_list_patsfun_57(env0, arg0):
  tmpret171 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_57
  tmpret171 = ats2pypre_list_filter(env0, arg0)
  return tmpret171


def ats2pypre_list_map(arg0, arg1):
  tmpret172 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_map
  tmpret172 = _ats2pypre_list_aux_59(arg1, arg0)
  return tmpret172


def _ats2pypre_list_aux_59(env0, arg0):
  tmpret173 = None
  tmp174 = None
  tmp175 = None
  tmp176 = None
  tmp177 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab65():
    nonlocal env0, arg0
    nonlocal tmpret173, tmp174, tmp175, tmp176, tmp177
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab68
    __atstmplab66()
    return
  def __atstmplab66():
    nonlocal env0, arg0
    nonlocal tmpret173, tmp174, tmp175, tmp176, tmp177
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret173 = None
    return
  def __atstmplab67():
    nonlocal env0, arg0
    nonlocal tmpret173, tmp174, tmp175, tmp176, tmp177
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab68()
    return
  def __atstmplab68():
    nonlocal env0, arg0
    nonlocal tmpret173, tmp174, tmp175, tmp176, tmp177
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp174 = arg0[0]
    tmp175 = arg0[1]
    tmp176 = env0[0](env0, tmp174)
    tmp177 = _ats2pypre_list_aux_59(env0, tmp175)
    tmpret173 = (tmp176, tmp177)
    return
  mbranch_1 = { 1: __atstmplab65, 2: __atstmplab66, 3: __atstmplab67, 4: __atstmplab68 }
  #__patsflab__ats2pypre_list_aux_59
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret173


def ats2pypre_list_map_method(arg0, arg1):
  tmpret178 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_map_method
  tmpret178 = _ats2pypre_list_patsfun_61__closurerize(arg0)
  return tmpret178


def _ats2pypre_list_patsfun_61(env0, arg0):
  tmpret179 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_61
  tmpret179 = ats2pypre_list_map(env0, arg0)
  return tmpret179


def ats2pypre_list_foldleft(arg0, arg1, arg2):
  tmpret180 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldleft
  tmpret180 = _ats2pypre_list_loop_63(arg2, arg1, arg0)
  return tmpret180


def _ats2pypre_list_loop_63(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret181 = None
  tmp182 = None
  tmp183 = None
  tmp184 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab69():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab72
    __atstmplab70()
    return
  def __atstmplab70():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret181 = arg0
    return
  def __atstmplab71():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab72()
    return
  def __atstmplab72():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp182 = arg1[0]
    tmp183 = arg1[1]
    tmp184 = env0[0](env0, arg0, tmp182)
    #ATStailcalseq_beg
    apy0 = tmp184
    apy1 = tmp183
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_63
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab69, 2: __atstmplab70, 3: __atstmplab71, 4: __atstmplab72 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_63
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret181


def ats2pypre_list_foldleft_method(arg0, arg1):
  tmpret185 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldleft_method
  tmpret185 = _ats2pypre_list_patsfun_65__closurerize(arg0, arg1)
  return tmpret185


def _ats2pypre_list_patsfun_65(env0, env1, arg0):
  tmpret186 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_65
  tmpret186 = ats2pypre_list_foldleft(env0, env1, arg0)
  return tmpret186


def ats2pypre_list_ifoldleft(arg0, arg1, arg2):
  tmpret187 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldleft
  tmpret187 = _ats2pypre_list_loop_67(arg2, 0, arg1, arg0)
  return tmpret187


def _ats2pypre_list_loop_67(env0, arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret188 = None
  tmp189 = None
  tmp190 = None
  tmp191 = None
  tmp192 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab73():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret188, tmp189, tmp190, tmp191, tmp192
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg2)): tmplab_py = 4 ; return#__atstmplab76
    __atstmplab74()
    return
  def __atstmplab74():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret188, tmp189, tmp190, tmp191, tmp192
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret188 = arg1
    return
  def __atstmplab75():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret188, tmp189, tmp190, tmp191, tmp192
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab76()
    return
  def __atstmplab76():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret188, tmp189, tmp190, tmp191, tmp192
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp189 = arg2[0]
    tmp190 = arg2[1]
    tmp191 = ats2pypre_add_int1_int1(arg0, 1)
    tmp192 = env0[0](env0, arg0, arg1, tmp189)
    #ATStailcalseq_beg
    apy0 = tmp191
    apy1 = tmp192
    apy2 = tmp190
    arg0 = apy0
    arg1 = apy1
    arg2 = apy2
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_67
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab73, 2: __atstmplab74, 3: __atstmplab75, 4: __atstmplab76 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_67
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret188


def ats2pypre_list_ifoldleft_method(arg0, arg1):
  tmpret193 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldleft_method
  tmpret193 = _ats2pypre_list_patsfun_69__closurerize(arg0, arg1)
  return tmpret193


def _ats2pypre_list_patsfun_69(env0, env1, arg0):
  tmpret194 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_69
  tmpret194 = ats2pypre_list_ifoldleft(env0, env1, arg0)
  return tmpret194


def ats2pypre_list_foldright(arg0, arg1, arg2):
  tmpret195 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldright
  tmpret195 = _ats2pypre_list_aux_71(arg1, arg0, arg2)
  return tmpret195


def _ats2pypre_list_aux_71(env0, arg0, arg1):
  tmpret196 = None
  tmp197 = None
  tmp198 = None
  tmp199 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab77():
    nonlocal env0, arg0, arg1
    nonlocal tmpret196, tmp197, tmp198, tmp199
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab80
    __atstmplab78()
    return
  def __atstmplab78():
    nonlocal env0, arg0, arg1
    nonlocal tmpret196, tmp197, tmp198, tmp199
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret196 = arg1
    return
  def __atstmplab79():
    nonlocal env0, arg0, arg1
    nonlocal tmpret196, tmp197, tmp198, tmp199
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab80()
    return
  def __atstmplab80():
    nonlocal env0, arg0, arg1
    nonlocal tmpret196, tmp197, tmp198, tmp199
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp197 = arg0[0]
    tmp198 = arg0[1]
    tmp199 = _ats2pypre_list_aux_71(env0, tmp198, arg1)
    tmpret196 = env0[0](env0, tmp197, tmp199)
    return
  mbranch_1 = { 1: __atstmplab77, 2: __atstmplab78, 3: __atstmplab79, 4: __atstmplab80 }
  #__patsflab__ats2pypre_list_aux_71
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret196


def ats2pypre_list_foldright_method(arg0, arg1):
  tmpret200 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldright_method
  tmpret200 = _ats2pypre_list_patsfun_73__closurerize(arg0, arg1)
  return tmpret200


def _ats2pypre_list_patsfun_73(env0, env1, arg0):
  tmpret201 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_73
  tmpret201 = ats2pypre_list_foldright(env0, arg0, env1)
  return tmpret201


def ats2pypre_list_ifoldright(arg0, arg1, arg2):
  tmpret202 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldright
  tmpret202 = _ats2pypre_list_aux_75(arg1, 0, arg0, arg2)
  return tmpret202


def _ats2pypre_list_aux_75(env0, arg0, arg1, arg2):
  tmpret203 = None
  tmp204 = None
  tmp205 = None
  tmp206 = None
  tmp207 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab81():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret203, tmp204, tmp205, tmp206, tmp207
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab84
    __atstmplab82()
    return
  def __atstmplab82():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret203, tmp204, tmp205, tmp206, tmp207
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret203 = arg2
    return
  def __atstmplab83():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret203, tmp204, tmp205, tmp206, tmp207
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab84()
    return
  def __atstmplab84():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret203, tmp204, tmp205, tmp206, tmp207
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp204 = arg1[0]
    tmp205 = arg1[1]
    tmp207 = ats2pypre_add_int1_int1(arg0, 1)
    tmp206 = _ats2pypre_list_aux_75(env0, tmp207, tmp205, arg2)
    tmpret203 = env0[0](env0, arg0, tmp204, tmp206)
    return
  mbranch_1 = { 1: __atstmplab81, 2: __atstmplab82, 3: __atstmplab83, 4: __atstmplab84 }
  #__patsflab__ats2pypre_list_aux_75
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret203


def ats2pypre_list_ifoldright_method(arg0, arg1):
  tmpret208 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldright_method
  tmpret208 = _ats2pypre_list_patsfun_77__closurerize(arg0, arg1)
  return tmpret208


def _ats2pypre_list_patsfun_77(env0, env1, arg0):
  tmpret209 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_77
  tmpret209 = ats2pypre_list_ifoldright(env0, arg0, env1)
  return tmpret209


def ats2pypre_streamize_list_elt(arg0):
  tmpret212 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_streamize_list_elt
  tmpret212 = _ats2pypre_list_auxmain_81(arg0)
  return tmpret212


def _ats2pypre_list_auxmain_81(arg0):
  tmpret213 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_auxmain_81
  tmpret213 = _ats2pypre_list_patsfun_82__closurerize(arg0)
  return tmpret213


def _ats2pypre_list_patsfun_82(env0, arg0):
  tmpret214 = None
  tmp215 = None
  tmp216 = None
  tmp217 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab85():
    nonlocal env0, arg0
    nonlocal tmpret214, tmp215, tmp216, tmp217
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env0)): tmplab_py = 4 ; return#__atstmplab88
    __atstmplab86()
    return
  def __atstmplab86():
    nonlocal env0, arg0
    nonlocal tmpret214, tmp215, tmp216, tmp217
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret214 = None
    return
  def __atstmplab87():
    nonlocal env0, arg0
    nonlocal tmpret214, tmp215, tmp216, tmp217
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab88()
    return
  def __atstmplab88():
    nonlocal env0, arg0
    nonlocal tmpret214, tmp215, tmp216, tmp217
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp215 = env0[0]
    tmp216 = env0[1]
    tmp217 = _ats2pypre_list_auxmain_81(tmp216)
    tmpret214 = (tmp215, tmp217)
    return
  mbranch_1 = { 1: __atstmplab85, 2: __atstmplab86, 3: __atstmplab87, 4: __atstmplab88 }
  #__patsflab__ats2pypre_list_patsfun_82
  if (arg0):
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  #endif
  return tmpret214


def ats2pypre_streamize_list_zip(arg0, arg1):
  tmpret218 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_streamize_list_zip
  tmpret218 = _ats2pypre_list_auxmain_84(arg0, arg1)
  return tmpret218


def _ats2pypre_list_auxmain_84(arg0, arg1):
  tmpret219 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_auxmain_84
  tmpret219 = _ats2pypre_list_patsfun_85__closurerize(arg0, arg1)
  return tmpret219


def _ats2pypre_list_patsfun_85(env0, env1, arg0):
  tmpret220 = None
  tmp221 = None
  tmp222 = None
  tmp223 = None
  tmp224 = None
  tmp225 = None
  tmp226 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab89():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(env0)): tmplab_py = 4 ; return#__atstmplab92
    __atstmplab90()
    return
  def __atstmplab90():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret220 = None
    return
  def __atstmplab91():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab92()
    return
  def __atstmplab92():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp221 = env0[0]
    tmp222 = env0[1]
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab93():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(env1)): tmplab_py = 4 ; return#__atstmplab96
    __atstmplab94()
    return
  def __atstmplab94():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret220 = None
    return
  def __atstmplab95():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab96()
    return
  def __atstmplab96():
    nonlocal env0, env1, arg0
    nonlocal tmpret220, tmp221, tmp222, tmp223, tmp224, tmp225, tmp226
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp223 = env1[0]
    tmp224 = env1[1]
    tmp225 = (tmp221, tmp223)
    tmp226 = _ats2pypre_list_auxmain_84(tmp222, tmp224)
    tmpret220 = (tmp225, tmp226)
    return
  mbranch_1 = { 1: __atstmplab89, 2: __atstmplab90, 3: __atstmplab91, 4: __atstmplab92 }
  mbranch_2 = { 1: __atstmplab93, 2: __atstmplab94, 3: __atstmplab95, 4: __atstmplab96 }
  #__patsflab__ats2pypre_list_patsfun_85
  if (arg0):
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  #endif
  return tmpret220


def ats2pypre_streamize_list_cross(arg0, arg1):
  tmpret227 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_streamize_list_cross
  tmpret227 = _ats2pypre_list_auxmain_89(arg0, arg1)
  return tmpret227


def _ats2pypre_list_auxone_87(arg0, arg1):
  tmpret228 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_auxone_87
  tmpret228 = _ats2pypre_list_patsfun_88__closurerize(arg0, arg1)
  return tmpret228


def _ats2pypre_list_patsfun_88(env0, env1, arg0):
  tmpret229 = None
  tmp230 = None
  tmp231 = None
  tmp232 = None
  tmp233 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab97():
    nonlocal env0, env1, arg0
    nonlocal tmpret229, tmp230, tmp231, tmp232, tmp233
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env1)): tmplab_py = 4 ; return#__atstmplab100
    __atstmplab98()
    return
  def __atstmplab98():
    nonlocal env0, env1, arg0
    nonlocal tmpret229, tmp230, tmp231, tmp232, tmp233
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret229 = None
    return
  def __atstmplab99():
    nonlocal env0, env1, arg0
    nonlocal tmpret229, tmp230, tmp231, tmp232, tmp233
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab100()
    return
  def __atstmplab100():
    nonlocal env0, env1, arg0
    nonlocal tmpret229, tmp230, tmp231, tmp232, tmp233
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp230 = env1[0]
    tmp231 = env1[1]
    tmp232 = (env0, tmp230)
    tmp233 = _ats2pypre_list_auxone_87(env0, tmp231)
    tmpret229 = (tmp232, tmp233)
    return
  mbranch_1 = { 1: __atstmplab97, 2: __atstmplab98, 3: __atstmplab99, 4: __atstmplab100 }
  #__patsflab__ats2pypre_list_patsfun_88
  if (arg0):
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  #endif
  return tmpret229


def _ats2pypre_list_auxmain_89(arg0, arg1):
  tmpret234 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_auxmain_89
  tmpret234 = _ats2pypre_list_patsfun_90__closurerize(arg0, arg1)
  return tmpret234


def _ats2pypre_list_patsfun_90(env0, env1, arg0):
  tmpret235 = None
  tmp236 = None
  tmp237 = None
  tmp238 = None
  tmp239 = None
  tmp240 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab101():
    nonlocal env0, env1, arg0
    nonlocal tmpret235, tmp236, tmp237, tmp238, tmp239, tmp240
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env0)): tmplab_py = 4 ; return#__atstmplab104
    __atstmplab102()
    return
  def __atstmplab102():
    nonlocal env0, env1, arg0
    nonlocal tmpret235, tmp236, tmp237, tmp238, tmp239, tmp240
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret235 = None
    return
  def __atstmplab103():
    nonlocal env0, env1, arg0
    nonlocal tmpret235, tmp236, tmp237, tmp238, tmp239, tmp240
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab104()
    return
  def __atstmplab104():
    nonlocal env0, env1, arg0
    nonlocal tmpret235, tmp236, tmp237, tmp238, tmp239, tmp240
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp236 = env0[0]
    tmp237 = env0[1]
    tmp239 = _ats2pypre_list_auxone_87(tmp236, env1)
    tmp240 = _ats2pypre_list_auxmain_89(tmp237, env1)
    tmp238 = ats2pypre_stream_vt_append(tmp239, tmp240)
    tmpret235 = ATSPMVllazyval_eval(tmp238)
    return
  mbranch_1 = { 1: __atstmplab101, 2: __atstmplab102, 3: __atstmplab103, 4: __atstmplab104 }
  #__patsflab__ats2pypre_list_patsfun_90
  if (arg0):
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  #endif
  return tmpret235


def ats2pypre_PYlist_oflist(arg0):
  tmpret243 = None
  tmp248 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_PYlist_oflist
  tmp248 = ats2pypre_PYlist_nil()
  tmpret243 = _ats2pypre_list_aux_94(arg0, tmp248)
  return tmpret243


def _ats2pypre_list_aux_94(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret244 = None
  tmp245 = None
  tmp246 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab105():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret244, tmp245, tmp246
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab108
    __atstmplab106()
    return
  def __atstmplab106():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret244, tmp245, tmp246
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret244 = arg1
    return
  def __atstmplab107():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret244, tmp245, tmp246
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab108()
    return
  def __atstmplab108():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret244, tmp245, tmp246
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp245 = arg0[0]
    tmp246 = arg0[1]
    ats2pypre_PYlist_append(arg1, tmp245)
    #ATStailcalseq_beg
    apy0 = tmp246
    apy1 = arg1
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_aux_94
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab105, 2: __atstmplab106, 3: __atstmplab107, 4: __atstmplab108 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_94
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret244


def ats2pypre_PYlist_oflist_rev(arg0):
  tmpret249 = None
  tmp254 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_PYlist_oflist_rev
  tmp254 = ats2pypre_PYlist_nil()
  tmpret249 = _ats2pypre_list_aux_96(arg0, tmp254)
  return tmpret249


def _ats2pypre_list_aux_96(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret250 = None
  tmp251 = None
  tmp252 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab109():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret250, tmp251, tmp252
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab112
    __atstmplab110()
    return
  def __atstmplab110():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret250, tmp251, tmp252
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret250 = arg1
    return
  def __atstmplab111():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret250, tmp251, tmp252
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab112()
    return
  def __atstmplab112():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret250, tmp251, tmp252
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp251 = arg0[0]
    tmp252 = arg0[1]
    ats2pypre_PYlist_cons(tmp251, arg1)
    #ATStailcalseq_beg
    apy0 = tmp252
    apy1 = arg1
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_aux_96
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab109, 2: __atstmplab110, 3: __atstmplab111, 4: __atstmplab112 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_96
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret250


def ats2pypre_list_sort_2(arg0, arg1):
  tmpret255 = None
  tmp256 = None
  tmp258 = None
  tmp264 = None
  tmp265 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_sort_2
  tmp256 = ats2pypre_PYlist_oflist(arg0)
  ats2pypre_PYlist_sort_2(tmp256, arg1)
  tmp258 = ats2pypre_PYlist_length(tmp256)
  tmp265 = None
  tmp264 = _ats2pypre_list_loop_98(tmp256, tmp258, 0, tmp265)
  tmpret255 = tmp264
  return tmpret255


def _ats2pypre_list_loop_98(env0, env1, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret259 = None
  tmp260 = None
  tmp261 = None
  tmp262 = None
  tmp263 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_98
    tmp260 = ats2pypre_lt_int0_int0(arg0, env1)
    if (tmp260):
      tmp261 = ats2pypre_add_int0_int0(arg0, 1)
      tmp263 = ats2pypre_PYlist_pop_0(env0)
      tmp262 = (tmp263, arg1)
      #ATStailcalseq_beg
      apy0 = tmp261
      apy1 = tmp262
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_list_loop_98
      #ATStailcalseq_end
    else:
      tmpret259 = arg1
    #endif
    if (funlab_py == 0): break
  return tmpret259

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def ats2pypre_list_vt_length(arg0):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_length
  tmpret2 = _ats2pypre_list_loop_3(arg0, 0)
  return tmpret2


def _ats2pypre_list_loop_3(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret3 = None
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret3 = arg1
    return
  def __atstmplab10():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret3, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp5 = arg0[1]
    tmp6 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp5
    apy1 = tmp6
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_3
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_3
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret3


def ats2pypre_list_vt_snoc(arg0, arg1):
  tmpret7 = None
  tmp8 = None
  tmp9 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_snoc
  tmp9 = None
  tmp8 = (arg1, tmp9)
  tmpret7 = ats2pypre_list_vt_append(arg0, tmp8)
  return tmpret7


def ats2pypre_list_vt_extend(arg0, arg1):
  tmpret10 = None
  tmp11 = None
  tmp12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_extend
  tmp12 = None
  tmp11 = (arg1, tmp12)
  tmpret10 = ats2pypre_list_vt_append(arg0, tmp11)
  return tmpret10


def ats2pypre_list_vt_append(arg0, arg1):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_append
  tmpret13 = _ats2pypre_list_aux_7(arg0, arg1)
  return tmpret13


def _ats2pypre_list_aux_7(arg0, arg1):
  tmpret14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret14 = arg1
    return
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal tmpret14, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp15 = arg0[0]
    tmp16 = arg0[1]
    #ATSINSfreecon(arg0);
    tmp17 = _ats2pypre_list_aux_7(tmp16, arg1)
    tmpret14 = (tmp15, tmp17)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_list_aux_7
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret14


def ats2pypre_list_vt_reverse(arg0):
  tmpret18 = None
  tmp19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_reverse
  tmp19 = None
  tmpret18 = ats2pypre_list_vt_reverse_append(arg0, tmp19)
  return tmpret18


def ats2pypre_list_vt_reverse_append(arg0, arg1):
  tmpret20 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_vt_reverse_append
  tmpret20 = _ats2pypre_list_loop_10(arg0, arg1)
  return tmpret20


def _ats2pypre_list_loop_10(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret21 = arg1
    return
  def __atstmplab18():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp23, tmp24
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp22 = arg0[0]
    tmp23 = arg0[1]
    #ATSINSfreecon(arg0);
    tmp24 = (tmp22, arg1)
    #ATStailcalseq_beg
    apy0 = tmp23
    apy1 = tmp24
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_10
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_10
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret21

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def ats2pypre_option_some(arg0):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_some
  tmpret0 = (arg0, )
  return tmpret0


def ats2pypre_option_none():
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_none
  tmpret1 = None
  return tmpret1


def ats2pypre_option_unsome(arg0):
  tmpret2 = None
  tmp3 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_option_unsome
  tmp3 = arg0[0]
  tmpret2 = tmp3
  return tmpret2


def ats2pypre_option_is_some(arg0):
  tmpret4 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptrisnull(arg0)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = True
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret4
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = False
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab_option_is_some
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret4


def ats2pypre_option_is_none(arg0):
  tmpret5 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab4():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret5 = True
    return
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret5 = False
    return
  mbranch_1 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab_option_is_none
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret5

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_stream_patsfun_6__closurerize(env0):
  def _ats2pypre_stream_patsfun_6__cfun(cenv): return _ats2pypre_stream_patsfun_6(cenv[1])
  return (_ats2pypre_stream_patsfun_6__cfun, env0)

def _ats2pypre_stream_patsfun_17__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_17__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_17(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_patsfun_17__cfun, env0, env1)

def _ats2pypre_stream_patsfun_23__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_23__cfun(cenv): return _ats2pypre_stream_patsfun_23(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_23__cfun, env0, env1)

def _ats2pypre_stream_patsfun_25__closurerize(env0):
  def _ats2pypre_stream_patsfun_25__cfun(cenv): return _ats2pypre_stream_patsfun_25(cenv[1])
  return (_ats2pypre_stream_patsfun_25__cfun, env0)

def _ats2pypre_stream_patsfun_27__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_27__cfun(cenv): return _ats2pypre_stream_patsfun_27(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_27__cfun, env0, env1)

def _ats2pypre_stream_patsfun_29__closurerize(env0):
  def _ats2pypre_stream_patsfun_29__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_29(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_29__cfun, env0)

def _ats2pypre_stream_patsfun_31__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_31__cfun(cenv): return _ats2pypre_stream_patsfun_31(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_31__cfun, env0, env1)

def _ats2pypre_stream_patsfun_33__closurerize(env0):
  def _ats2pypre_stream_patsfun_33__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_33(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_33__cfun, env0)

def _ats2pypre_stream_patsfun_36__closurerize(env0):
  def _ats2pypre_stream_patsfun_36__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_36(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_36__cfun, env0)

def _ats2pypre_stream_patsfun_39__closurerize(env0):
  def _ats2pypre_stream_patsfun_39__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_39(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_39__cfun, env0)

def _ats2pypre_stream_patsfun_42__closurerize(env0):
  def _ats2pypre_stream_patsfun_42__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_42(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_42__cfun, env0)

def _ats2pypre_stream_patsfun_46__closurerize(env0):
  def _ats2pypre_stream_patsfun_46__cfun(cenv, arg0): return _ats2pypre_stream_patsfun_46(cenv[1], arg0)
  return (_ats2pypre_stream_patsfun_46__cfun, env0)

def _ats2pypre_stream_patsfun_49__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_49__cfun(cenv): return _ats2pypre_stream_patsfun_49(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_49__cfun, env0, env1)

def _ats2pypre_stream_patsfun_52__closurerize(env0, env1, env2, env3):
  def _ats2pypre_stream_patsfun_52__cfun(cenv): return _ats2pypre_stream_patsfun_52(cenv[1], cenv[2], cenv[3], cenv[4])
  return (_ats2pypre_stream_patsfun_52__cfun, env0, env1, env2, env3)

def _ats2pypre_stream_patsfun_53__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_53__cfun(cenv): return _ats2pypre_stream_patsfun_53(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_53__cfun, env0, env1)

def _ats2pypre_stream_patsfun_56__closurerize(env0):
  def _ats2pypre_stream_patsfun_56__cfun(cenv): return _ats2pypre_stream_patsfun_56(cenv[1])
  return (_ats2pypre_stream_patsfun_56__cfun, env0)

def _ats2pypre_stream_patsfun_58__closurerize(env0):
  def _ats2pypre_stream_patsfun_58__cfun(cenv): return _ats2pypre_stream_patsfun_58(cenv[1])
  return (_ats2pypre_stream_patsfun_58__cfun, env0)

def _ats2pypre_stream_patsfun_60__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_60__cfun(cenv): return _ats2pypre_stream_patsfun_60(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_60__cfun, env0, env1)

def _ats2pypre_stream_patsfun_65__closurerize(env0):
  def _ats2pypre_stream_patsfun_65__cfun(cenv, arg0, arg1): return _ats2pypre_stream_patsfun_65(cenv[1], arg0, arg1)
  return (_ats2pypre_stream_patsfun_65__cfun, env0)

def _ats2pypre_stream_patsfun_67__closurerize(env0):
  def _ats2pypre_stream_patsfun_67__cfun(cenv, arg0, arg1): return _ats2pypre_stream_patsfun_67(cenv[1], arg0, arg1)
  return (_ats2pypre_stream_patsfun_67__cfun, env0)

def _ats2pypre_stream_patsfun_70__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_70__cfun(cenv): return _ats2pypre_stream_patsfun_70(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_70__cfun, env0, env1)

def _ats2pypre_stream_patsfun_72__closurerize(env0, env1):
  def _ats2pypre_stream_patsfun_72__cfun(cenv): return _ats2pypre_stream_patsfun_72(cenv[1], cenv[2])
  return (_ats2pypre_stream_patsfun_72__cfun, env0, env1)

def ats2pypre_stream_make_list(arg0):
  tmpret7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_make_list
  tmpret7 = [0, _ats2pypre_stream_patsfun_6__closurerize(arg0)]
  return tmpret7


def _ats2pypre_stream_patsfun_6(env0):
  tmpret8 = None
  tmp9 = None
  tmp10 = None
  tmp11 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env0)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret8 = None
    return
  def __atstmplab2():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp9 = env0[0]
    tmp10 = env0[1]
    tmp11 = ats2pypre_stream_make_list(tmp10)
    tmpret8 = (tmp9, tmp11)
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab__ats2pypre_stream_patsfun_6
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret8


def ats2pypre_stream_make_list0(arg0):
  tmpret12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_make_list0
  tmpret12 = ats2pypre_stream_make_list(arg0)
  return tmpret12


def ats2pypre_stream_nth_opt(arg0, arg1):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_nth_opt
  tmpret13 = _ats2pypre_stream_loop_9(arg0, arg1)
  return tmpret13


def _ats2pypre_stream_loop_9(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  tmp18 = None
  tmp19 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab4():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret14, tmp15, tmp16, tmp17, tmp18, tmp19
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp15)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret14, tmp15, tmp16, tmp17, tmp18, tmp19
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret14 = None
    return
  def __atstmplab6():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret14, tmp15, tmp16, tmp17, tmp18, tmp19
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret14, tmp15, tmp16, tmp17, tmp18, tmp19
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp16 = tmp15[0]
    tmp17 = tmp15[1]
    tmp18 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp18):
      tmp19 = ats2pypre_pred_int1(arg1)
      #ATStailcalseq_beg
      apy0 = tmp17
      apy1 = tmp19
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_stream_loop_9
      #ATStailcalseq_end
    else:
      tmpret14 = (tmp16, )
    #endif
    return
  mbranch_1 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_loop_9
    tmp15 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret14


def ats2pypre_stream_length(arg0):
  tmpret20 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_length
  tmpret20 = _ats2pypre_stream_loop_11(arg0, 0)
  return tmpret20


def _ats2pypre_stream_loop_11(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret21 = None
  tmp22 = None
  tmp24 = None
  tmp25 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp24, tmp25
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp22)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp24, tmp25
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret21 = arg1
    return
  def __atstmplab10():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp24, tmp25
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret21, tmp22, tmp24, tmp25
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp24 = tmp22[1]
    tmp25 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp24
    apy1 = tmp25
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_loop_11
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_loop_11
    tmp22 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret21


def ats2pypre_stream2list(arg0):
  tmpret26 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2list
  tmpret26 = _ats2pypre_stream_aux_13(arg0)
  return tmpret26


def _ats2pypre_stream_aux_13(arg0):
  tmpret27 = None
  tmp28 = None
  tmp29 = None
  tmp30 = None
  tmp31 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal arg0
    nonlocal tmpret27, tmp28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp28)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0
    nonlocal tmpret27, tmp28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret27 = None
    return
  def __atstmplab14():
    nonlocal arg0
    nonlocal tmpret27, tmp28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0
    nonlocal tmpret27, tmp28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp29 = tmp28[0]
    tmp30 = tmp28[1]
    tmp31 = _ats2pypre_stream_aux_13(tmp30)
    tmpret27 = (tmp29, tmp31)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_stream_aux_13
  tmp28 = ATSPMVlazyval_eval(arg0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret27


def ats2pypre_stream2list_rev(arg0):
  tmpret32 = None
  tmp38 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2list_rev
  tmp38 = None
  tmpret32 = _ats2pypre_stream_loop_15(arg0, tmp38)
  return tmpret32


def _ats2pypre_stream_loop_15(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret33 = None
  tmp34 = None
  tmp35 = None
  tmp36 = None
  tmp37 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36, tmp37
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp34)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36, tmp37
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret33 = arg1
    return
  def __atstmplab18():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36, tmp37
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36, tmp37
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp35 = tmp34[0]
    tmp36 = tmp34[1]
    tmp37 = (tmp35, arg1)
    #ATStailcalseq_beg
    apy0 = tmp36
    apy1 = tmp37
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_loop_15
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_loop_15
    tmp34 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret33


def ats2pypre_stream_takeLte(arg0, arg1):
  tmpret39 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_takeLte
  tmpret39 = _ats2pypre_stream_patsfun_17__closurerize(arg0, arg1)
  return tmpret39


def _ats2pypre_stream_patsfun_17(env0, env1, arg0):
  tmpret40 = None
  tmp41 = None
  tmp42 = None
  tmp43 = None
  tmp44 = None
  tmp45 = None
  tmp46 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab20():
    nonlocal env0, env1, arg0
    nonlocal tmpret40, tmp41, tmp42, tmp43, tmp44, tmp45, tmp46
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp42)): tmplab_py = 4 ; return#__atstmplab23
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal env0, env1, arg0
    nonlocal tmpret40, tmp41, tmp42, tmp43, tmp44, tmp45, tmp46
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret40 = None
    return
  def __atstmplab22():
    nonlocal env0, env1, arg0
    nonlocal tmpret40, tmp41, tmp42, tmp43, tmp44, tmp45, tmp46
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, env1, arg0
    nonlocal tmpret40, tmp41, tmp42, tmp43, tmp44, tmp45, tmp46
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp43 = tmp42[0]
    tmp44 = tmp42[1]
    tmp46 = ats2pypre_sub_int1_int1(env1, 1)
    tmp45 = ats2pypre_stream_takeLte(tmp44, tmp46)
    tmpret40 = (tmp43, tmp45)
    return
  mbranch_1 = { 1: __atstmplab20, 2: __atstmplab21, 3: __atstmplab22, 4: __atstmplab23 }
  #__patsflab__ats2pypre_stream_patsfun_17
  if (arg0):
    tmp41 = ats2pypre_gt_int1_int1(env1, 0)
    if (tmp41):
      tmp42 = ATSPMVlazyval_eval(env0); 
      #ATScaseofseq_beg
      tmplab_py = 1
      while(1):
        mbranch_1.get(tmplab_py)()
        if (tmplab_py == 0): break
      #ATScaseofseq_end
    else:
      tmpret40 = None
    #endif
  #endif
  return tmpret40


def ats2pypre_stream_take_opt(arg0, arg1):
  tmpret47 = None
  tmp56 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_take_opt
  tmp56 = None
  tmpret47 = _ats2pypre_stream_auxmain_19(arg1, arg0, 0, tmp56)
  return tmpret47


def _ats2pypre_stream_auxmain_19(env0, arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret48 = None
  tmp49 = None
  tmp50 = None
  tmp51 = None
  tmp52 = None
  tmp53 = None
  tmp54 = None
  tmp55 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab24():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret48, tmp49, tmp50, tmp51, tmp52, tmp53, tmp54, tmp55
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp50)): tmplab_py = 4 ; return#__atstmplab27
    __atstmplab25()
    return
  def __atstmplab25():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret48, tmp49, tmp50, tmp51, tmp52, tmp53, tmp54, tmp55
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret48 = None
    return
  def __atstmplab26():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret48, tmp49, tmp50, tmp51, tmp52, tmp53, tmp54, tmp55
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab27()
    return
  def __atstmplab27():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret48, tmp49, tmp50, tmp51, tmp52, tmp53, tmp54, tmp55
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp51 = tmp50[0]
    tmp52 = tmp50[1]
    tmp53 = ats2pypre_add_int1_int1(arg1, 1)
    tmp54 = (tmp51, arg2)
    #ATStailcalseq_beg
    apy0 = tmp52
    apy1 = tmp53
    apy2 = tmp54
    arg0 = apy0
    arg1 = apy1
    arg2 = apy2
    funlab_py = 1 #__patsflab__ats2pypre_stream_auxmain_19
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab24, 2: __atstmplab25, 3: __atstmplab26, 4: __atstmplab27 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_auxmain_19
    tmp49 = ats2pypre_lt_int1_int1(arg1, env0)
    if (tmp49):
      tmp50 = ATSPMVlazyval_eval(arg0); 
      #ATScaseofseq_beg
      tmplab_py = 1
      while(1):
        mbranch_1.get(tmplab_py)()
        if (tmplab_py == 0): break
      #ATScaseofseq_end
    else:
      tmp55 = ats2pypre_list_reverse(arg2)
      tmpret48 = (tmp55, )
    #endif
    if (funlab_py == 0): break
  return tmpret48


def ats2pypre_stream_drop_opt(arg0, arg1):
  tmpret57 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_drop_opt
  tmpret57 = _ats2pypre_stream_auxmain_21(arg1, arg0, 0)
  return tmpret57


def _ats2pypre_stream_auxmain_21(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret58 = None
  tmp59 = None
  tmp60 = None
  tmp62 = None
  tmp63 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab28():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret58, tmp59, tmp60, tmp62, tmp63
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp60)): tmplab_py = 4 ; return#__atstmplab31
    __atstmplab29()
    return
  def __atstmplab29():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret58, tmp59, tmp60, tmp62, tmp63
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret58 = None
    return
  def __atstmplab30():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret58, tmp59, tmp60, tmp62, tmp63
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab31()
    return
  def __atstmplab31():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret58, tmp59, tmp60, tmp62, tmp63
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp62 = tmp60[1]
    tmp63 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp62
    apy1 = tmp63
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_auxmain_21
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab28, 2: __atstmplab29, 3: __atstmplab30, 4: __atstmplab31 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_auxmain_21
    tmp59 = ats2pypre_lt_int1_int1(arg1, env0)
    if (tmp59):
      tmp60 = ATSPMVlazyval_eval(arg0); 
      #ATScaseofseq_beg
      tmplab_py = 1
      while(1):
        mbranch_1.get(tmplab_py)()
        if (tmplab_py == 0): break
      #ATScaseofseq_end
    else:
      tmpret58 = (arg0, )
    #endif
    if (funlab_py == 0): break
  return tmpret58


def ats2pypre_stream_append(arg0, arg1):
  tmpret64 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_append
  tmpret64 = [0, _ats2pypre_stream_patsfun_23__closurerize(arg0, arg1)]
  return tmpret64


def _ats2pypre_stream_patsfun_23(env0, env1):
  tmpret65 = None
  tmp66 = None
  tmp67 = None
  tmp68 = None
  tmp69 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab32():
    nonlocal env0, env1
    nonlocal tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp66)): tmplab_py = 4 ; return#__atstmplab35
    __atstmplab33()
    return
  def __atstmplab33():
    nonlocal env0, env1
    nonlocal tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret65 = ATSPMVlazyval_eval(env1); 
    return
  def __atstmplab34():
    nonlocal env0, env1
    nonlocal tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab35()
    return
  def __atstmplab35():
    nonlocal env0, env1
    nonlocal tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp67 = tmp66[0]
    tmp68 = tmp66[1]
    tmp69 = ats2pypre_stream_append(tmp68, env1)
    tmpret65 = (tmp67, tmp69)
    return
  mbranch_1 = { 1: __atstmplab32, 2: __atstmplab33, 3: __atstmplab34, 4: __atstmplab35 }
  #__patsflab__ats2pypre_stream_patsfun_23
  tmp66 = ATSPMVlazyval_eval(env0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret65


def ats2pypre_stream_concat(arg0):
  tmpret70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_concat
  tmpret70 = [0, _ats2pypre_stream_patsfun_25__closurerize(arg0)]
  return tmpret70


def _ats2pypre_stream_patsfun_25(env0):
  tmpret71 = None
  tmp72 = None
  tmp73 = None
  tmp74 = None
  tmp75 = None
  tmp76 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab36():
    nonlocal env0
    nonlocal tmpret71, tmp72, tmp73, tmp74, tmp75, tmp76
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp72)): tmplab_py = 4 ; return#__atstmplab39
    __atstmplab37()
    return
  def __atstmplab37():
    nonlocal env0
    nonlocal tmpret71, tmp72, tmp73, tmp74, tmp75, tmp76
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret71 = None
    return
  def __atstmplab38():
    nonlocal env0
    nonlocal tmpret71, tmp72, tmp73, tmp74, tmp75, tmp76
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab39()
    return
  def __atstmplab39():
    nonlocal env0
    nonlocal tmpret71, tmp72, tmp73, tmp74, tmp75, tmp76
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp73 = tmp72[0]
    tmp74 = tmp72[1]
    tmp76 = ats2pypre_stream_concat(tmp74)
    tmp75 = ats2pypre_stream_append(tmp73, tmp76)
    tmpret71 = ATSPMVlazyval_eval(tmp75); 
    return
  mbranch_1 = { 1: __atstmplab36, 2: __atstmplab37, 3: __atstmplab38, 4: __atstmplab39 }
  #__patsflab__ats2pypre_stream_patsfun_25
  tmp72 = ATSPMVlazyval_eval(env0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret71


def ats2pypre_stream_map_cloref(arg0, arg1):
  tmpret77 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_map_cloref
  tmpret77 = [0, _ats2pypre_stream_patsfun_27__closurerize(arg0, arg1)]
  return tmpret77


def _ats2pypre_stream_patsfun_27(env0, env1):
  tmpret78 = None
  tmp79 = None
  tmp80 = None
  tmp81 = None
  tmp82 = None
  tmp83 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab40():
    nonlocal env0, env1
    nonlocal tmpret78, tmp79, tmp80, tmp81, tmp82, tmp83
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp79)): tmplab_py = 4 ; return#__atstmplab43
    __atstmplab41()
    return
  def __atstmplab41():
    nonlocal env0, env1
    nonlocal tmpret78, tmp79, tmp80, tmp81, tmp82, tmp83
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret78 = None
    return
  def __atstmplab42():
    nonlocal env0, env1
    nonlocal tmpret78, tmp79, tmp80, tmp81, tmp82, tmp83
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab43()
    return
  def __atstmplab43():
    nonlocal env0, env1
    nonlocal tmpret78, tmp79, tmp80, tmp81, tmp82, tmp83
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp80 = tmp79[0]
    tmp81 = tmp79[1]
    tmp82 = env1[0](env1, tmp80)
    tmp83 = ats2pypre_stream_map_cloref(tmp81, env1)
    tmpret78 = (tmp82, tmp83)
    return
  mbranch_1 = { 1: __atstmplab40, 2: __atstmplab41, 3: __atstmplab42, 4: __atstmplab43 }
  #__patsflab__ats2pypre_stream_patsfun_27
  tmp79 = ATSPMVlazyval_eval(env0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret78


def ats2pypre_stream_map_method(arg0, arg1):
  tmpret84 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_map_method
  tmpret84 = _ats2pypre_stream_patsfun_29__closurerize(arg0)
  return tmpret84


def _ats2pypre_stream_patsfun_29(env0, arg0):
  tmpret85 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_29
  tmpret85 = ats2pypre_stream_map_cloref(env0, arg0)
  return tmpret85


def ats2pypre_stream_filter_cloref(arg0, arg1):
  tmpret86 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_filter_cloref
  tmpret86 = [0, _ats2pypre_stream_patsfun_31__closurerize(arg0, arg1)]
  return tmpret86


def _ats2pypre_stream_patsfun_31(env0, env1):
  tmpret87 = None
  tmp88 = None
  tmp89 = None
  tmp90 = None
  tmp91 = None
  tmp92 = None
  tmp93 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab44():
    nonlocal env0, env1
    nonlocal tmpret87, tmp88, tmp89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp88)): tmplab_py = 4 ; return#__atstmplab47
    __atstmplab45()
    return
  def __atstmplab45():
    nonlocal env0, env1
    nonlocal tmpret87, tmp88, tmp89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret87 = None
    return
  def __atstmplab46():
    nonlocal env0, env1
    nonlocal tmpret87, tmp88, tmp89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab47()
    return
  def __atstmplab47():
    nonlocal env0, env1
    nonlocal tmpret87, tmp88, tmp89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp89 = tmp88[0]
    tmp90 = tmp88[1]
    tmp91 = env1[0](env1, tmp89)
    if (tmp91):
      tmp92 = ats2pypre_stream_filter_cloref(tmp90, env1)
      tmpret87 = (tmp89, tmp92)
    else:
      tmp93 = ats2pypre_stream_filter_cloref(tmp90, env1)
      tmpret87 = ATSPMVlazyval_eval(tmp93); 
    #endif
    return
  mbranch_1 = { 1: __atstmplab44, 2: __atstmplab45, 3: __atstmplab46, 4: __atstmplab47 }
  #__patsflab__ats2pypre_stream_patsfun_31
  tmp88 = ATSPMVlazyval_eval(env0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret87


def ats2pypre_stream_filter_method(arg0):
  tmpret94 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_filter_method
  tmpret94 = _ats2pypre_stream_patsfun_33__closurerize(arg0)
  return tmpret94


def _ats2pypre_stream_patsfun_33(env0, arg0):
  tmpret95 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_33
  tmpret95 = ats2pypre_stream_filter_cloref(env0, arg0)
  return tmpret95


def ats2pypre_stream_forall_cloref(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret96 = None
  tmp97 = None
  tmp98 = None
  tmp99 = None
  tmp100 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab48():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret96, tmp97, tmp98, tmp99, tmp100
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp97)): tmplab_py = 4 ; return#__atstmplab51
    __atstmplab49()
    return
  def __atstmplab49():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret96, tmp97, tmp98, tmp99, tmp100
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret96 = True
    return
  def __atstmplab50():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret96, tmp97, tmp98, tmp99, tmp100
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab51()
    return
  def __atstmplab51():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret96, tmp97, tmp98, tmp99, tmp100
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp98 = tmp97[0]
    tmp99 = tmp97[1]
    tmp100 = arg1[0](arg1, tmp98)
    if (tmp100):
      #ATStailcalseq_beg
      apy0 = tmp99
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_stream_forall_cloref
      #ATStailcalseq_end
    else:
      tmpret96 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab48, 2: __atstmplab49, 3: __atstmplab50, 4: __atstmplab51 }
  while(1):
    funlab_py = 0
    #__patsflab_stream_forall_cloref
    tmp97 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret96


def ats2pypre_stream_forall_method(arg0):
  tmpret101 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_forall_method
  tmpret101 = _ats2pypre_stream_patsfun_36__closurerize(arg0)
  return tmpret101


def _ats2pypre_stream_patsfun_36(env0, arg0):
  tmpret102 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_36
  tmpret102 = ats2pypre_stream_forall_cloref(env0, arg0)
  return tmpret102


def ats2pypre_stream_exists_cloref(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret103 = None
  tmp104 = None
  tmp105 = None
  tmp106 = None
  tmp107 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab52():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret103, tmp104, tmp105, tmp106, tmp107
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp104)): tmplab_py = 4 ; return#__atstmplab55
    __atstmplab53()
    return
  def __atstmplab53():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret103, tmp104, tmp105, tmp106, tmp107
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret103 = False
    return
  def __atstmplab54():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret103, tmp104, tmp105, tmp106, tmp107
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab55()
    return
  def __atstmplab55():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret103, tmp104, tmp105, tmp106, tmp107
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp105 = tmp104[0]
    tmp106 = tmp104[1]
    tmp107 = arg1[0](arg1, tmp105)
    if (tmp107):
      tmpret103 = True
    else:
      #ATStailcalseq_beg
      apy0 = tmp106
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_stream_exists_cloref
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab52, 2: __atstmplab53, 3: __atstmplab54, 4: __atstmplab55 }
  while(1):
    funlab_py = 0
    #__patsflab_stream_exists_cloref
    tmp104 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret103


def ats2pypre_stream_exists_method(arg0):
  tmpret108 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_exists_method
  tmpret108 = _ats2pypre_stream_patsfun_39__closurerize(arg0)
  return tmpret108


def _ats2pypre_stream_patsfun_39(env0, arg0):
  tmpret109 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_39
  tmpret109 = ats2pypre_stream_exists_cloref(env0, arg0)
  return tmpret109


def ats2pypre_stream_foreach_cloref(arg0, arg1):
  apy0 = None
  apy1 = None
  tmp111 = None
  tmp112 = None
  tmp113 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab56():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp111)): tmplab_py = 4 ; return#__atstmplab59
    __atstmplab57()
    return
  def __atstmplab57():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab58():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab59()
    return
  def __atstmplab59():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp112 = tmp111[0]
    tmp113 = tmp111[1]
    arg1[0](arg1, tmp112)
    #ATStailcalseq_beg
    apy0 = tmp113
    apy1 = arg1
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab_stream_foreach_cloref
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab56, 2: __atstmplab57, 3: __atstmplab58, 4: __atstmplab59 }
  while(1):
    funlab_py = 0
    #__patsflab_stream_foreach_cloref
    tmp111 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_stream_foreach_method(arg0):
  tmpret115 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_foreach_method
  tmpret115 = _ats2pypre_stream_patsfun_42__closurerize(arg0)
  return tmpret115


def _ats2pypre_stream_patsfun_42(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_42
  ats2pypre_stream_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_stream_iforeach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_iforeach_cloref
  _ats2pypre_stream_loop_44(arg1, 0, arg0)
  return#_void


def _ats2pypre_stream_loop_44(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmp119 = None
  tmp120 = None
  tmp121 = None
  tmp123 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab60():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp119, tmp120, tmp121, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp119)): tmplab_py = 4 ; return#__atstmplab63
    __atstmplab61()
    return
  def __atstmplab61():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp119, tmp120, tmp121, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab62():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp119, tmp120, tmp121, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab63()
    return
  def __atstmplab63():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp119, tmp120, tmp121, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp120 = tmp119[0]
    tmp121 = tmp119[1]
    env0[0](env0, arg0, tmp120)
    tmp123 = ats2pypre_add_int1_int1(arg0, 1)
    #ATStailcalseq_beg
    apy0 = tmp123
    apy1 = tmp121
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_loop_44
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab60, 2: __atstmplab61, 3: __atstmplab62, 4: __atstmplab63 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_loop_44
    tmp119 = ATSPMVlazyval_eval(arg1); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_stream_iforeach_method(arg0):
  tmpret124 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_iforeach_method
  tmpret124 = _ats2pypre_stream_patsfun_46__closurerize(arg0)
  return tmpret124


def _ats2pypre_stream_patsfun_46(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_46
  ats2pypre_stream_iforeach_cloref(env0, arg0)
  return#_void


def ats2pypre_stream_tabulate_cloref(arg0):
  tmpret126 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_tabulate_cloref
  tmpret126 = _ats2pypre_stream_auxmain_48(arg0, 0)
  return tmpret126


def _ats2pypre_stream_auxmain_48(env0, arg0):
  tmpret127 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_auxmain_48
  tmpret127 = [0, _ats2pypre_stream_patsfun_49__closurerize(env0, arg0)]
  return tmpret127


def _ats2pypre_stream_patsfun_49(env0, env1):
  tmpret128 = None
  tmp129 = None
  tmp130 = None
  tmp131 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_49
  tmp129 = env0[0](env0, env1)
  tmp131 = ats2pypre_add_int1_int1(env1, 1)
  tmp130 = _ats2pypre_stream_auxmain_48(env0, tmp131)
  tmpret128 = (tmp129, tmp130)
  return tmpret128


def ats2pypre_cross_stream_list(arg0, arg1):
  tmpret132 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_cross_stream_list
  tmpret132 = [0, _ats2pypre_stream_patsfun_53__closurerize(arg0, arg1)]
  return tmpret132


def _ats2pypre_stream_auxmain_51(arg0, arg1, arg2, arg3):
  tmpret133 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_auxmain_51
  tmpret133 = [0, _ats2pypre_stream_patsfun_52__closurerize(arg0, arg1, arg2, arg3)]
  return tmpret133


def _ats2pypre_stream_patsfun_52(env0, env1, env2, env3):
  tmpret134 = None
  tmp135 = None
  tmp136 = None
  tmp137 = None
  tmp138 = None
  tmp139 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab64():
    nonlocal env0, env1, env2, env3
    nonlocal tmpret134, tmp135, tmp136, tmp137, tmp138, tmp139
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env3)): tmplab_py = 4 ; return#__atstmplab67
    __atstmplab65()
    return
  def __atstmplab65():
    nonlocal env0, env1, env2, env3
    nonlocal tmpret134, tmp135, tmp136, tmp137, tmp138, tmp139
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp137 = ats2pypre_cross_stream_list(env1, env2)
    tmpret134 = ATSPMVlazyval_eval(tmp137); 
    return
  def __atstmplab66():
    nonlocal env0, env1, env2, env3
    nonlocal tmpret134, tmp135, tmp136, tmp137, tmp138, tmp139
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab67()
    return
  def __atstmplab67():
    nonlocal env0, env1, env2, env3
    nonlocal tmpret134, tmp135, tmp136, tmp137, tmp138, tmp139
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp135 = env3[0]
    tmp136 = env3[1]
    tmp138 = (env0, tmp135)
    tmp139 = _ats2pypre_stream_auxmain_51(env0, env1, env2, tmp136)
    tmpret134 = (tmp138, tmp139)
    return
  mbranch_1 = { 1: __atstmplab64, 2: __atstmplab65, 3: __atstmplab66, 4: __atstmplab67 }
  #__patsflab__ats2pypre_stream_patsfun_52
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret134


def _ats2pypre_stream_patsfun_53(env0, env1):
  tmpret140 = None
  tmp141 = None
  tmp142 = None
  tmp143 = None
  tmp144 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab68():
    nonlocal env0, env1
    nonlocal tmpret140, tmp141, tmp142, tmp143, tmp144
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp141)): tmplab_py = 4 ; return#__atstmplab71
    __atstmplab69()
    return
  def __atstmplab69():
    nonlocal env0, env1
    nonlocal tmpret140, tmp141, tmp142, tmp143, tmp144
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret140 = None
    return
  def __atstmplab70():
    nonlocal env0, env1
    nonlocal tmpret140, tmp141, tmp142, tmp143, tmp144
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptrisnull(tmp141)): ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats-contrib/contrib/libatscc/DATS/stream.dats: 6907(line=451, offs=1) -- 6999(line=453, offs=50)");
    __atstmplab71()
    return
  def __atstmplab71():
    nonlocal env0, env1
    nonlocal tmpret140, tmp141, tmp142, tmp143, tmp144
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp142 = tmp141[0]
    tmp143 = tmp141[1]
    tmp144 = _ats2pypre_stream_auxmain_51(tmp142, tmp143, env1, env1)
    tmpret140 = ATSPMVlazyval_eval(tmp144); 
    return
  mbranch_1 = { 1: __atstmplab68, 2: __atstmplab69, 3: __atstmplab70, 4: __atstmplab71 }
  #__patsflab__ats2pypre_stream_patsfun_53
  tmp141 = ATSPMVlazyval_eval(env0); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret140


def ats2pypre_cross_stream_list0(arg0, arg1):
  tmpret145 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_cross_stream_list0
  tmpret145 = ats2pypre_cross_stream_list(arg0, arg1)
  return tmpret145


def ats2pypre_stream2cloref_exn(arg0):
  tmpret146 = None
  tmp147 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2cloref_exn
  tmp147 = ats2pypre_ref(arg0)
  tmpret146 = _ats2pypre_stream_patsfun_56__closurerize(tmp147)
  return tmpret146


def _ats2pypre_stream_patsfun_56(env0):
  tmpret148 = None
  tmp149 = None
  tmp150 = None
  tmp151 = None
  tmp152 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_56
  tmp149 = ats2pypre_ref_get_elt(env0)
  tmp150 = ATSPMVlazyval_eval(tmp149); 
  if(ATSCKptrisnull(tmp150)): ATSINScaseof_fail("/home/hwxi/Research/ATS-Postiats-contrib/contrib/libatscc/DATS/stream.dats: 7300(line=479, offs=5) -- 7324(line=479, offs=29)");
  tmp151 = tmp150[0]
  tmp152 = tmp150[1]
  ats2pypre_ref_set_elt(env0, tmp152)
  tmpret148 = tmp151
  return tmpret148


def ats2pypre_stream2cloref_opt(arg0):
  tmpret154 = None
  tmp155 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2cloref_opt
  tmp155 = ats2pypre_ref(arg0)
  tmpret154 = _ats2pypre_stream_patsfun_58__closurerize(tmp155)
  return tmpret154


def _ats2pypre_stream_patsfun_58(env0):
  tmpret156 = None
  tmp157 = None
  tmp158 = None
  tmp159 = None
  tmp160 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab72():
    nonlocal env0
    nonlocal tmpret156, tmp157, tmp158, tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp158)): tmplab_py = 4 ; return#__atstmplab75
    __atstmplab73()
    return
  def __atstmplab73():
    nonlocal env0
    nonlocal tmpret156, tmp157, tmp158, tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret156 = None
    return
  def __atstmplab74():
    nonlocal env0
    nonlocal tmpret156, tmp157, tmp158, tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab75()
    return
  def __atstmplab75():
    nonlocal env0
    nonlocal tmpret156, tmp157, tmp158, tmp159, tmp160
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp159 = tmp158[0]
    tmp160 = tmp158[1]
    ats2pypre_ref_set_elt(env0, tmp160)
    tmpret156 = (tmp159, )
    return
  mbranch_1 = { 1: __atstmplab72, 2: __atstmplab73, 3: __atstmplab74, 4: __atstmplab75 }
  #__patsflab__ats2pypre_stream_patsfun_58
  tmp157 = ats2pypre_ref_get_elt(env0)
  tmp158 = ATSPMVlazyval_eval(tmp157); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret156


def ats2pypre_stream2cloref_last(arg0, arg1):
  tmpret162 = None
  tmp163 = None
  tmp164 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2cloref_last
  tmp163 = ats2pypre_ref(arg0)
  tmp164 = ats2pypre_ref(arg1)
  tmpret162 = _ats2pypre_stream_patsfun_60__closurerize(tmp163, tmp164)
  return tmpret162


def _ats2pypre_stream_patsfun_60(env0, env1):
  tmpret165 = None
  tmp166 = None
  tmp167 = None
  tmp168 = None
  tmp169 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab76():
    nonlocal env0, env1
    nonlocal tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp167)): tmplab_py = 4 ; return#__atstmplab79
    __atstmplab77()
    return
  def __atstmplab77():
    nonlocal env0, env1
    nonlocal tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret165 = ats2pypre_ref_get_elt(env1)
    return
  def __atstmplab78():
    nonlocal env0, env1
    nonlocal tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab79()
    return
  def __atstmplab79():
    nonlocal env0, env1
    nonlocal tmpret165, tmp166, tmp167, tmp168, tmp169
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp168 = tmp167[0]
    tmp169 = tmp167[1]
    ats2pypre_ref_set_elt(env0, tmp169)
    ats2pypre_ref_set_elt(env1, tmp168)
    tmpret165 = tmp168
    return
  mbranch_1 = { 1: __atstmplab76, 2: __atstmplab77, 3: __atstmplab78, 4: __atstmplab79 }
  #__patsflab__ats2pypre_stream_patsfun_60
  tmp166 = ats2pypre_ref_get_elt(env0)
  tmp167 = ATSPMVlazyval_eval(tmp166); 
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret165


def ats2pypre_stream_take_while_cloref(arg0, arg1):
  tmpret172 = None
  tmp173 = None
  tmp174 = None
  tmp175 = None
  tmp176 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_take_while_cloref
  tmp173 = ats2pypre_stream_rtake_while_cloref(arg0, arg1)
  tmp174 = tmp173[0]
  tmp175 = tmp173[1]
  tmp176 = ats2pypre_list_reverse(tmp175)
  tmpret172 = (tmp174, tmp176)
  return tmpret172


def ats2pypre_stream_rtake_while_cloref(arg0, arg1):
  tmpret177 = None
  tmp185 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_rtake_while_cloref
  tmp185 = None
  tmpret177 = _ats2pypre_stream_loop_63(arg1, arg0, 0, tmp185)
  return tmpret177


def _ats2pypre_stream_loop_63(env0, arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret178 = None
  tmp179 = None
  tmp180 = None
  tmp181 = None
  tmp182 = None
  tmp183 = None
  tmp184 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab80():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret178, tmp179, tmp180, tmp181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp179)): tmplab_py = 4 ; return#__atstmplab83
    __atstmplab81()
    return
  def __atstmplab81():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret178, tmp179, tmp180, tmp181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret178 = (arg0, arg2)
    return
  def __atstmplab82():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret178, tmp179, tmp180, tmp181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab83()
    return
  def __atstmplab83():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret178, tmp179, tmp180, tmp181, tmp182, tmp183, tmp184
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp180 = tmp179[0]
    tmp181 = tmp179[1]
    tmp182 = env0[0](env0, arg1, tmp180)
    if (tmp182):
      tmp183 = ats2pypre_add_int1_int1(arg1, 1)
      tmp184 = (tmp180, arg2)
      #ATStailcalseq_beg
      apy0 = tmp181
      apy1 = tmp183
      apy2 = tmp184
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      funlab_py = 1 #__patsflab__ats2pypre_stream_loop_63
      #ATStailcalseq_end
    else:
      tmpret178 = (arg0, arg2)
    #endif
    return
  mbranch_1 = { 1: __atstmplab80, 2: __atstmplab81, 3: __atstmplab82, 4: __atstmplab83 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_loop_63
    tmp179 = ATSPMVlazyval_eval(arg0); 
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret178


def ats2pypre_stream_take_until_cloref(arg0, arg1):
  tmpret186 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_take_until_cloref
  tmpret186 = ats2pypre_stream_take_while_cloref(arg0, _ats2pypre_stream_patsfun_65__closurerize(arg1))
  return tmpret186


def _ats2pypre_stream_patsfun_65(env0, arg0, arg1):
  tmpret187 = None
  tmp188 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_65
  tmp188 = env0[0](env0, arg0, arg1)
  tmpret187 = atspre_neg_bool0(tmp188)
  return tmpret187


def ats2pypre_stream_rtake_until_cloref(arg0, arg1):
  tmpret189 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_rtake_until_cloref
  tmpret189 = ats2pypre_stream_rtake_while_cloref(arg0, _ats2pypre_stream_patsfun_67__closurerize(arg1))
  return tmpret189


def _ats2pypre_stream_patsfun_67(env0, arg0, arg1):
  tmpret190 = None
  tmp191 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_patsfun_67
  tmp191 = env0[0](env0, arg0, arg1)
  tmpret190 = atspre_neg_bool0(tmp191)
  return tmpret190


def ats2pypre_stream_list_xprod2(arg0, arg1):
  tmpret192 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_list_xprod2
  tmpret192 = _ats2pypre_stream_auxlst_71(arg0, arg1)
  return tmpret192


def _ats2pypre_stream_aux_69(arg0, arg1):
  tmpret193 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_aux_69
  tmpret193 = [0, _ats2pypre_stream_patsfun_70__closurerize(arg0, arg1)]
  return tmpret193


def _ats2pypre_stream_patsfun_70(env0, env1):
  tmpret194 = None
  tmp195 = None
  tmp196 = None
  tmp197 = None
  tmp198 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab84():
    nonlocal env0, env1
    nonlocal tmpret194, tmp195, tmp196, tmp197, tmp198
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env1)): tmplab_py = 4 ; return#__atstmplab87
    __atstmplab85()
    return
  def __atstmplab85():
    nonlocal env0, env1
    nonlocal tmpret194, tmp195, tmp196, tmp197, tmp198
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret194 = None
    return
  def __atstmplab86():
    nonlocal env0, env1
    nonlocal tmpret194, tmp195, tmp196, tmp197, tmp198
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab87()
    return
  def __atstmplab87():
    nonlocal env0, env1
    nonlocal tmpret194, tmp195, tmp196, tmp197, tmp198
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp195 = env1[0]
    tmp196 = env1[1]
    tmp197 = (env0, tmp195)
    tmp198 = _ats2pypre_stream_aux_69(env0, tmp196)
    tmpret194 = (tmp197, tmp198)
    return
  mbranch_1 = { 1: __atstmplab84, 2: __atstmplab85, 3: __atstmplab86, 4: __atstmplab87 }
  #__patsflab__ats2pypre_stream_patsfun_70
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret194


def _ats2pypre_stream_auxlst_71(arg0, arg1):
  tmpret199 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_auxlst_71
  tmpret199 = [0, _ats2pypre_stream_patsfun_72__closurerize(arg0, arg1)]
  return tmpret199


def _ats2pypre_stream_patsfun_72(env0, env1):
  tmpret200 = None
  tmp201 = None
  tmp202 = None
  tmp203 = None
  tmp204 = None
  tmp205 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab88():
    nonlocal env0, env1
    nonlocal tmpret200, tmp201, tmp202, tmp203, tmp204, tmp205
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(env0)): tmplab_py = 4 ; return#__atstmplab91
    __atstmplab89()
    return
  def __atstmplab89():
    nonlocal env0, env1
    nonlocal tmpret200, tmp201, tmp202, tmp203, tmp204, tmp205
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret200 = None
    return
  def __atstmplab90():
    nonlocal env0, env1
    nonlocal tmpret200, tmp201, tmp202, tmp203, tmp204, tmp205
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab91()
    return
  def __atstmplab91():
    nonlocal env0, env1
    nonlocal tmpret200, tmp201, tmp202, tmp203, tmp204, tmp205
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp201 = env0[0]
    tmp202 = env0[1]
    tmp204 = _ats2pypre_stream_aux_69(tmp201, env1)
    tmp205 = _ats2pypre_stream_auxlst_71(tmp202, env1)
    tmp203 = ats2pypre_stream_append(tmp204, tmp205)
    tmpret200 = ATSPMVlazyval_eval(tmp203); 
    return
  mbranch_1 = { 1: __atstmplab88, 2: __atstmplab89, 3: __atstmplab90, 4: __atstmplab91 }
  #__patsflab__ats2pypre_stream_patsfun_72
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret200

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_stream_vt_patsfun_7__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_7__cfun(cenv): return _ats2pypre_stream_vt_patsfun_7(cenv[1])
  return (_ats2pypre_stream_vt_patsfun_7__cfun, env0)

def _ats2pypre_stream_vt_patsfun_10__closurerize(env0, env1):
  def _ats2pypre_stream_vt_patsfun_10__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_10(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_vt_patsfun_10__cfun, env0, env1)

def _ats2pypre_stream_vt_patsfun_19__closurerize(env0, env1):
  def _ats2pypre_stream_vt_patsfun_19__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_19(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_vt_patsfun_19__cfun, env0, env1)

def _ats2pypre_stream_vt_patsfun_22__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_22__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_22(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_22__cfun, env0)

def _ats2pypre_stream_vt_patsfun_25__closurerize(env0, env1):
  def _ats2pypre_stream_vt_patsfun_25__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_25(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_vt_patsfun_25__cfun, env0, env1)

def _ats2pypre_stream_vt_patsfun_27__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_27__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_27(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_27__cfun, env0)

def _ats2pypre_stream_vt_patsfun_30__closurerize(env0, env1):
  def _ats2pypre_stream_vt_patsfun_30__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_30(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_vt_patsfun_30__cfun, env0, env1)

def _ats2pypre_stream_vt_patsfun_32__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_32__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_32(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_32__cfun, env0)

def _ats2pypre_stream_vt_patsfun_36__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_36__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_36(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_36__cfun, env0)

def _ats2pypre_stream_vt_patsfun_40__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_40__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_40(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_40__cfun, env0)

def _ats2pypre_stream_vt_patsfun_44__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_44__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_44(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_44__cfun, env0)

def _ats2pypre_stream_vt_patsfun_48__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_48__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_48(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_48__cfun, env0)

def _ats2pypre_stream_vt_patsfun_52__closurerize(env0):
  def _ats2pypre_stream_vt_patsfun_52__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_52(cenv[1], arg0)
  return (_ats2pypre_stream_vt_patsfun_52__cfun, env0)

def _ats2pypre_stream_vt_patsfun_55__closurerize(env0, env1):
  def _ats2pypre_stream_vt_patsfun_55__cfun(cenv, arg0): return _ats2pypre_stream_vt_patsfun_55(cenv[1], cenv[2], arg0)
  return (_ats2pypre_stream_vt_patsfun_55__cfun, env0, env1)

def ats2pypre_stream_vt_free(arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_free
  atspre_lazy_vt_free(arg0)
  return#_void


def ats2pypre_stream_vt2t(arg0):
  tmpret6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt2t
  tmpret6 = _ats2pypre_stream_vt_aux_6(arg0)
  return tmpret6


def _ats2pypre_stream_vt_aux_6(arg0):
  tmpret7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_aux_6
  tmpret7 = [0, _ats2pypre_stream_vt_patsfun_7__closurerize(arg0)]
  return tmpret7


def _ats2pypre_stream_vt_patsfun_7(env0):
  tmpret8 = None
  tmp9 = None
  tmp10 = None
  tmp11 = None
  tmp12 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11, tmp12
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp9)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11, tmp12
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret8 = None
    return
  def __atstmplab2():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11, tmp12
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal env0
    nonlocal tmpret8, tmp9, tmp10, tmp11, tmp12
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp10 = tmp9[0]
    tmp11 = tmp9[1]
    #ATSINSfreecon(tmp9);
    tmp12 = _ats2pypre_stream_vt_aux_6(tmp11)
    tmpret8 = (tmp10, tmp12)
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab__ats2pypre_stream_vt_patsfun_7
  tmp9 = ATSPMVllazyval_eval(env0)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret8


def ats2pypre_stream_vt_takeLte(arg0, arg1):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_takeLte
  tmpret13 = _ats2pypre_stream_vt_auxmain_9(arg0, arg1)
  return tmpret13


def _ats2pypre_stream_vt_auxmain_9(arg0, arg1):
  tmpret14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_9
  tmpret14 = _ats2pypre_stream_vt_patsfun_10__closurerize(arg0, arg1)
  return tmpret14


def _ats2pypre_stream_vt_patsfun_10(env0, env1, arg0):
  tmpret15 = None
  tmp16 = None
  tmp17 = None
  tmp18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab4():
    nonlocal env0, env1, arg0
    nonlocal tmpret15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp17)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal env0, env1, arg0
    nonlocal tmpret15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret15 = None
    return
  def __atstmplab6():
    nonlocal env0, env1, arg0
    nonlocal tmpret15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal env0, env1, arg0
    nonlocal tmpret15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp18 = tmp17[0]
    tmp19 = tmp17[1]
    #ATSINSfreecon(tmp17);
    tmp21 = ats2pypre_sub_int1_int1(env1, 1)
    tmp20 = _ats2pypre_stream_vt_auxmain_9(tmp19, tmp21)
    tmpret15 = (tmp18, tmp20)
    return
  mbranch_1 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab__ats2pypre_stream_vt_patsfun_10
  if (arg0):
    tmp16 = ats2pypre_gt_int1_int1(env1, 0)
    if (tmp16):
      tmp17 = ATSPMVllazyval_eval(env0)
      #ATScaseofseq_beg
      tmplab_py = 1
      while(1):
        mbranch_1.get(tmplab_py)()
        if (tmplab_py == 0): break
      #ATScaseofseq_end
    else:
      atspre_lazy_vt_free(env0)
      tmpret15 = None
    #endif
  else:
    atspre_lazy_vt_free(env0)
  #endif
  return tmpret15


def ats2pypre_stream_vt_length(arg0):
  tmpret24 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_length
  tmpret24 = _ats2pypre_stream_vt_loop_12(arg0, 0)
  return tmpret24


def _ats2pypre_stream_vt_loop_12(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret25 = None
  tmp26 = None
  tmp28 = None
  tmp29 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret25, tmp26, tmp28, tmp29
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp26)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret25, tmp26, tmp28, tmp29
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret25 = arg1
    return
  def __atstmplab10():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret25, tmp26, tmp28, tmp29
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret25, tmp26, tmp28, tmp29
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp28 = tmp26[1]
    #ATSINSfreecon(tmp26);
    tmp29 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp28
    apy1 = tmp29
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_12
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_12
    tmp26 = ATSPMVllazyval_eval(arg0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret25


def ats2pypre_stream2list_vt(arg0):
  tmpret30 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2list_vt
  tmpret30 = _ats2pypre_stream_vt_aux_14(arg0)
  return tmpret30


def _ats2pypre_stream_vt_aux_14(arg0):
  tmpret31 = None
  tmp32 = None
  tmp33 = None
  tmp34 = None
  tmp35 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal arg0
    nonlocal tmpret31, tmp32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp32)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0
    nonlocal tmpret31, tmp32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret31 = None
    return
  def __atstmplab14():
    nonlocal arg0
    nonlocal tmpret31, tmp32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0
    nonlocal tmpret31, tmp32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp33 = tmp32[0]
    tmp34 = tmp32[1]
    #ATSINSfreecon(tmp32);
    tmp35 = _ats2pypre_stream_vt_aux_14(tmp34)
    tmpret31 = (tmp33, tmp35)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_stream_vt_aux_14
  tmp32 = ATSPMVllazyval_eval(arg0)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret31


def ats2pypre_stream2list_vt_rev(arg0):
  tmpret36 = None
  tmp42 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream2list_vt_rev
  tmp42 = None
  tmpret36 = _ats2pypre_stream_vt_loop_16(arg0, tmp42)
  return tmpret36


def _ats2pypre_stream_vt_loop_16(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret37 = None
  tmp38 = None
  tmp39 = None
  tmp40 = None
  tmp41 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret37, tmp38, tmp39, tmp40, tmp41
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp38)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret37, tmp38, tmp39, tmp40, tmp41
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret37 = arg1
    return
  def __atstmplab18():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret37, tmp38, tmp39, tmp40, tmp41
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret37, tmp38, tmp39, tmp40, tmp41
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp39 = tmp38[0]
    tmp40 = tmp38[1]
    #ATSINSfreecon(tmp38);
    tmp41 = (tmp39, arg1)
    #ATStailcalseq_beg
    apy0 = tmp40
    apy1 = tmp41
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_16
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_16
    tmp38 = ATSPMVllazyval_eval(arg0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret37


def ats2pypre_stream_vt_append(arg0, arg1):
  tmpret43 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_append
  tmpret43 = _ats2pypre_stream_vt_auxmain_18(arg0, arg1)
  return tmpret43


def _ats2pypre_stream_vt_auxmain_18(arg0, arg1):
  tmpret44 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_18
  tmpret44 = _ats2pypre_stream_vt_patsfun_19__closurerize(arg0, arg1)
  return tmpret44


def _ats2pypre_stream_vt_patsfun_19(env0, env1, arg0):
  tmpret45 = None
  tmp46 = None
  tmp47 = None
  tmp48 = None
  tmp49 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab20():
    nonlocal env0, env1, arg0
    nonlocal tmpret45, tmp46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp46)): tmplab_py = 4 ; return#__atstmplab23
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal env0, env1, arg0
    nonlocal tmpret45, tmp46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret45 = ATSPMVllazyval_eval(env1)
    return
  def __atstmplab22():
    nonlocal env0, env1, arg0
    nonlocal tmpret45, tmp46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, env1, arg0
    nonlocal tmpret45, tmp46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp47 = tmp46[0]
    tmp48 = tmp46[1]
    #ATSINSfreecon(tmp46);
    tmp49 = _ats2pypre_stream_vt_auxmain_18(tmp48, env1)
    tmpret45 = (tmp47, tmp49)
    return
  mbranch_1 = { 1: __atstmplab20, 2: __atstmplab21, 3: __atstmplab22, 4: __atstmplab23 }
  #__patsflab__ats2pypre_stream_vt_patsfun_19
  if (arg0):
    tmp46 = ATSPMVllazyval_eval(env0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  else:
    atspre_lazy_vt_free(env0)
    atspre_lazy_vt_free(env1)
  #endif
  return tmpret45


def ats2pypre_stream_vt_concat(arg0):
  tmpret52 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_concat
  tmpret52 = _ats2pypre_stream_vt_auxmain_21(arg0)
  return tmpret52


def _ats2pypre_stream_vt_auxmain_21(arg0):
  tmpret53 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_21
  tmpret53 = _ats2pypre_stream_vt_patsfun_22__closurerize(arg0)
  return tmpret53


def _ats2pypre_stream_vt_patsfun_22(env0, arg0):
  tmpret54 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  tmp58 = None
  tmp59 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab24():
    nonlocal env0, arg0
    nonlocal tmpret54, tmp55, tmp56, tmp57, tmp58, tmp59
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp55)): tmplab_py = 4 ; return#__atstmplab27
    __atstmplab25()
    return
  def __atstmplab25():
    nonlocal env0, arg0
    nonlocal tmpret54, tmp55, tmp56, tmp57, tmp58, tmp59
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret54 = None
    return
  def __atstmplab26():
    nonlocal env0, arg0
    nonlocal tmpret54, tmp55, tmp56, tmp57, tmp58, tmp59
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab27()
    return
  def __atstmplab27():
    nonlocal env0, arg0
    nonlocal tmpret54, tmp55, tmp56, tmp57, tmp58, tmp59
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp56 = tmp55[0]
    tmp57 = tmp55[1]
    #ATSINSfreecon(tmp55);
    tmp59 = _ats2pypre_stream_vt_auxmain_21(tmp57)
    tmp58 = ats2pypre_stream_vt_append(tmp56, tmp59)
    tmpret54 = ATSPMVllazyval_eval(tmp58)
    return
  mbranch_1 = { 1: __atstmplab24, 2: __atstmplab25, 3: __atstmplab26, 4: __atstmplab27 }
  #__patsflab__ats2pypre_stream_vt_patsfun_22
  if (arg0):
    tmp55 = ATSPMVllazyval_eval(env0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  else:
    atspre_lazy_vt_free(env0)
  #endif
  return tmpret54


def ats2pypre_stream_vt_map_cloref(arg0, arg1):
  tmpret61 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_map_cloref
  tmpret61 = _ats2pypre_stream_vt_auxmain_24(arg1, arg0)
  return tmpret61


def _ats2pypre_stream_vt_auxmain_24(env0, arg0):
  tmpret62 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_24
  tmpret62 = _ats2pypre_stream_vt_patsfun_25__closurerize(env0, arg0)
  return tmpret62


def _ats2pypre_stream_vt_patsfun_25(env0, env1, arg0):
  tmpret63 = None
  tmp64 = None
  tmp65 = None
  tmp66 = None
  tmp67 = None
  tmp68 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab28():
    nonlocal env0, env1, arg0
    nonlocal tmpret63, tmp64, tmp65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp64)): tmplab_py = 4 ; return#__atstmplab31
    __atstmplab29()
    return
  def __atstmplab29():
    nonlocal env0, env1, arg0
    nonlocal tmpret63, tmp64, tmp65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret63 = None
    return
  def __atstmplab30():
    nonlocal env0, env1, arg0
    nonlocal tmpret63, tmp64, tmp65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab31()
    return
  def __atstmplab31():
    nonlocal env0, env1, arg0
    nonlocal tmpret63, tmp64, tmp65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp65 = tmp64[0]
    tmp66 = tmp64[1]
    #ATSINSfreecon(tmp64);
    tmp67 = env0[0](env0, tmp65)
    tmp68 = _ats2pypre_stream_vt_auxmain_24(env0, tmp66)
    tmpret63 = (tmp67, tmp68)
    return
  mbranch_1 = { 1: __atstmplab28, 2: __atstmplab29, 3: __atstmplab30, 4: __atstmplab31 }
  #__patsflab__ats2pypre_stream_vt_patsfun_25
  if (arg0):
    tmp64 = ATSPMVllazyval_eval(env1)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  else:
    atspre_lazy_vt_free(env1)
  #endif
  return tmpret63


def ats2pypre_stream_vt_map_method(arg0, arg1):
  tmpret70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_map_method
  tmpret70 = _ats2pypre_stream_vt_patsfun_27__closurerize(arg0)
  return tmpret70


def _ats2pypre_stream_vt_patsfun_27(env0, arg0):
  tmpret71 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_27
  tmpret71 = ats2pypre_stream_vt_map_cloref(env0, arg0)
  return tmpret71


def ats2pypre_stream_vt_filter_cloref(arg0, arg1):
  tmpret72 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_filter_cloref
  tmpret72 = _ats2pypre_stream_vt_auxmain_29(arg1, arg0)
  return tmpret72


def _ats2pypre_stream_vt_auxmain_29(env0, arg0):
  tmpret73 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_29
  tmpret73 = _ats2pypre_stream_vt_patsfun_30__closurerize(env0, arg0)
  return tmpret73


def _ats2pypre_stream_vt_patsfun_30(env0, env1, arg0):
  tmpret74 = None
  tmp75 = None
  tmp76 = None
  tmp77 = None
  tmp78 = None
  tmp79 = None
  tmp80 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab32():
    nonlocal env0, env1, arg0
    nonlocal tmpret74, tmp75, tmp76, tmp77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp75)): tmplab_py = 4 ; return#__atstmplab35
    __atstmplab33()
    return
  def __atstmplab33():
    nonlocal env0, env1, arg0
    nonlocal tmpret74, tmp75, tmp76, tmp77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret74 = None
    return
  def __atstmplab34():
    nonlocal env0, env1, arg0
    nonlocal tmpret74, tmp75, tmp76, tmp77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab35()
    return
  def __atstmplab35():
    nonlocal env0, env1, arg0
    nonlocal tmpret74, tmp75, tmp76, tmp77, tmp78, tmp79, tmp80
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp76 = tmp75[0]
    tmp77 = tmp75[1]
    #ATSINSfreecon(tmp75);
    tmp78 = env0[0](env0, tmp76)
    if (tmp78):
      tmp79 = _ats2pypre_stream_vt_auxmain_29(env0, tmp77)
      tmpret74 = (tmp76, tmp79)
    else:
      tmp80 = _ats2pypre_stream_vt_auxmain_29(env0, tmp77)
      tmpret74 = ATSPMVllazyval_eval(tmp80)
    #endif
    return
  mbranch_1 = { 1: __atstmplab32, 2: __atstmplab33, 3: __atstmplab34, 4: __atstmplab35 }
  #__patsflab__ats2pypre_stream_vt_patsfun_30
  if (arg0):
    tmp75 = ATSPMVllazyval_eval(env1)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
  else:
    atspre_lazy_vt_free(env1)
  #endif
  return tmpret74


def ats2pypre_stream_vt_filter_method(arg0):
  tmpret82 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_filter_method
  tmpret82 = _ats2pypre_stream_vt_patsfun_32__closurerize(arg0)
  return tmpret82


def _ats2pypre_stream_vt_patsfun_32(env0, arg0):
  tmpret83 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_32
  tmpret83 = ats2pypre_stream_vt_filter_cloref(env0, arg0)
  return tmpret83


def ats2pypre_stream_vt_exists_cloref(arg0, arg1):
  tmpret84 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_exists_cloref
  tmpret84 = _ats2pypre_stream_vt_loop_34(arg1, arg0)
  return tmpret84


def _ats2pypre_stream_vt_loop_34(env0, arg0):
  apy0 = None
  tmpret85 = None
  tmp86 = None
  tmp87 = None
  tmp88 = None
  tmp89 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab36():
    nonlocal env0, arg0
    nonlocal apy0, tmpret85, tmp86, tmp87, tmp88, tmp89
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp86)): tmplab_py = 4 ; return#__atstmplab39
    __atstmplab37()
    return
  def __atstmplab37():
    nonlocal env0, arg0
    nonlocal apy0, tmpret85, tmp86, tmp87, tmp88, tmp89
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret85 = False
    return
  def __atstmplab38():
    nonlocal env0, arg0
    nonlocal apy0, tmpret85, tmp86, tmp87, tmp88, tmp89
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab39()
    return
  def __atstmplab39():
    nonlocal env0, arg0
    nonlocal apy0, tmpret85, tmp86, tmp87, tmp88, tmp89
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp87 = tmp86[0]
    tmp88 = tmp86[1]
    #ATSINSfreecon(tmp86);
    tmp89 = env0[0](env0, tmp87)
    if (tmp89):
      atspre_lazy_vt_free(tmp88)
      tmpret85 = True
    else:
      #ATStailcalseq_beg
      apy0 = tmp88
      arg0 = apy0
      funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_34
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab36, 2: __atstmplab37, 3: __atstmplab38, 4: __atstmplab39 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_34
    tmp86 = ATSPMVllazyval_eval(arg0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret85


def ats2pypre_stream_vt_exists_method(arg0):
  tmpret91 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_exists_method
  tmpret91 = _ats2pypre_stream_vt_patsfun_36__closurerize(arg0)
  return tmpret91


def _ats2pypre_stream_vt_patsfun_36(env0, arg0):
  tmpret92 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_36
  tmpret92 = ats2pypre_stream_vt_exists_cloref(env0, arg0)
  return tmpret92


def ats2pypre_stream_vt_forall_cloref(arg0, arg1):
  tmpret93 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_forall_cloref
  tmpret93 = _ats2pypre_stream_vt_loop_38(arg1, arg0)
  return tmpret93


def _ats2pypre_stream_vt_loop_38(env0, arg0):
  apy0 = None
  tmpret94 = None
  tmp95 = None
  tmp96 = None
  tmp97 = None
  tmp98 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab40():
    nonlocal env0, arg0
    nonlocal apy0, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp95)): tmplab_py = 4 ; return#__atstmplab43
    __atstmplab41()
    return
  def __atstmplab41():
    nonlocal env0, arg0
    nonlocal apy0, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret94 = True
    return
  def __atstmplab42():
    nonlocal env0, arg0
    nonlocal apy0, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab43()
    return
  def __atstmplab43():
    nonlocal env0, arg0
    nonlocal apy0, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp96 = tmp95[0]
    tmp97 = tmp95[1]
    #ATSINSfreecon(tmp95);
    tmp98 = env0[0](env0, tmp96)
    if (tmp98):
      #ATStailcalseq_beg
      apy0 = tmp97
      arg0 = apy0
      funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_38
      #ATStailcalseq_end
    else:
      atspre_lazy_vt_free(tmp97)
      tmpret94 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab40, 2: __atstmplab41, 3: __atstmplab42, 4: __atstmplab43 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_38
    tmp95 = ATSPMVllazyval_eval(arg0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret94


def ats2pypre_stream_vt_forall_method(arg0):
  tmpret100 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_forall_method
  tmpret100 = _ats2pypre_stream_vt_patsfun_40__closurerize(arg0)
  return tmpret100


def _ats2pypre_stream_vt_patsfun_40(env0, arg0):
  tmpret101 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_40
  tmpret101 = ats2pypre_stream_vt_forall_cloref(env0, arg0)
  return tmpret101


def ats2pypre_stream_vt_foreach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_foreach_cloref
  _ats2pypre_stream_vt_loop_42(arg1, arg0)
  return#_void


def _ats2pypre_stream_vt_loop_42(env0, arg0):
  apy0 = None
  tmp104 = None
  tmp105 = None
  tmp106 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab44():
    nonlocal env0, arg0
    nonlocal apy0, tmp104, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp104)): tmplab_py = 4 ; return#__atstmplab47
    __atstmplab45()
    return
  def __atstmplab45():
    nonlocal env0, arg0
    nonlocal apy0, tmp104, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab46():
    nonlocal env0, arg0
    nonlocal apy0, tmp104, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab47()
    return
  def __atstmplab47():
    nonlocal env0, arg0
    nonlocal apy0, tmp104, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp105 = tmp104[0]
    tmp106 = tmp104[1]
    #ATSINSfreecon(tmp104);
    env0[0](env0, tmp105)
    #ATStailcalseq_beg
    apy0 = tmp106
    arg0 = apy0
    funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_42
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab44, 2: __atstmplab45, 3: __atstmplab46, 4: __atstmplab47 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_42
    tmp104 = ATSPMVllazyval_eval(arg0)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_stream_vt_foreach_method(arg0):
  tmpret108 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_foreach_method
  tmpret108 = _ats2pypre_stream_vt_patsfun_44__closurerize(arg0)
  return tmpret108


def _ats2pypre_stream_vt_patsfun_44(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_44
  ats2pypre_stream_vt_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_stream_vt_iforeach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_iforeach_cloref
  _ats2pypre_stream_vt_loop_46(arg1, 0, arg0)
  return#_void


def _ats2pypre_stream_vt_loop_46(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmp112 = None
  tmp113 = None
  tmp114 = None
  tmp116 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab48():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp112, tmp113, tmp114, tmp116
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp112)): tmplab_py = 4 ; return#__atstmplab51
    __atstmplab49()
    return
  def __atstmplab49():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp112, tmp113, tmp114, tmp116
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab50():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp112, tmp113, tmp114, tmp116
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab51()
    return
  def __atstmplab51():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp112, tmp113, tmp114, tmp116
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp113 = tmp112[0]
    tmp114 = tmp112[1]
    #ATSINSfreecon(tmp112);
    env0[0](env0, arg0, tmp113)
    tmp116 = ats2pypre_add_int1_int1(arg0, 1)
    #ATStailcalseq_beg
    apy0 = tmp116
    apy1 = tmp114
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_stream_vt_loop_46
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab48, 2: __atstmplab49, 3: __atstmplab50, 4: __atstmplab51 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_stream_vt_loop_46
    tmp112 = ATSPMVllazyval_eval(arg1)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_stream_vt_iforeach_method(arg0):
  tmpret117 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_iforeach_method
  tmpret117 = _ats2pypre_stream_vt_patsfun_48__closurerize(arg0)
  return tmpret117


def _ats2pypre_stream_vt_patsfun_48(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_48
  ats2pypre_stream_vt_iforeach_cloref(env0, arg0)
  return#_void


def ats2pypre_stream_vt_rforeach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_rforeach_cloref
  _ats2pypre_stream_vt_auxmain_50(arg1, arg0)
  return#_void


def _ats2pypre_stream_vt_auxmain_50(env0, arg0):
  tmp121 = None
  tmp122 = None
  tmp123 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab52():
    nonlocal env0, arg0
    nonlocal tmp121, tmp122, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp121)): tmplab_py = 4 ; return#__atstmplab55
    __atstmplab53()
    return
  def __atstmplab53():
    nonlocal env0, arg0
    nonlocal tmp121, tmp122, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab54():
    nonlocal env0, arg0
    nonlocal tmp121, tmp122, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab55()
    return
  def __atstmplab55():
    nonlocal env0, arg0
    nonlocal tmp121, tmp122, tmp123
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp122 = tmp121[0]
    tmp123 = tmp121[1]
    #ATSINSfreecon(tmp121);
    _ats2pypre_stream_vt_auxmain_50(env0, tmp123)
    env0[0](env0, tmp122)
    return
  mbranch_1 = { 1: __atstmplab52, 2: __atstmplab53, 3: __atstmplab54, 4: __atstmplab55 }
  #__patsflab__ats2pypre_stream_vt_auxmain_50
  tmp121 = ATSPMVllazyval_eval(arg0)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return#_void


def ats2pypre_stream_vt_rforeach_method(arg0):
  tmpret125 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_rforeach_method
  tmpret125 = _ats2pypre_stream_vt_patsfun_52__closurerize(arg0)
  return tmpret125


def _ats2pypre_stream_vt_patsfun_52(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_52
  ats2pypre_stream_vt_rforeach_cloref(env0, arg0)
  return#_void


def ats2pypre_stream_vt_tabulate_cloref(arg0):
  tmpret127 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_stream_vt_tabulate_cloref
  tmpret127 = _ats2pypre_stream_vt_auxmain_54(arg0, 0)
  return tmpret127


def _ats2pypre_stream_vt_auxmain_54(env0, arg0):
  tmpret128 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_auxmain_54
  tmpret128 = _ats2pypre_stream_vt_patsfun_55__closurerize(env0, arg0)
  return tmpret128


def _ats2pypre_stream_vt_patsfun_55(env0, env1, arg0):
  tmpret129 = None
  tmp130 = None
  tmp131 = None
  tmp132 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_stream_vt_patsfun_55
  if (arg0):
    tmp130 = env0[0](env0, env1)
    tmp132 = ats2pypre_add_int1_int1(env1, 1)
    tmp131 = _ats2pypre_stream_vt_auxmain_54(env0, tmp132)
    tmpret129 = (tmp130, tmp131)
  #endif
  return tmpret129

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_intrange_patsfun_7__closurerize(env0):
  def _ats2pypre_intrange_patsfun_7__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_7(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_7__cfun, env0)

def _ats2pypre_intrange_patsfun_9__closurerize(env0):
  def _ats2pypre_intrange_patsfun_9__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_9(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_9__cfun, env0)

def _ats2pypre_intrange_patsfun_11__closurerize(env0):
  def _ats2pypre_intrange_patsfun_11__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_11(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_11__cfun, env0)

def _ats2pypre_intrange_patsfun_14__closurerize(env0, env1):
  def _ats2pypre_intrange_patsfun_14__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_14(cenv[1], cenv[2], arg0)
  return (_ats2pypre_intrange_patsfun_14__cfun, env0, env1)

def _ats2pypre_intrange_patsfun_18__closurerize(env0):
  def _ats2pypre_intrange_patsfun_18__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_18(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_18__cfun, env0)

def _ats2pypre_intrange_patsfun_21__closurerize(env0):
  def _ats2pypre_intrange_patsfun_21__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_21(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_21__cfun, env0)

def _ats2pypre_intrange_patsfun_24__closurerize(env0, env1, env2):
  def _ats2pypre_intrange_patsfun_24__cfun(cenv): return _ats2pypre_intrange_patsfun_24(cenv[1], cenv[2], cenv[3])
  return (_ats2pypre_intrange_patsfun_24__cfun, env0, env1, env2)

def _ats2pypre_intrange_patsfun_26__closurerize(env0):
  def _ats2pypre_intrange_patsfun_26__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_26(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_26__cfun, env0)

def _ats2pypre_intrange_patsfun_29__closurerize(env0, env1, env2):
  def _ats2pypre_intrange_patsfun_29__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_29(cenv[1], cenv[2], cenv[3], arg0)
  return (_ats2pypre_intrange_patsfun_29__cfun, env0, env1, env2)

def _ats2pypre_intrange_patsfun_31__closurerize(env0):
  def _ats2pypre_intrange_patsfun_31__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_31(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_31__cfun, env0)

def _ats2pypre_intrange_patsfun_38__closurerize(env0):
  def _ats2pypre_intrange_patsfun_38__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_38(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_38__cfun, env0)

def _ats2pypre_intrange_patsfun_42__closurerize(env0):
  def _ats2pypre_intrange_patsfun_42__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_42(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_42__cfun, env0)

def _ats2pypre_intrange_patsfun_46__closurerize(env0):
  def _ats2pypre_intrange_patsfun_46__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_46(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_46__cfun, env0)

def _ats2pypre_intrange_patsfun_50__closurerize(env0, env1, env2):
  def _ats2pypre_intrange_patsfun_50__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_50(cenv[1], cenv[2], cenv[3], arg0)
  return (_ats2pypre_intrange_patsfun_50__cfun, env0, env1, env2)

def ats2pypre_int_repeat_lazy(arg0, arg1):
  tmp1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_repeat_lazy
  tmp1 = ats2pypre_lazy2cloref(arg1)
  ats2pypre_int_repeat_cloref(arg0, tmp1)
  return#_void


def ats2pypre_int_repeat_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_repeat_cloref
  _ats2pypre_intrange_loop_2(arg0, arg1)
  return#_void


def _ats2pypre_intrange_loop_2(arg0, arg1):
  apy0 = None
  apy1 = None
  tmp4 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_2
    tmp4 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp4):
      arg1[0](arg1)
      tmp6 = ats2pypre_sub_int0_int0(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp6
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_2
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    if (funlab_py == 0): break
  return#_void


def ats2pypre_int_exists_cloref(arg0, arg1):
  tmpret7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_exists_cloref
  tmpret7 = ats2pypre_intrange_exists_cloref(0, arg0, arg1)
  return tmpret7


def ats2pypre_int_forall_cloref(arg0, arg1):
  tmpret8 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_forall_cloref
  tmpret8 = ats2pypre_intrange_forall_cloref(0, arg0, arg1)
  return tmpret8


def ats2pypre_int_foreach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foreach_cloref
  ats2pypre_intrange_foreach_cloref(0, arg0, arg1)
  return#_void


def ats2pypre_int_exists_method(arg0):
  tmpret10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_exists_method
  tmpret10 = _ats2pypre_intrange_patsfun_7__closurerize(arg0)
  return tmpret10


def _ats2pypre_intrange_patsfun_7(env0, arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_7
  tmpret11 = ats2pypre_int_exists_cloref(env0, arg0)
  return tmpret11


def ats2pypre_int_forall_method(arg0):
  tmpret12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_forall_method
  tmpret12 = _ats2pypre_intrange_patsfun_9__closurerize(arg0)
  return tmpret12


def _ats2pypre_intrange_patsfun_9(env0, arg0):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_9
  tmpret13 = ats2pypre_int_forall_cloref(env0, arg0)
  return tmpret13


def ats2pypre_int_foreach_method(arg0):
  tmpret14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foreach_method
  tmpret14 = _ats2pypre_intrange_patsfun_11__closurerize(arg0)
  return tmpret14


def _ats2pypre_intrange_patsfun_11(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_11
  ats2pypre_int_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_int_foldleft_cloref(arg0, arg1, arg2):
  tmpret16 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foldleft_cloref
  tmpret16 = ats2pypre_intrange_foldleft_cloref(0, arg0, arg1, arg2)
  return tmpret16


def ats2pypre_int_foldleft_method(arg0, arg1):
  tmpret17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foldleft_method
  tmpret17 = _ats2pypre_intrange_patsfun_14__closurerize(arg0, arg1)
  return tmpret17


def _ats2pypre_intrange_patsfun_14(env0, env1, arg0):
  tmpret18 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_14
  tmpret18 = ats2pypre_int_foldleft_cloref(env0, env1, arg0)
  return tmpret18


def ats2pypre_int_list_map_cloref(arg0, arg1):
  tmpret19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list_map_cloref
  tmpret19 = _ats2pypre_intrange_aux_16(arg0, arg1, 0)
  return tmpret19


def _ats2pypre_intrange_aux_16(env0, env1, arg0):
  tmpret20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_aux_16
  tmp21 = ats2pypre_lt_int1_int1(arg0, env0)
  if (tmp21):
    tmp22 = env1[0](env1, arg0)
    tmp24 = ats2pypre_add_int1_int1(arg0, 1)
    tmp23 = _ats2pypre_intrange_aux_16(env0, env1, tmp24)
    tmpret20 = (tmp22, tmp23)
  else:
    tmpret20 = None
  #endif
  return tmpret20


def ats2pypre_int_list_map_method(arg0, arg1):
  tmpret25 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list_map_method
  tmpret25 = _ats2pypre_intrange_patsfun_18__closurerize(arg0)
  return tmpret25


def _ats2pypre_intrange_patsfun_18(env0, arg0):
  tmpret26 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_18
  tmpret26 = ats2pypre_int_list_map_cloref(env0, arg0)
  return tmpret26


def ats2pypre_int_list0_map_cloref(arg0, arg1):
  tmpret27 = None
  tmp28 = None
  tmp29 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list0_map_cloref
  tmp28 = ats2pypre_gte_int1_int1(arg0, 0)
  if (tmp28):
    tmp29 = ats2pypre_int_list_map_cloref(arg0, arg1)
    tmpret27 = tmp29
  else:
    tmpret27 = None
  #endif
  return tmpret27


def ats2pypre_int_list0_map_method(arg0, arg1):
  tmpret30 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list0_map_method
  tmpret30 = _ats2pypre_intrange_patsfun_21__closurerize(arg0)
  return tmpret30


def _ats2pypre_intrange_patsfun_21(env0, arg0):
  tmpret31 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_21
  tmpret31 = ats2pypre_int_list0_map_cloref(env0, arg0)
  return tmpret31


def ats2pypre_int_stream_map_cloref(arg0, arg1):
  tmpret32 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_stream_map_cloref
  tmpret32 = _ats2pypre_intrange_aux_23(arg0, arg1, 0)
  return tmpret32


def _ats2pypre_intrange_aux_23(env0, env1, arg0):
  tmpret33 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_aux_23
  tmpret33 = [0, _ats2pypre_intrange_patsfun_24__closurerize(env0, env1, arg0)]
  return tmpret33


def _ats2pypre_intrange_patsfun_24(env0, env1, env2):
  tmpret34 = None
  tmp35 = None
  tmp36 = None
  tmp37 = None
  tmp38 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_24
  tmp35 = ats2pypre_lt_int1_int1(env2, env0)
  if (tmp35):
    tmp36 = env1[0](env1, env2)
    tmp38 = ats2pypre_add_int1_int1(env2, 1)
    tmp37 = _ats2pypre_intrange_aux_23(env0, env1, tmp38)
    tmpret34 = (tmp36, tmp37)
  else:
    tmpret34 = None
  #endif
  return tmpret34


def ats2pypre_int_stream_map_method(arg0, arg1):
  tmpret39 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_stream_map_method
  tmpret39 = _ats2pypre_intrange_patsfun_26__closurerize(arg0)
  return tmpret39


def _ats2pypre_intrange_patsfun_26(env0, arg0):
  tmpret40 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_26
  tmpret40 = ats2pypre_int_stream_map_cloref(env0, arg0)
  return tmpret40


def ats2pypre_int_stream_vt_map_cloref(arg0, arg1):
  tmpret41 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_stream_vt_map_cloref
  tmpret41 = _ats2pypre_intrange_aux_28(arg0, arg1, 0)
  return tmpret41


def _ats2pypre_intrange_aux_28(env0, env1, arg0):
  tmpret42 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_aux_28
  tmpret42 = _ats2pypre_intrange_patsfun_29__closurerize(env0, env1, arg0)
  return tmpret42


def _ats2pypre_intrange_patsfun_29(env0, env1, env2, arg0):
  tmpret43 = None
  tmp44 = None
  tmp45 = None
  tmp46 = None
  tmp47 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_29
  if (arg0):
    tmp44 = ats2pypre_lt_int1_int1(env2, env0)
    if (tmp44):
      tmp45 = env1[0](env1, env2)
      tmp47 = ats2pypre_add_int1_int1(env2, 1)
      tmp46 = _ats2pypre_intrange_aux_28(env0, env1, tmp47)
      tmpret43 = (tmp45, tmp46)
    else:
      tmpret43 = None
    #endif
  #endif
  return tmpret43


def ats2pypre_int_stream_vt_map_method(arg0, arg1):
  tmpret48 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_stream_vt_map_method
  tmpret48 = _ats2pypre_intrange_patsfun_31__closurerize(arg0)
  return tmpret48


def _ats2pypre_intrange_patsfun_31(env0, arg0):
  tmpret49 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_31
  tmpret49 = ats2pypre_int_stream_vt_map_cloref(env0, arg0)
  return tmpret49


def ats2pypre_int2_exists_cloref(arg0, arg1, arg2):
  tmpret50 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_exists_cloref
  tmpret50 = ats2pypre_intrange2_exists_cloref(0, arg0, 0, arg1, arg2)
  return tmpret50


def ats2pypre_int2_forall_cloref(arg0, arg1, arg2):
  tmpret51 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_forall_cloref
  tmpret51 = ats2pypre_intrange2_forall_cloref(0, arg0, 0, arg1, arg2)
  return tmpret51


def ats2pypre_int2_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_foreach_cloref
  ats2pypre_intrange2_foreach_cloref(0, arg0, 0, arg1, arg2)
  return#_void


def ats2pypre_intrange_exists_cloref(arg0, arg1, arg2):
  tmpret53 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_exists_cloref
  tmpret53 = _ats2pypre_intrange_loop_36(arg0, arg1, arg2)
  return tmpret53


def _ats2pypre_intrange_loop_36(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret54 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_36
    tmp55 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp55):
      tmp56 = arg2[0](arg2, arg0)
      if (tmp56):
        tmpret54 = True
      else:
        tmp57 = ats2pypre_add_int0_int0(arg0, 1)
        #ATStailcalseq_beg
        apy0 = tmp57
        apy1 = arg1
        apy2 = arg2
        arg0 = apy0
        arg1 = apy1
        arg2 = apy2
        funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_36
        #ATStailcalseq_end
      #endif
    else:
      tmpret54 = False
    #endif
    if (funlab_py == 0): break
  return tmpret54


def ats2pypre_intrange_exists_method(arg0):
  tmpret58 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_exists_method
  tmpret58 = _ats2pypre_intrange_patsfun_38__closurerize(arg0)
  return tmpret58


def _ats2pypre_intrange_patsfun_38(env0, arg0):
  tmpret59 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_38
  tmpret59 = ats2pypre_intrange_exists_cloref(env0[0], env0[1], arg0)
  return tmpret59


def ats2pypre_intrange_forall_cloref(arg0, arg1, arg2):
  tmpret60 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_forall_cloref
  tmpret60 = _ats2pypre_intrange_loop_40(arg0, arg1, arg2)
  return tmpret60


def _ats2pypre_intrange_loop_40(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret61 = None
  tmp62 = None
  tmp63 = None
  tmp64 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_40
    tmp62 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp62):
      tmp63 = arg2[0](arg2, arg0)
      if (tmp63):
        tmp64 = ats2pypre_add_int0_int0(arg0, 1)
        #ATStailcalseq_beg
        apy0 = tmp64
        apy1 = arg1
        apy2 = arg2
        arg0 = apy0
        arg1 = apy1
        arg2 = apy2
        funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_40
        #ATStailcalseq_end
      else:
        tmpret61 = False
      #endif
    else:
      tmpret61 = True
    #endif
    if (funlab_py == 0): break
  return tmpret61


def ats2pypre_intrange_forall_method(arg0):
  tmpret65 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_forall_method
  tmpret65 = _ats2pypre_intrange_patsfun_42__closurerize(arg0)
  return tmpret65


def _ats2pypre_intrange_patsfun_42(env0, arg0):
  tmpret66 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_42
  tmpret66 = ats2pypre_intrange_forall_cloref(env0[0], env0[1], arg0)
  return tmpret66


def ats2pypre_intrange_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foreach_cloref
  _ats2pypre_intrange_loop_44(arg0, arg1, arg2)
  return#_void


def _ats2pypre_intrange_loop_44(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmp69 = None
  tmp71 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_44
    tmp69 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp69):
      arg2[0](arg2, arg0)
      tmp71 = ats2pypre_add_int0_int0(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp71
      apy1 = arg1
      apy2 = arg2
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_44
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    if (funlab_py == 0): break
  return#_void


def ats2pypre_intrange_foreach_method(arg0):
  tmpret72 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foreach_method
  tmpret72 = _ats2pypre_intrange_patsfun_46__closurerize(arg0)
  return tmpret72


def _ats2pypre_intrange_patsfun_46(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_46
  ats2pypre_intrange_foreach_cloref(env0[0], env0[1], arg0)
  return#_void


def ats2pypre_intrange_foldleft_cloref(arg0, arg1, arg2, arg3):
  tmpret74 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foldleft_cloref
  tmpret74 = _ats2pypre_intrange_loop_48(arg3, arg0, arg1, arg2, arg3)
  return tmpret74


def _ats2pypre_intrange_loop_48(env0, arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret75 = None
  tmp76 = None
  tmp77 = None
  tmp78 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_48
    tmp76 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp76):
      tmp77 = ats2pypre_add_int0_int0(arg0, 1)
      tmp78 = arg3[0](arg3, arg2, arg0)
      #ATStailcalseq_beg
      apy0 = tmp77
      apy1 = arg1
      apy2 = tmp78
      apy3 = env0
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_48
      #ATStailcalseq_end
    else:
      tmpret75 = arg2
    #endif
    if (funlab_py == 0): break
  return tmpret75


def ats2pypre_intrange_foldleft_method(arg0, arg1):
  tmp79 = None
  tmp80 = None
  tmpret81 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foldleft_method
  tmp79 = arg0[0]
  tmp80 = arg0[1]
  tmpret81 = _ats2pypre_intrange_patsfun_50__closurerize(tmp79, tmp80, arg1)
  return tmpret81


def _ats2pypre_intrange_patsfun_50(env0, env1, env2, arg0):
  tmpret82 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_50
  tmpret82 = ats2pypre_intrange_foldleft_cloref(env0, env1, env2, arg0)
  return tmpret82


def ats2pypre_intrange2_exists_cloref(arg0, arg1, arg2, arg3, arg4):
  tmpret83 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_exists_cloref
  tmpret83 = _ats2pypre_intrange_loop1_52(arg2, arg3, arg4, arg0, arg1, arg2, arg3, arg4)
  return tmpret83


def _ats2pypre_intrange_loop1_52(env0, env1, env2, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmpret84 = None
  tmp85 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmpret86 = None
  tmp87 = None
  tmp88 = None
  tmp89 = None
  tmp90 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_52():
    nonlocal env0, env1, env2, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret84, tmp85, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret86, tmp87, tmp88, tmp89, tmp90
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp85 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp85):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = env2
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_53
      #ATStailcalseq_end
    else:
      tmpret84 = False
    #endif
    return tmpret84
  def __patsflab__ats2pypre_intrange_loop2_53():
    nonlocal env0, env1, env2, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret84, tmp85, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret86, tmp87, tmp88, tmp89, tmp90
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp87 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp87):
      tmp88 = a2rg4[0](a2rg4, a2rg0, a2rg2)
      if (tmp88):
        tmpret86 = True
      else:
        tmp89 = ats2pypre_add_int0_int0(a2rg2, 1)
        #ATStailcalseq_beg
        a2py0 = a2rg0
        a2py1 = a2rg1
        a2py2 = tmp89
        a2py3 = a2rg3
        a2py4 = a2rg4
        a2rg0 = a2py0
        a2rg1 = a2py1
        a2rg2 = a2py2
        a2rg3 = a2py3
        a2rg4 = a2py4
        funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_53
        #ATStailcalseq_end
      #endif
    else:
      tmp90 = ats2pypre_add_int0_int0(a2rg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp90
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_52
      #ATStailcalseq_end
    #endif
    return tmpret86
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_52, 2: __patsflab__ats2pypre_intrange_loop2_53 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py


def ats2pypre_intrange2_forall_cloref(arg0, arg1, arg2, arg3, arg4):
  tmpret91 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_forall_cloref
  tmpret91 = _ats2pypre_intrange_loop1_55(arg2, arg3, arg0, arg1, arg2, arg3, arg4)
  return tmpret91


def _ats2pypre_intrange_loop1_55(env0, env1, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmpret92 = None
  tmp93 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmpret94 = None
  tmp95 = None
  tmp96 = None
  tmp97 = None
  tmp98 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_55():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret92, tmp93, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp93 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp93):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = arg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_56
      #ATStailcalseq_end
    else:
      tmpret92 = True
    #endif
    return tmpret92
  def __patsflab__ats2pypre_intrange_loop2_56():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret92, tmp93, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret94, tmp95, tmp96, tmp97, tmp98
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp95 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp95):
      tmp96 = a2rg4[0](a2rg4, a2rg0, a2rg2)
      if (tmp96):
        tmp97 = ats2pypre_add_int0_int0(a2rg2, 1)
        #ATStailcalseq_beg
        a2py0 = a2rg0
        a2py1 = a2rg1
        a2py2 = tmp97
        a2py3 = a2rg3
        a2py4 = a2rg4
        a2rg0 = a2py0
        a2rg1 = a2py1
        a2rg2 = a2py2
        a2rg3 = a2py3
        a2rg4 = a2py4
        funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_56
        #ATStailcalseq_end
      else:
        tmpret94 = False
      #endif
    else:
      tmp98 = ats2pypre_add_int0_int0(a2rg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp98
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_55
      #ATStailcalseq_end
    #endif
    return tmpret94
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_55, 2: __patsflab__ats2pypre_intrange_loop2_56 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py


def ats2pypre_intrange2_foreach_cloref(arg0, arg1, arg2, arg3, arg4):
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_foreach_cloref
  _ats2pypre_intrange_loop1_58(arg2, arg3, arg0, arg1, arg2, arg3, arg4)
  return#_void


def _ats2pypre_intrange_loop1_58(env0, env1, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmp101 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmp103 = None
  tmp105 = None
  tmp106 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_58():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmp101, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmp103, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp101 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp101):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = arg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_59
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    return#_void
  def __patsflab__ats2pypre_intrange_loop2_59():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmp101, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmp103, tmp105, tmp106
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp103 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp103):
      a2rg4[0](a2rg4, a2rg0, a2rg2)
      tmp105 = ats2pypre_add_int0_int0(a2rg2, 1)
      #ATStailcalseq_beg
      a2py0 = a2rg0
      a2py1 = a2rg1
      a2py2 = tmp105
      a2py3 = a2rg3
      a2py4 = a2rg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_59
      #ATStailcalseq_end
    else:
      tmp106 = ats2pypre_succ_int0(a2rg0)
      #ATStailcalseq_beg
      apy0 = tmp106
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_58
      #ATStailcalseq_end
    #endif
    return#_void
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_58, 2: __patsflab__ats2pypre_intrange_loop2_59 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_arrayref_patsfun_8__closurerize(env0):
  def _ats2pypre_arrayref_patsfun_8__cfun(cenv, arg0): return _ats2pypre_arrayref_patsfun_8(cenv[1], arg0)
  return (_ats2pypre_arrayref_patsfun_8__cfun, env0)

def ats2pypre_arrayref_exists_cloref(arg0, arg1, arg2):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_exists_cloref
  tmpret0 = ats2pypre_int_exists_cloref(arg1, arg2)
  return tmpret0


def ats2pypre_arrayref_forall_cloref(arg0, arg1, arg2):
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_forall_cloref
  tmpret1 = ats2pypre_int_forall_cloref(arg1, arg2)
  return tmpret1


def ats2pypre_arrayref_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_foreach_cloref
  ats2pypre_int_foreach_cloref(arg1, arg2)
  return#_void


def ats2pypre_arrszref_make_elt(arg0, arg1):
  tmpret3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_make_elt
  tmp4 = ats2pypre_arrayref_make_elt(arg0, arg1)
  tmpret3 = ats2pypre_arrszref_make_arrayref(tmp4, arg0)
  return tmpret3


def ats2pypre_arrszref_exists_cloref(arg0, arg1):
  tmpret5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_exists_cloref
  tmp6 = ats2pypre_arrszref_size(arg0)
  tmpret5 = ats2pypre_int_exists_cloref(tmp6, arg1)
  return tmpret5


def ats2pypre_arrszref_forall_cloref(arg0, arg1):
  tmpret7 = None
  tmp8 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_forall_cloref
  tmp8 = ats2pypre_arrszref_size(arg0)
  tmpret7 = ats2pypre_int_forall_cloref(tmp8, arg1)
  return tmpret7


def ats2pypre_arrszref_foreach_cloref(arg0, arg1):
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_foreach_cloref
  tmp10 = ats2pypre_arrszref_size(arg0)
  ats2pypre_int_foreach_cloref(tmp10, arg1)
  return#_void


def ats2pypre_arrszref_foreach_method(arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_foreach_method
  tmpret11 = _ats2pypre_arrayref_patsfun_8__closurerize(arg0)
  return tmpret11


def _ats2pypre_arrayref_patsfun_8(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_arrayref_patsfun_8
  ats2pypre_arrszref_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_arrayref_make_elt(arg0, arg1):
  tmpret13 = None
  tmp14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_make_elt
  tmp14 = ats2pypre_PYlist_make_elt(arg0, arg1)
  tmpret13 = tmp14
  return tmpret13


def ats2pypre_arrayref_get_at(arg0, arg1):
  tmpret15 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_get_at
  tmpret15 = ats2pypre_PYlist_get_at(arg0, arg1)
  return tmpret15


def ats2pypre_arrayref_set_at(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrayref_set_at
  ats2pypre_PYlist_set_at(arg0, arg1, arg2)
  return#_void


def ats2pypre_arrszref_make_arrayref(arg0, arg1):
  tmpret17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_make_arrayref
  tmpret17 = arg0
  return tmpret17


def ats2pypre_arrszref_size(arg0):
  tmpret18 = None
  tmp19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_size
  tmp19 = ats2pypre_PYlist_length(arg0)
  tmpret18 = tmp19
  return tmpret18


def ats2pypre_arrszref_get_at(arg0, arg1):
  tmpret20 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_get_at
  tmpret20 = ats2pypre_PYlist_get_at(arg0, arg1)
  return tmpret20


def ats2pypre_arrszref_set_at(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_arrszref_set_at
  ats2pypre_PYlist_set_at(arg0, arg1, arg2)
  return#_void

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

######
#ATSextcode_beg()
######
######
def ats2pypre_matrixref_make_elt(m, n, x0):
  M = []
  i0 = 0
  mn = m * n
  while (i0 < mn): i0 = i0 + 1; M.append(x0)
  return M
######
######
#ATSextcode_end()
######

######
#ATSextcode_beg()
######
######
def ats2pypre_mtrxszref_make_matrixref(M, m, n):
  return { 'matrix' : M, 'nrow' : m, 'ncol' : n }
######
def ats2pypre_mtrxszref_get_nrow(MSZ): return MSZ['nrow']
def ats2pypre_mtrxszref_get_ncol(MSZ): return MSZ['ncol']
######
def ats2pypre_mtrxszref_get_at(MSZ, i, j):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_get_at')
  if (j < 0): raise IndexError('mtrxszref_get_at')
  if (i >= nrow): raise IndexError('mtrxszref_get_at')
  if (j >= ncol): raise IndexError('mtrxszref_get_at')
  return MSZ['matrix'][i*ncol+j]
######
def ats2pypre_mtrxszref_set_at(MSZ, i, j, x0):
  nrow = MSZ['nrow']
  ncol = MSZ['ncol']
  if (i < 0): raise IndexError('mtrxszref_set_at')
  if (j < 0): raise IndexError('mtrxszref_set_at')
  if (i >= nrow): raise IndexError('mtrxszref_set_at')
  if (j >= ncol): raise IndexError('mtrxszref_set_at')
  MSZ['matrix'][i*ncol+j] = x0; return##_void
######
######
#ATSextcode_end()
######

def _ats2pypre_matrixref_patsfun_7__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_7__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_7(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_7__cfun, env0)

def _ats2pypre_matrixref_patsfun_9__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_9__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_9(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_9__cfun, env0)

def _ats2pypre_matrixref_patsfun_12__closurerize(env0):
  def _ats2pypre_matrixref_patsfun_12__cfun(cenv, arg0): return _ats2pypre_matrixref_patsfun_12(cenv[1], arg0)
  return (_ats2pypre_matrixref_patsfun_12__cfun, env0)

def ats2pypre_matrixref_exists_cloref(arg0, arg1, arg2, arg3):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_exists_cloref
  tmpret0 = ats2pypre_int2_exists_cloref(arg1, arg2, arg3)
  return tmpret0


def ats2pypre_matrixref_forall_cloref(arg0, arg1, arg2, arg3):
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_forall_cloref
  tmpret1 = ats2pypre_int2_forall_cloref(arg1, arg2, arg3)
  return tmpret1


def ats2pypre_matrixref_foreach_cloref(arg0, arg1, arg2, arg3):
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_foreach_cloref
  ats2pypre_int2_foreach_cloref(arg1, arg2, arg3)
  return#_void


def ats2pypre_mtrxszref_make_elt(arg0, arg1, arg2):
  tmpret3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_make_elt
  tmp4 = ats2pypre_matrixref_make_elt(arg0, arg1, arg2)
  tmpret3 = ats2pypre_mtrxszref_make_matrixref(tmp4, arg0, arg1)
  return tmpret3


def ats2pypre_mtrxszref_exists_cloref(arg0, arg1):
  tmpret5 = None
  tmp6 = None
  tmp7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_exists_cloref
  tmp6 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp7 = ats2pypre_mtrxszref_get_ncol(arg0)
  tmpret5 = ats2pypre_int2_exists_cloref(tmp6, tmp7, arg1)
  return tmpret5


def ats2pypre_mtrxszref_forall_cloref(arg0, arg1):
  tmpret8 = None
  tmp9 = None
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_forall_cloref
  tmp9 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp10 = ats2pypre_mtrxszref_get_ncol(arg0)
  tmpret8 = ats2pypre_int2_forall_cloref(tmp9, tmp10, arg1)
  return tmpret8


def ats2pypre_mtrxszref_exists_method(arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_exists_method
  tmpret11 = _ats2pypre_matrixref_patsfun_7__closurerize(arg0)
  return tmpret11


def _ats2pypre_matrixref_patsfun_7(env0, arg0):
  tmpret12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_7
  tmpret12 = ats2pypre_mtrxszref_exists_cloref(env0, arg0)
  return tmpret12


def ats2pypre_mtrxszref_forall_method(arg0):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_forall_method
  tmpret13 = _ats2pypre_matrixref_patsfun_9__closurerize(arg0)
  return tmpret13


def _ats2pypre_matrixref_patsfun_9(env0, arg0):
  tmpret14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_9
  tmpret14 = ats2pypre_mtrxszref_forall_cloref(env0, arg0)
  return tmpret14


def ats2pypre_mtrxszref_foreach_cloref(arg0, arg1):
  tmp16 = None
  tmp17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_foreach_cloref
  tmp16 = ats2pypre_mtrxszref_get_nrow(arg0)
  tmp17 = ats2pypre_mtrxszref_get_ncol(arg0)
  ats2pypre_int2_foreach_cloref(tmp16, tmp17, arg1)
  return#_void


def ats2pypre_mtrxszref_foreach_method(arg0):
  tmpret18 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_mtrxszref_foreach_method
  tmpret18 = _ats2pypre_matrixref_patsfun_12__closurerize(arg0)
  return tmpret18


def _ats2pypre_matrixref_patsfun_12(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_matrixref_patsfun_12
  ats2pypre_mtrxszref_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_matrixref_get_at(arg0, arg1, arg2, arg3):
  tmpret20 = None
  tmp21 = None
  tmp22 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_get_at
  tmp22 = ats2pypre_mul_int1_int1(arg1, arg2)
  tmp21 = ats2pypre_add_int1_int1(tmp22, arg3)
  tmpret20 = ats2pypre_PYlist_get_at(arg0, tmp21)
  return tmpret20


def ats2pypre_matrixref_set_at(arg0, arg1, arg2, arg3, arg4):
  tmp24 = None
  tmp25 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_matrixref_set_at
  tmp25 = ats2pypre_mul_int1_int1(arg1, arg2)
  tmp24 = ats2pypre_add_int1_int1(tmp25, arg3)
  ats2pypre_PYlist_set_at(arg0, tmp24, arg4)
  return#_void

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

#ATSassume(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_slistref_056_sats__slistref_type)

def slistref_make_nil():
  tmpret0 = None
  tmp1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_make_nil
  tmp1 = None
  tmpret0 = ats2pypre_ref(tmp1)
  return tmpret0


def slistref_length(arg0):
  tmpret2 = None
  tmp3 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_length
  tmp3 = ats2pypre_ref_get_elt(arg0)
  tmpret2 = ats2pypre_list_length(tmp3)
  return tmpret2


def slistref_push(arg0, arg1):
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_push
  tmp6 = ats2pypre_ref_get_elt(arg0)
  tmp5 = (arg1, tmp6)
  ats2pypre_ref_set_elt(arg0, tmp5)
  return#_void


def slistref_pop_opt(arg0):
  tmpret7 = None
  tmp8 = None
  tmp9 = None
  tmp10 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp8)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret7 = None
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret7, tmp8, tmp9, tmp10
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp9 = tmp8[0]
    tmp10 = tmp8[1]
    ats2pypre_ref_set_elt(arg0, tmp10)
    tmpret7 = (tmp9, )
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  #__patsflab_slistref_pop_opt
  tmp8 = ats2pypre_ref_get_elt(arg0)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret7


def slistref_foldleft(arg0, arg1, arg2):
  tmpret12 = None
  tmp13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_foldleft
  tmp13 = ats2pypre_ref_get_elt(arg0)
  tmpret12 = ats2pypre_list_foldleft(tmp13, arg1, arg2)
  return tmpret12


def slistref_foldright(arg0, arg1, arg2):
  tmpret14 = None
  tmp15 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_slistref_foldright
  tmp15 = ats2pypre_ref_get_elt(arg0)
  tmpret14 = ats2pypre_list_foldright(tmp15, arg1, arg2)
  return tmpret14

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

#ATSassume(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_type)

def ats2pypre_qlistref_make_nil():
  tmpret0 = None
  tmp1 = None
  tmp2 = None
  tmp3 = None
  tmp4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_make_nil
  tmp2 = None
  tmp1 = ats2pypre_ref(tmp2)
  tmp4 = None
  tmp3 = ats2pypre_ref(tmp4)
  tmpret0 = (tmp1, tmp3)
  return tmpret0


def ats2pypre_qlistref_length(arg0):
  tmpret5 = None
  tmp6 = None
  tmp7 = None
  tmp8 = None
  tmp9 = None
  tmp10 = None
  tmp11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_length
  tmp6 = arg0[0]
  tmp7 = arg0[1]
  tmp9 = ats2pypre_ref_get_elt(tmp6)
  tmp8 = ats2pypre_list_length(tmp9)
  tmp11 = ats2pypre_ref_get_elt(tmp7)
  tmp10 = ats2pypre_list_length(tmp11)
  tmpret5 = ats2pypre_add_int1_int1(tmp8, tmp10)
  return tmpret5


def ats2pypre_qlistref_enqueue(arg0, arg1):
  tmp13 = None
  tmp14 = None
  tmp15 = None
  tmp16 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_enqueue
  tmp13 = arg0[0]
  tmp14 = arg0[1]
  tmp16 = ats2pypre_ref_get_elt(tmp13)
  tmp15 = (arg1, tmp16)
  ats2pypre_ref_set_elt(tmp13, tmp15)
  return#_void


def ats2pypre_qlistref_dequeue_opt(arg0):
  tmpret17 = None
  tmp18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp25 = None
  tmp26 = None
  tmp27 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp20)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp23 = ats2pypre_ref_get_elt(tmp18)
    tmp25 = None
    ats2pypre_ref_set_elt(tmp18, tmp25)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp21 = tmp20[0]
    tmp22 = tmp20[1]
    ats2pypre_ref_set_elt(tmp19, tmp22)
    tmpret17 = (tmp21, )
    return
  def __atstmplab4():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp23)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret17 = None
    return
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp25, tmp26, tmp27
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp26 = tmp23[0]
    tmp27 = tmp23[1]
    ats2pypre_ref_set_elt(tmp19, tmp27)
    tmpret17 = (tmp26, )
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  mbranch_2 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab_qlistref_dequeue_opt
  tmp18 = arg0[0]
  tmp19 = arg0[1]
  tmp20 = ats2pypre_ref_get_elt(tmp19)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret17


def ats2pypre_qlistref_foldleft(arg0, arg1, arg2):
  tmpret30 = None
  tmp31 = None
  tmp32 = None
  tmp41 = None
  tmp42 = None
  tmp43 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldleft
  tmp31 = arg0[0]
  tmp32 = arg0[1]
  tmp41 = ats2pypre_ref_get_elt(tmp31)
  tmp43 = ats2pypre_ref_get_elt(tmp32)
  tmp42 = _ats2pypre_qlistref_auxl_5(arg2, arg1, tmp43)
  tmpret30 = _ats2pypre_qlistref_auxr_6(arg2, tmp41, tmp42)
  return tmpret30


def _ats2pypre_qlistref_auxl_5(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret33 = None
  tmp34 = None
  tmp35 = None
  tmp36 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret33 = arg0
    return
  def __atstmplab10():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret33, tmp34, tmp35, tmp36
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp34 = arg1[0]
    tmp35 = arg1[1]
    tmp36 = env0[0](env0, arg0, tmp34)
    #ATStailcalseq_beg
    apy0 = tmp36
    apy1 = tmp35
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_5
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_5
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret33


def _ats2pypre_qlistref_auxr_6(env0, arg0, arg1):
  tmpret37 = None
  tmp38 = None
  tmp39 = None
  tmp40 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret37 = arg1
    return
  def __atstmplab14():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal env0, arg0, arg1
    nonlocal tmpret37, tmp38, tmp39, tmp40
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp38 = arg0[0]
    tmp39 = arg0[1]
    tmp40 = _ats2pypre_qlistref_auxr_6(env0, tmp39, arg1)
    tmpret37 = env0[0](env0, tmp40, tmp38)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_qlistref_auxr_6
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret37


def ats2pypre_qlistref_foldright(arg0, arg1, arg2):
  tmpret44 = None
  tmp45 = None
  tmp46 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldright
  tmp45 = arg0[0]
  tmp46 = arg0[1]
  tmp55 = ats2pypre_ref_get_elt(tmp46)
  tmp57 = ats2pypre_ref_get_elt(tmp45)
  tmp56 = _ats2pypre_qlistref_auxl_8(arg1, arg2, tmp57)
  tmpret44 = _ats2pypre_qlistref_auxr_9(arg1, tmp55, tmp56)
  return tmpret44


def _ats2pypre_qlistref_auxl_8(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret47 = None
  tmp48 = None
  tmp49 = None
  tmp50 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret47 = arg0
    return
  def __atstmplab18():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp48, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp48 = arg1[0]
    tmp49 = arg1[1]
    tmp50 = env0[0](env0, tmp48, arg0)
    #ATStailcalseq_beg
    apy0 = tmp50
    apy1 = tmp49
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_8
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_8
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret47


def _ats2pypre_qlistref_auxr_9(env0, arg0, arg1):
  tmpret51 = None
  tmp52 = None
  tmp53 = None
  tmp54 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab20():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab23
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret51 = arg1
    return
  def __atstmplab22():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp52 = arg0[0]
    tmp53 = arg0[1]
    tmp54 = _ats2pypre_qlistref_auxr_9(env0, tmp53, arg1)
    tmpret51 = env0[0](env0, tmp52, tmp54)
    return
  mbranch_1 = { 1: __atstmplab20, 2: __atstmplab21, 3: __atstmplab22, 4: __atstmplab23 }
  #__patsflab__ats2pypre_qlistref_auxr_9
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret51

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

def _ats2pypre_ML_list0_patsfun_26__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_26__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_26(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_26__cfun, env0)

def _ats2pypre_ML_list0_patsfun_29__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_29__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_29(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_29__cfun, env0)

def _ats2pypre_ML_list0_patsfun_32__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_32__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_32(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_32__cfun, env0)

def _ats2pypre_ML_list0_patsfun_35__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_35__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_35(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_35__cfun, env0)

def _ats2pypre_ML_list0_patsfun_39__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_39__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_39(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_39__cfun, env0)

def _ats2pypre_ML_list0_patsfun_42__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_42__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_42(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_42__cfun, env0)

def _ats2pypre_ML_list0_patsfun_45__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_45__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_45(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_45__cfun, env0)

def _ats2pypre_ML_list0_patsfun_48__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_48__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_48(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_48__cfun, env0)

def _ats2pypre_ML_list0_patsfun_51__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_51__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_51(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_51__cfun, env0)

def _ats2pypre_ML_list0_patsfun_59__closurerize(env0, env1):
  def _ats2pypre_ML_list0_patsfun_59__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_59(cenv[1], cenv[2], arg0)
  return (_ats2pypre_ML_list0_patsfun_59__cfun, env0, env1)

def ats2pypre_ML_list0_head_opt(arg0):
  tmpret4 = None
  tmp5 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret4, tmp5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab9
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret4, tmp5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = None
    return
  def __atstmplab8():
    nonlocal arg0
    nonlocal tmpret4, tmp5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0
    nonlocal tmpret4, tmp5
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp5 = arg0[0]
    tmpret4 = (tmp5, )
    return
  mbranch_1 = { 1: __atstmplab6, 2: __atstmplab7, 3: __atstmplab8, 4: __atstmplab9 }
  #__patsflab_list0_head_opt
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret4


def ats2pypre_ML_list0_tail_opt(arg0):
  tmpret7 = None
  tmp9 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab10():
    nonlocal arg0
    nonlocal tmpret7, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab13
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0
    nonlocal tmpret7, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret7 = None
    return
  def __atstmplab12():
    nonlocal arg0
    nonlocal tmpret7, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0
    nonlocal tmpret7, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp9 = arg0[1]
    tmpret7 = (tmp9, )
    return
  mbranch_1 = { 1: __atstmplab10, 2: __atstmplab11, 3: __atstmplab12, 4: __atstmplab13 }
  #__patsflab_list0_tail_opt
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret7


def ats2pypre_ML_list0_length(arg0):
  tmpret10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_length
  tmpret10 = ats2pypre_list_length(arg0)
  return tmpret10


def ats2pypre_ML_list0_last_opt(arg0):
  tmpret11 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab18():
    nonlocal arg0
    nonlocal tmpret11, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab21
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal arg0
    nonlocal tmpret11, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret11 = None
    return
  def __atstmplab20():
    nonlocal arg0
    nonlocal tmpret11, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal arg0
    nonlocal tmpret11, tmp15, tmp16, tmp17
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp15 = arg0[0]
    tmp16 = arg0[1]
    tmp17 = _ats2pypre_ML_list0_loop_7(tmp15, tmp16)
    tmpret11 = (tmp17, )
    return
  mbranch_1 = { 1: __atstmplab18, 2: __atstmplab19, 3: __atstmplab20, 4: __atstmplab21 }
  #__patsflab_list0_last_opt
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret11


def _ats2pypre_ML_list0_loop_7(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret12 = None
  tmp13 = None
  tmp14 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab17
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret12 = arg0
    return
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp13 = arg1[0]
    tmp14 = arg1[1]
    #ATStailcalseq_beg
    apy0 = tmp13
    apy1 = tmp14
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_ML_list0_loop_7
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab14, 2: __atstmplab15, 3: __atstmplab16, 4: __atstmplab17 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_ML_list0_loop_7
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret12


def ats2pypre_ML_list0_get_at_opt(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab22():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret18, tmp19, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab25
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret18, tmp19, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret18 = None
    return
  def __atstmplab24():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret18, tmp19, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab25()
    return
  def __atstmplab25():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret18, tmp19, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp19 = arg0[0]
    tmp20 = arg0[1]
    tmp21 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp21):
      tmp22 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp20
      apy1 = tmp22
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list0_get_at_opt
      #ATStailcalseq_end
    else:
      tmpret18 = (tmp19, )
    #endif
    return
  mbranch_1 = { 1: __atstmplab22, 2: __atstmplab23, 3: __atstmplab24, 4: __atstmplab25 }
  while(1):
    funlab_py = 0
    #__patsflab_list0_get_at_opt
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret18


def ats2pypre_ML_list0_make_intrange_2(arg0, arg1):
  tmpret23 = None
  tmp24 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_make_intrange_2
  tmp24 = ats2pypre_list_make_intrange_2(arg0, arg1)
  tmpret23 = tmp24
  return tmpret23


def ats2pypre_ML_list0_make_intrange_3(arg0, arg1, arg2):
  tmpret25 = None
  tmp26 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_make_intrange_3
  tmp26 = ats2pypre_list_make_intrange_3(arg0, arg1, arg2)
  tmpret25 = tmp26
  return tmpret25


def ats2pypre_ML_list0_snoc(arg0, arg1):
  tmpret38 = None
  tmp39 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_snoc
  tmp39 = ats2pypre_list_snoc(arg0, arg1)
  tmpret38 = tmp39
  return tmpret38


def ats2pypre_ML_list0_extend(arg0, arg1):
  tmpret40 = None
  tmp41 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_extend
  tmp41 = ats2pypre_list_extend(arg0, arg1)
  tmpret40 = tmp41
  return tmpret40


def ats2pypre_ML_list0_append(arg0, arg1):
  tmpret42 = None
  tmp43 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_append
  tmp43 = ats2pypre_list_append(arg0, arg1)
  tmpret42 = tmp43
  return tmpret42


def ats2pypre_ML_list0_reverse(arg0):
  tmpret44 = None
  tmp45 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_reverse
  tmp45 = ats2pypre_list_reverse(arg0)
  tmpret44 = tmp45
  return tmpret44


def ats2pypre_ML_list0_reverse_append(arg0, arg1):
  tmpret46 = None
  tmp47 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_reverse_append
  tmp47 = ats2pypre_list_reverse_append(arg0, arg1)
  tmpret46 = tmp47
  return tmpret46


def ats2pypre_ML_list0_concat(arg0):
  tmpret48 = None
  tmp49 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_concat
  tmp49 = ats2pypre_list_concat(arg0)
  tmpret48 = tmp49
  return tmpret48


def ats2pypre_ML_list0_remove_at_opt(arg0, arg1):
  tmpret50 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_remove_at_opt
  tmpret50 = _ats2pypre_ML_list0_aux_23(arg0, 0)
  return tmpret50


def _ats2pypre_ML_list0_aux_23(arg0, arg1):
  tmpret51 = None
  tmp52 = None
  tmp53 = None
  tmp54 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  tmp58 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab30():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab33
    __atstmplab31()
    return
  def __atstmplab31():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret51 = None
    return
  def __atstmplab32():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab33()
    return
  def __atstmplab33():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp52 = arg0[0]
    tmp53 = arg0[1]
    tmp54 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp54):
      tmp56 = ats2pypre_sub_int1_int1(arg1, 1)
      tmp55 = _ats2pypre_ML_list0_aux_23(tmp53, tmp56)
      #ATScaseofseq_beg
      tmplab_py = 1
      while(1):
        mbranch_2.get(tmplab_py)()
        if (tmplab_py == 0): break
      #ATScaseofseq_end
    else:
      tmpret51 = (tmp53, )
    #endif
    return
  def __atstmplab34():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp55)): tmplab_py = 4 ; return#__atstmplab37
    __atstmplab35()
    return
  def __atstmplab35():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret51 = None
    return
  def __atstmplab36():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab37()
    return
  def __atstmplab37():
    nonlocal arg0, arg1
    nonlocal tmpret51, tmp52, tmp53, tmp54, tmp55, tmp56, tmp57, tmp58
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp57 = tmp55[0]
    tmp58 = (tmp52, tmp57)
    tmpret51 = (tmp58, )
    return
  mbranch_1 = { 1: __atstmplab30, 2: __atstmplab31, 3: __atstmplab32, 4: __atstmplab33 }
  mbranch_2 = { 1: __atstmplab34, 2: __atstmplab35, 3: __atstmplab36, 4: __atstmplab37 }
  #__patsflab__ats2pypre_ML_list0_aux_23
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret51


def ats2pypre_ML_list0_exists(arg0, arg1):
  tmpret59 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_exists
  tmpret59 = ats2pypre_list_exists(arg0, arg1)
  return tmpret59


def ats2pypre_ML_list0_exists_method(arg0):
  tmpret60 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_exists_method
  tmpret60 = _ats2pypre_ML_list0_patsfun_26__closurerize(arg0)
  return tmpret60


def _ats2pypre_ML_list0_patsfun_26(env0, arg0):
  tmpret61 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_26
  tmpret61 = ats2pypre_ML_list0_exists(env0, arg0)
  return tmpret61


def ats2pypre_ML_list0_iexists(arg0, arg1):
  tmpret62 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iexists
  tmpret62 = ats2pypre_list_iexists(arg0, arg1)
  return tmpret62


def ats2pypre_ML_list0_iexists_method(arg0):
  tmpret63 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iexists_method
  tmpret63 = _ats2pypre_ML_list0_patsfun_29__closurerize(arg0)
  return tmpret63


def _ats2pypre_ML_list0_patsfun_29(env0, arg0):
  tmpret64 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_29
  tmpret64 = ats2pypre_ML_list0_iexists(env0, arg0)
  return tmpret64


def ats2pypre_ML_list0_forall(arg0, arg1):
  tmpret65 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_forall
  tmpret65 = ats2pypre_list_forall(arg0, arg1)
  return tmpret65


def ats2pypre_ML_list0_forall_method(arg0):
  tmpret66 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_forall_method
  tmpret66 = _ats2pypre_ML_list0_patsfun_32__closurerize(arg0)
  return tmpret66


def _ats2pypre_ML_list0_patsfun_32(env0, arg0):
  tmpret67 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_32
  tmpret67 = ats2pypre_ML_list0_forall(env0, arg0)
  return tmpret67


def ats2pypre_ML_list0_iforall(arg0, arg1):
  tmpret68 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforall
  tmpret68 = ats2pypre_list_iforall(arg0, arg1)
  return tmpret68


def ats2pypre_ML_list0_iforall_method(arg0):
  tmpret69 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforall_method
  tmpret69 = _ats2pypre_ML_list0_patsfun_35__closurerize(arg0)
  return tmpret69


def _ats2pypre_ML_list0_patsfun_35(env0, arg0):
  tmpret70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_35
  tmpret70 = ats2pypre_ML_list0_iforall(env0, arg0)
  return tmpret70


def ats2pypre_ML_list0_app(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_app
  ats2pypre_ML_list0_foreach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_foreach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foreach
  ats2pypre_list_foreach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_foreach_method(arg0):
  tmpret73 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foreach_method
  tmpret73 = _ats2pypre_ML_list0_patsfun_39__closurerize(arg0)
  return tmpret73


def _ats2pypre_ML_list0_patsfun_39(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_39
  ats2pypre_ML_list0_foreach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_iforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforeach
  ats2pypre_list_iforeach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_iforeach_method(arg0):
  tmpret76 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforeach_method
  tmpret76 = _ats2pypre_ML_list0_patsfun_42__closurerize(arg0)
  return tmpret76


def _ats2pypre_ML_list0_patsfun_42(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_42
  ats2pypre_ML_list0_iforeach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_rforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_rforeach
  ats2pypre_list_rforeach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_rforeach_method(arg0):
  tmpret79 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_rforeach_method
  tmpret79 = _ats2pypre_ML_list0_patsfun_45__closurerize(arg0)
  return tmpret79


def _ats2pypre_ML_list0_patsfun_45(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_45
  ats2pypre_ML_list0_rforeach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_filter(arg0, arg1):
  tmpret81 = None
  tmp82 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_filter
  tmp82 = ats2pypre_list_filter(arg0, arg1)
  tmpret81 = tmp82
  return tmpret81


def ats2pypre_ML_list0_filter_method(arg0):
  tmpret83 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_filter_method
  tmpret83 = _ats2pypre_ML_list0_patsfun_48__closurerize(arg0)
  return tmpret83


def _ats2pypre_ML_list0_patsfun_48(env0, arg0):
  tmpret84 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_48
  tmpret84 = ats2pypre_ML_list0_filter(env0, arg0)
  return tmpret84


def ats2pypre_ML_list0_map(arg0, arg1):
  tmpret85 = None
  tmp86 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_map
  tmp86 = ats2pypre_list_map(arg0, arg1)
  tmpret85 = tmp86
  return tmpret85


def ats2pypre_ML_list0_map_method(arg0, arg1):
  tmpret87 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_map_method
  tmpret87 = _ats2pypre_ML_list0_patsfun_51__closurerize(arg0)
  return tmpret87


def _ats2pypre_ML_list0_patsfun_51(env0, arg0):
  tmpret88 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_51
  tmpret88 = ats2pypre_ML_list0_map(env0, arg0)
  return tmpret88


def ats2pypre_ML_list0_mapcons(arg0, arg1):
  tmpret89 = None
  tmp90 = None
  tmp91 = None
  tmp92 = None
  tmp93 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab38():
    nonlocal arg0, arg1
    nonlocal tmpret89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab41
    __atstmplab39()
    return
  def __atstmplab39():
    nonlocal arg0, arg1
    nonlocal tmpret89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret89 = None
    return
  def __atstmplab40():
    nonlocal arg0, arg1
    nonlocal tmpret89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab41()
    return
  def __atstmplab41():
    nonlocal arg0, arg1
    nonlocal tmpret89, tmp90, tmp91, tmp92, tmp93
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp90 = arg1[0]
    tmp91 = arg1[1]
    tmp92 = (arg0, tmp90)
    tmp93 = ats2pypre_ML_list0_mapcons(arg0, tmp91)
    tmpret89 = (tmp92, tmp93)
    return
  mbranch_1 = { 1: __atstmplab38, 2: __atstmplab39, 3: __atstmplab40, 4: __atstmplab41 }
  #__patsflab_list0_mapcons
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret89


def ats2pypre_ML_list0_find_opt(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret94 = None
  tmp95 = None
  tmp96 = None
  tmp97 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab42():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret94, tmp95, tmp96, tmp97
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab45
    __atstmplab43()
    return
  def __atstmplab43():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret94, tmp95, tmp96, tmp97
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret94 = None
    return
  def __atstmplab44():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret94, tmp95, tmp96, tmp97
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab45()
    return
  def __atstmplab45():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret94, tmp95, tmp96, tmp97
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp95 = arg0[0]
    tmp96 = arg0[1]
    tmp97 = arg1[0](arg1, tmp95)
    if (tmp97):
      tmpret94 = (tmp95, )
    else:
      #ATStailcalseq_beg
      apy0 = tmp96
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list0_find_opt
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab42, 2: __atstmplab43, 3: __atstmplab44, 4: __atstmplab45 }
  while(1):
    funlab_py = 0
    #__patsflab_list0_find_opt
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret94


def ats2pypre_ML_list0_zip(arg0, arg1):
  tmpret98 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_zip
  tmpret98 = _ats2pypre_ML_list0_aux_55(arg0, arg1)
  return tmpret98


def _ats2pypre_ML_list0_aux_55(arg0, arg1):
  tmpret99 = None
  tmp100 = None
  tmp101 = None
  tmp102 = None
  tmp103 = None
  tmp104 = None
  tmp105 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab46():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab49
    __atstmplab47()
    return
  def __atstmplab47():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret99 = None
    return
  def __atstmplab48():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab49()
    return
  def __atstmplab49():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp100 = arg0[0]
    tmp101 = arg0[1]
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab50():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab53
    __atstmplab51()
    return
  def __atstmplab51():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret99 = None
    return
  def __atstmplab52():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab53()
    return
  def __atstmplab53():
    nonlocal arg0, arg1
    nonlocal tmpret99, tmp100, tmp101, tmp102, tmp103, tmp104, tmp105
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp102 = arg1[0]
    tmp103 = arg1[1]
    tmp104 = (tmp100, tmp102)
    tmp105 = _ats2pypre_ML_list0_aux_55(tmp101, tmp103)
    tmpret99 = (tmp104, tmp105)
    return
  mbranch_1 = { 1: __atstmplab46, 2: __atstmplab47, 3: __atstmplab48, 4: __atstmplab49 }
  mbranch_2 = { 1: __atstmplab50, 2: __atstmplab51, 3: __atstmplab52, 4: __atstmplab53 }
  #__patsflab__ats2pypre_ML_list0_aux_55
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret99


def ats2pypre_ML_list0_zipwith(arg0, arg1, arg2):
  tmpret106 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_zipwith
  tmpret106 = _ats2pypre_ML_list0_aux_57(arg0, arg1, arg2)
  return tmpret106


def _ats2pypre_ML_list0_aux_57(arg0, arg1, arg2):
  tmpret107 = None
  tmp108 = None
  tmp109 = None
  tmp110 = None
  tmp111 = None
  tmp112 = None
  tmp113 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab54():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab57
    __atstmplab55()
    return
  def __atstmplab55():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret107 = None
    return
  def __atstmplab56():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab57()
    return
  def __atstmplab57():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp108 = arg0[0]
    tmp109 = arg0[1]
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab58():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab61
    __atstmplab59()
    return
  def __atstmplab59():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret107 = None
    return
  def __atstmplab60():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab61()
    return
  def __atstmplab61():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret107, tmp108, tmp109, tmp110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp110 = arg1[0]
    tmp111 = arg1[1]
    tmp112 = arg2[0](arg2, tmp108, tmp110)
    tmp113 = _ats2pypre_ML_list0_aux_57(tmp109, tmp111, arg2)
    tmpret107 = (tmp112, tmp113)
    return
  mbranch_1 = { 1: __atstmplab54, 2: __atstmplab55, 3: __atstmplab56, 4: __atstmplab57 }
  mbranch_2 = { 1: __atstmplab58, 2: __atstmplab59, 3: __atstmplab60, 4: __atstmplab61 }
  #__patsflab__ats2pypre_ML_list0_aux_57
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret107


def ats2pypre_ML_list0_zipwith_method(arg0, arg1):
  tmpret114 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_zipwith_method
  tmpret114 = _ats2pypre_ML_list0_patsfun_59__closurerize(arg0, arg1)
  return tmpret114


def _ats2pypre_ML_list0_patsfun_59(env0, env1, arg0):
  tmpret115 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_59
  tmpret115 = ats2pypre_ML_list0_zipwith(env0, env1, arg0)
  return tmpret115


def ats2pypre_ML_list0_foldleft(arg0, arg1, arg2):
  tmpret116 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foldleft
  tmpret116 = _ats2pypre_ML_list0_aux_61(arg2, arg1, arg0)
  return tmpret116


def _ats2pypre_ML_list0_aux_61(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret117 = None
  tmp118 = None
  tmp119 = None
  tmp120 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab62():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab65
    __atstmplab63()
    return
  def __atstmplab63():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret117 = arg0
    return
  def __atstmplab64():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab65()
    return
  def __atstmplab65():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp118 = arg1[0]
    tmp119 = arg1[1]
    tmp120 = env0[0](env0, arg0, tmp118)
    #ATStailcalseq_beg
    apy0 = tmp120
    apy1 = tmp119
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_ML_list0_aux_61
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab62, 2: __atstmplab63, 3: __atstmplab64, 4: __atstmplab65 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_ML_list0_aux_61
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret117


def ats2pypre_ML_list0_foldright(arg0, arg1, arg2):
  tmpret121 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foldright
  tmpret121 = _ats2pypre_ML_list0_aux_63(arg1, arg2, arg0, arg2)
  return tmpret121


def _ats2pypre_ML_list0_aux_63(env0, env1, arg0, arg1):
  tmpret122 = None
  tmp123 = None
  tmp124 = None
  tmp125 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab66():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret122, tmp123, tmp124, tmp125
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab69
    __atstmplab67()
    return
  def __atstmplab67():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret122, tmp123, tmp124, tmp125
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret122 = arg1
    return
  def __atstmplab68():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret122, tmp123, tmp124, tmp125
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab69()
    return
  def __atstmplab69():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret122, tmp123, tmp124, tmp125
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp123 = arg0[0]
    tmp124 = arg0[1]
    tmp125 = _ats2pypre_ML_list0_aux_63(env0, env1, tmp124, env1)
    tmpret122 = env0[0](env0, tmp123, tmp125)
    return
  mbranch_1 = { 1: __atstmplab66, 2: __atstmplab67, 3: __atstmplab68, 4: __atstmplab69 }
  #__patsflab__ats2pypre_ML_list0_aux_63
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret122


def ats2pypre_ML_list0_sort_2(arg0, arg1):
  tmpret128 = None
  tmp129 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_sort_2
  tmp129 = ats2pypre_list_sort_2(arg0, arg1)
  tmpret128 = tmp129
  return tmpret128


def ats2pypre_ML_streamize_list0_zip(arg0, arg1):
  tmpret130 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_streamize_list0_zip
  tmpret130 = ats2pypre_streamize_list_zip(arg0, arg1)
  return tmpret130


def ats2pypre_ML_streamize_list0_cross(arg0, arg1):
  tmpret131 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_streamize_list0_cross
  tmpret131 = ats2pypre_streamize_list_cross(arg0, arg1)
  return tmpret131

######
##
## end-of-compilation-unit
##
######
######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-12-18: 13h:18m
##
######

#ATSassume(ATSCC2PY3_056_basics__array0_vt0ype_type)

def _ats2pypre_ML_array0_patsfun_7__closurerize(env0):
  def _ats2pypre_ML_array0_patsfun_7__cfun(cenv, arg0): return _ats2pypre_ML_array0_patsfun_7(cenv[1], arg0)
  return (_ats2pypre_ML_array0_patsfun_7__cfun, env0)

def _ats2pypre_ML_array0_patsfun_10__closurerize(env0):
  def _ats2pypre_ML_array0_patsfun_10__cfun(cenv, arg0): return _ats2pypre_ML_array0_patsfun_10(cenv[1], arg0)
  return (_ats2pypre_ML_array0_patsfun_10__cfun, env0)

def _ats2pypre_ML_array0_patsfun_14__closurerize(env0):
  def _ats2pypre_ML_array0_patsfun_14__cfun(cenv, arg0): return _ats2pypre_ML_array0_patsfun_14(cenv[1], arg0)
  return (_ats2pypre_ML_array0_patsfun_14__cfun, env0)

def ats2pypre_ML_array0_make_elt(arg0, arg1):
  tmpret0 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_make_elt
  tmpret0 = ats2pypre_arrszref_make_elt(arg0, arg1)
  return tmpret0


def ats2pypre_ML_array0_size(arg0):
  tmpret1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_size
  tmpret1 = ats2pypre_arrszref_size(arg0)
  return tmpret1


def ats2pypre_ML_array0_get_at(arg0, arg1):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_get_at
  tmpret2 = ats2pypre_arrszref_get_at(arg0, arg1)
  return tmpret2


def ats2pypre_ML_array0_set_at(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_set_at
  ats2pypre_arrszref_set_at(arg0, arg1, arg2)
  return#_void


def ats2pypre_ML_array0_exch_at(arg0, arg1, arg2):
  tmpret4 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_exch_at
  tmpret4 = ats2pypre_arrszref_exch_at(arg0, arg1, arg2)
  return tmpret4


def ats2pypre_ML_array0_exists_cloref(arg0, arg1):
  tmpret5 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_exists_cloref
  tmpret5 = ats2pypre_arrszref_exists_cloref(arg0, arg1)
  return tmpret5


def ats2pypre_ML_array0_exists_method(arg0):
  tmpret6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_exists_method
  tmpret6 = _ats2pypre_ML_array0_patsfun_7__closurerize(arg0)
  return tmpret6


def _ats2pypre_ML_array0_patsfun_7(env0, arg0):
  tmpret7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_array0_patsfun_7
  tmpret7 = ats2pypre_ML_array0_exists_cloref(env0, arg0)
  return tmpret7


def ats2pypre_ML_array0_forall_cloref(arg0, arg1):
  tmpret8 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_forall_cloref
  tmpret8 = ats2pypre_arrszref_forall_cloref(arg0, arg1)
  return tmpret8


def ats2pypre_ML_array0_forall_method(arg0):
  tmpret9 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_forall_method
  tmpret9 = _ats2pypre_ML_array0_patsfun_10__closurerize(arg0)
  return tmpret9


def _ats2pypre_ML_array0_patsfun_10(env0, arg0):
  tmpret10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_array0_patsfun_10
  tmpret10 = ats2pypre_ML_array0_forall_cloref(env0, arg0)
  return tmpret10


def ats2pypre_ML_array0_app_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_app_cloref
  ats2pypre_ML_array0_foreach_cloref(arg0, arg1)
  return#_void


def ats2pypre_ML_array0_foreach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_foreach_cloref
  ats2pypre_arrszref_foreach_cloref(arg0, arg1)
  return#_void


def ats2pypre_ML_array0_foreach_method(arg0):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_array0_foreach_method
  tmpret13 = _ats2pypre_ML_array0_patsfun_14__closurerize(arg0)
  return tmpret13


def _ats2pypre_ML_array0_patsfun_14(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_array0_patsfun_14
  ats2pypre_ML_array0_foreach_cloref(env0, arg0)
  return#_void

######
##
## end-of-compilation-unit
##
######
